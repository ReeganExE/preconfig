# Copy of AVIT ZSH Theme https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/avit.zsh-theme

# settings
typeset +H _current_dir="%{$fg_bold[black]%}%d%{$reset_color%} "
typeset +H _return_status="%{$fg_bold[red]%}%(?..⍉)%{$reset_color%}"
typeset +H _hist_no="%{$fg[grey]%}%h%{$reset_color%}"

# 256 colors can be used like so: %{$FG[240]%}<code here>%{$reset_color%}

PROMPT='
$(_user_host)${_current_dir} $(git_prompt_info) $(ruby_prompt_info)
%{%F{white}%}▶%{$reset_color%} '

PROMPT2='%{%(!.%F{red}.%F{white})%}◀%{$reset_color%} '

# disabled right prompt
#RPROMPT='$(vi_mode_prompt_info)%{$(echotc UP 1)%}$(_git_time_since_commit) $(git_prompt_status) ${_return_status}%{$(echotc DO 1)%}'

function _user_host() {
  local me
  local color=black
  local host_machine="%{$FG[1]%}%m%{$reset_color%}"

  if [[ -n $SSH_CONNECTION ]]; then
    color="magenta"
  fi
  if [[ $USER = "root" ]]; then
    color="red"
  fi

  me="%{$fg_bold[$color]%}%n%{$reset_color%}"

  if [[ -n $SSH_CONNECTION ]]; then
    echo "[$me - $host_machine] "
  elif [[ "kleiner" != $USER ]]; then
    echo "[$me] "
  fi
}

# Determine the time since last commit. If branch is clean,
# use a neutral color, otherwise colors will vary according to time.
function _git_time_since_commit() {
  local last_commit now seconds_since_last_commit
  local minutes hours days years commit_age
  # Only proceed if there is actually a commit.
  if last_commit=$(git log --pretty=format:'%at' -1 2> /dev/null); then
    now=$(date +%s)
    seconds_since_last_commit=$((now-last_commit))

    # Totals
    minutes=$((seconds_since_last_commit / 60))
    hours=$((minutes / 60))
    days=$((hours / 24))
    years=$((days / 365))

    if [[ $years -gt 0 ]]; then
      commit_age="${years}y$((days % 365 ))d"
    elif [[ $days -gt 0 ]]; then
      commit_age="${days}d$((hours % 24))h"
    elif [[ $hours -gt 0 ]]; then
      commit_age+="${hours}h$(( minutes % 60 ))m"
    else
      commit_age="${minutes}m"
    fi

    echo "${ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL}${commit_age}%{$reset_color%}"
  fi
}

MODE_INDICATOR="%{$fg_bold[yellow]%}❮%{$reset_color%}%{$fg[yellow]%}❮❮%{$reset_color%}"

# Git prompt settings
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}✚ "
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%}⚑ "
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✖ "
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%}▴ "
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[cyan]%}§ "
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[white]%}◒ "

# Ruby prompt settings
ZSH_THEME_RUBY_PROMPT_PREFIX="%{$fg[grey]%}"
ZSH_THEME_RUBY_PROMPT_SUFFIX="%{$reset_color%}"

# Colors vary depending on time lapsed.
ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT="%{$fg[green]%}"
ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM="%{$fg[yellow]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG="%{$fg[red]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL="%{$fg[white]%}"

# LS colors, made with https://geoff.greer.fm/lscolors/
export LS_COLORS="di=34:ln=36:so=35:pi=33;40:ex=32:bd=1;33;40:cd=1;33;40:su=0;41:sg=30"
export LSCOLORS="exgxfxdacxDaDaxbadacex"

export GREP_COLOR='1;33'