autoload -Uz compinit promptinit
compinit
promptinit

PROMPT='%2~ %F{red}>%f '
RPROMPT='[%#]'

alias rorph='pacman -Qdtq | sudo pacman -Rns -'
