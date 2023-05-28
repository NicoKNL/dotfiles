import json
import os


def formatData(m):
    return [(os.path.abspath(k), os.path.expanduser(v)) for k, v in m.items()]


def link(data):
    print(data)
    for source, target in data:
        print(f"source: {source} -- target: {target}")
        if os.path.isfile(target) or os.path.islink(target):
            os.remove(target)
        os.symlink(source, target)


if __name__ == "__main__":
    with open("dotmap.json") as fh:
        mapping = json.load(fh)
        print(mapping)

        for k, v in mapping["link"].items():
            print(k, v)

        if "link" in mapping:
            data = formatData(mapping["link"])
            link(data)
