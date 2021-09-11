# load dotfiles
for file in ~/.{aliases,bash_prompt}; do
  [ -r "$file" ] && [ -f "$file" ] && . "$file";
done;
unset file;


# tab completion for Homebrew
if which brew &> /dev/null && [ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]; then
  # don't break Homebrew v1 completions
  export BASH_COMPLETION_COMPAT_DIR="$(brew --prefix)/etc/bash_completion.d";
  source "$(brew --prefix)/etc/profile.d/bash_completion.sh";
elif [ -f /etc/bash_completion ]; then
  . /etc/bash_completion;
fi;
