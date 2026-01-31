# Disable fish greeting
set fish_greeting

# Stop brew updating every so often
set -gx HOMEBREW_AUTO_UPDATE_SECS 86400

# Editors etc.
set -gx EDITOR "/opt/homebrew/bin/emacsclient -c -a vim"
set -gx VISUAL "emacsclient -c -a vim"
set -gx PAGER "less -S -R"

# Setup emacs socket name
set -gx EMACS_SOCKET_NAME "$HOME/.emacs.d/server/server"

# Add homebrew path
set -gx PATH $PATH /opt/homebrew/bin

# Added by LM Studio CLI (lms)
set -gx PATH $PATH $HOME/.lmstudio/bin
set -gx PATH $PATH /opt/homebrew/opt/postgresql@18/bin

# Add /usr/sbin
set -gx PATH $PATH /usr/sbin
set -gx PATH $PATH $HOME/.bun/bin

# AWS
set -gx AWS_DEFAULT_PROFILE admin
