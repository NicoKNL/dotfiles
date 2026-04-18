#!/usr/bin/env python3
"""
dot.py — dotfiles deploy script

Usage:
  python3 dot.py            # interactive mode (prompts on conflicts)
  python3 dot.py --dry-run  # show what would happen, no changes
  python3 dot.py --force    # overwrite all conflicts without prompting
"""

import argparse
import json
import os
import shutil
import sys

# Resolve dotfiles root relative to this script — works from any cwd
DOTFILES_ROOT = os.path.dirname(os.path.abspath(__file__))
DOTMAP = os.path.join(DOTFILES_ROOT, "dotmap.json")


def resolve(source_rel, target_raw):
    source = os.path.join(DOTFILES_ROOT, source_rel)
    target = os.path.expanduser(target_raw)
    return source, target


def prompt(message):
    """Ask user y/n. Returns True if yes."""
    while True:
        answer = input(f"{message} [y/n] ").strip().lower()
        if answer in ("y", "yes"):
            return True
        if answer in ("n", "no"):
            return False


def backup(path):
    bak = path + ".bak"
    # If .bak already exists, number it
    i = 1
    while os.path.exists(bak):
        bak = f"{path}.bak{i}"
        i += 1
    shutil.move(path, bak)
    return bak


def link_entry(source, target, dry_run=False, force=False):
    """
    Link source -> target. Returns status string.
    """
    # Ensure source exists
    if not os.path.exists(source):
        return ("error", f"source does not exist: {source}")

    # Ensure parent directory exists
    parent = os.path.dirname(target)
    if parent and not os.path.exists(parent):
        if dry_run:
            print(f"  [dry-run] would create parent dir: {parent}")
        else:
            os.makedirs(parent, exist_ok=True)

    # Case 1: correct symlink already
    if os.path.islink(target) and os.path.realpath(target) == os.path.realpath(source):
        return ("skipped", "already correct symlink")

    # Case 2: wrong symlink
    if os.path.islink(target):
        existing = os.readlink(target)
        if not dry_run and not force:
            if not prompt(f"  [{target}] is a symlink pointing to {existing}. Relink?"):
                return ("skipped", "user skipped")
        if not dry_run:
            os.remove(target)
        return _do_link(source, target, dry_run, note="relinked")

    # Case 3: real file or directory
    if os.path.exists(target):
        kind = "directory" if os.path.isdir(target) else "file"
        if not dry_run and not force:
            if not prompt(f"  [{target}] is a real {kind}. Back up and replace?"):
                return ("skipped", "user skipped")
        if not dry_run:
            bak = backup(target)
            print(f"  [backed up] {target} -> {bak}")
        return _do_link(source, target, dry_run, note=f"replaced real {kind}")

    # Case 4: nothing there
    return _do_link(source, target, dry_run)


def _do_link(source, target, dry_run, note=None):
    if dry_run:
        msg = f"would link: {source} -> {target}"
        if note:
            msg += f" ({note})"
        return ("dry-run", msg)
    os.symlink(source, target)
    return ("linked", note or "")


def main():
    parser = argparse.ArgumentParser(description="Deploy dotfiles via symlinks.")
    parser.add_argument("--dry-run", action="store_true", help="Show what would happen without making changes.")
    parser.add_argument("--force", action="store_true", help="Overwrite conflicts without prompting.")
    args = parser.parse_args()

    if args.dry_run and args.force:
        print("Error: --dry-run and --force are mutually exclusive.")
        sys.exit(1)

    with open(DOTMAP) as fh:
        mapping = json.load(fh)

    counts = {"linked": 0, "skipped": 0, "dry-run": 0, "error": 0}

    for source_rel, target_raw in mapping.get("link", {}).items():
        source, target = resolve(source_rel, target_raw)
        status, detail = link_entry(source, target, dry_run=args.dry_run, force=args.force)
        counts[status] = counts.get(status, 0) + 1

        label = f"[{status}]".ljust(12)
        line = f"{label} {source_rel} -> {target_raw}"
        if detail and status not in ("linked",):
            line += f"  ({detail})"
        print(line)

    print()
    if args.dry_run:
        print(f"Dry run complete. {counts['dry-run']} would be linked.")
    else:
        print(f"{counts['linked']} linked, {counts['skipped']} skipped, {counts['error']} errors.")


if __name__ == "__main__":
    main()
