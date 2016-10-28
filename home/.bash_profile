alias ls="ls -G"
alias 'git-phpcs'='phpcs --standard=PSR2 $(git diff --name-only origin/master --diff-filter=ACMRTUXB | grep .php)'
alias 'git-phpcbf'='phpcbf --standard=PSR2 --no-patch $(git diff --name-only origin/master --diff-filter=ACMRTUXB | grep .php)'
alias dos2unixfix='find . -type f -exec dos2unix {} \;'

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

# charger tmuxline
# vim +qall

# PHP 5.6
#export PATH=/usr/local/php5/bin:$PATH

# Composer Global
export PATH=~/.composer/vendor/bin:$PATH

set -o vi
bind -m vi-insert "\C-l":clear-screen

#eval "$(docker-machine env default)"

source /Users/jackmakiyama/Development/bash-wakatime/bash-wakatime.sh

clear
