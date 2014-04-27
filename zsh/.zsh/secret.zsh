#
# Load secrets.
#

if [[ -s "${ZDOTDIR:-$HOME}/.secrets" ]]; then
  source "${ZDOTDIR:-$HOME}/.secrets"
fi
