function cnet
    set -f endpoint $argv[1]
    test -z $endpoint; and set -f endpoint "1.1.1.1"
    ping $endpoint
end
