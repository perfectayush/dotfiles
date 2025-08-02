if status is-interactive
    # Commands to run in interactive sessions can go here
    # Initialize external softwares
    macchina -s

    # enable starship transience
    enable_transience
end

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/ayush/.lmstudio/bin
