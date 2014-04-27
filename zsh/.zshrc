#
# Initialize ZSH session.
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Load all config files.
for file in "${ZDOTDIR:-$HOME}"/.zsh/*.zsh; do
  source "${ZDOTDIR:-$HOME}/.zsh/${file:t}"
done
