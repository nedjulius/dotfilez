if status is-interactive
    # Commands to run in interactive sessions can go here
end

# PNPM configuration
# set the environment variable PNPM_HOME
set -x PNPM_HOME "/Users/juliusned/Library/pnpm"

# Check if the PNPM_HOME is in the PATH
if not contains $PNPM_HOME $PATH
    # if not, then add it to the PATH
    set -U fish_user_paths $PNPM_HOME $fish_user_paths
end

# opam configuration
source /Users/juliusned/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
alias pn=pnpm
