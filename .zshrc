export PATH=/opt/homebrew/bin:$PATH
export PATH=/Applications/nvim/bin:$PATH

alias solmake="clang++ --std=c++17 -o sol sol.cpp"

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git)
source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="/opt/homebrew/opt/node@16/bin:$PATH"

if [ -z "$TMUX" ]
then
    tmux attach -t TMUX || tmux new -s TMUX
fi