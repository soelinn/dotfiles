# load dotfiles
for file in ~/.{aliases,bash_prompt}; do
  [ -r "$file" ] && [ -f "$file" ] && . "$file";
done;
unset file;

# Auto add the ssh key by checking SSH Agent agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2=agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)
if [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
    ssh-add --apple-use-keychain ~/.ssh/id_ed25519
fi
unset agent_run_state

# Add Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Add GPG key to agent
export GPG_TTY=$(tty)

# tab completion for Homebrew
if which brew &> /dev/null && [ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]; then
  # don't break Homebrew v1 completions
  export BASH_COMPLETION_COMPAT_DIR="$(brew --prefix)/etc/bash_completion.d";
  source "$(brew --prefix)/etc/profile.d/bash_completion.sh";
elif [ -f /etc/bash_completion ]; then
  . /etc/bash_completion;
fi;
