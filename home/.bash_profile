alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias ls="ls -G"
alias rc='/Users/jackmakiyama/Development/RC/rc'

git_parse_dirty()
{
    test "$(git diff HEAD --name-only  2>/dev/null 2>&1)" \
        && echo " *"
}

git_branch_name()
{
    git branch 2>/dev/null \
      | grep -e "^*" \
      | sed -E "s/^\* (.+)$/(\1$(git_parse_dirty)) /"
}

PS1="\[\e[0;34m\][\w]\[\e[0m\] \[\033[0;31m\]\$(type git_branch_name &>/dev/null && git_branch_name)\[\e[0m\]$ "
export PS1

PROMPT_COMMAND='echo -ne "\033]0; ${PWD##*/}\007"'

# charger tmux airline
vim +qall
