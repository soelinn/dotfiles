#!/usr/bin/env zsh

# Highlight the user name when logged in as root.
if [[ "${USER}" == "root" ]]; then
	userStyle="%F{red}";
else
	userStyle="%F{8}";
fi;

# Highlight the hostname when connected via SSH.
# if [[ "${SSH_TTY}" ]]; then
# 	hostStyle="%F{red}";
# else
# 	hostStyle="%F{yellow}";
# fi;

autoload -Uz vcs_info  # enable vcs_info
precmd () { vcs_info } # this needs prompt_subst set
setopt prompt_subst

# zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat  '%b%F{1}:%F{3}%r'
zstyle ':vcs_info:*'                actionformats '%F{199}(%b%F{3}|%F{1}%a%F{199})%f '
# zstyle ':vcs_info:*'              formats       ' %F{white}on%f %s(%F{red}%b%f)'
zstyle ':vcs_info:*'                formats       '%F{199}(%b)%f '

PROMPT="%B${userStyle}%n%f%b " # user name
#PROMPT+='%B%F{white} at %f%b'
#PROMPT+="%B$hostStyle%m%f%b"  # machine name
#PROMPT+='%B%F{white} in %f%b'
PROMPT+='%B%F{10}%3~%f%b '  # working folder path
PROMPT+='${vcs_info_msg_0_}'  # git repo details
PROMPT+="%B${userStyle}%# %f%b"

PROMPT2='%F{yellow}→ %f';

unset userStyle
unset hostStyle
