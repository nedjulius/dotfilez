if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Disable the fish greeting message
set fish_greeting ""
 
# Print a new line after any command
source ~/.config/fish/functions/postexec_newline.fish

# Setup brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Auto-switch nvm version on cd
# Requires a ~/.node-version file with a valid node version
# https://github.com/jorgebucaran/nvm.fish/pull/186
if type -q nvm
  function __nvm_auto --on-variable PWD
  nvm use --silent 2>/dev/null # Comment out the silent flag for debugging
  end
  __nvm_auto
end

# PNPM configuration
# set the environment variable PNPM_HOME
set -x PNPM_HOME "$HOME/Library/pnpm"

# Check if the PNPM_HOME is in the PATH
if not contains $PNPM_HOME $PATH
    # if not, then add it to the PATH
    set -U fish_user_paths $PNPM_HOME $fish_user_paths
end

# opam configuration
source $HOME/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
alias pn=pnpm
