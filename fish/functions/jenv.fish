set -gx PATH '/Users/ayush/.jenv/shims' $PATH
set -gx JENV_SHELL fish
set -gx JENV_LOADED 1
set -e JAVA_HOME
set -e JDK_HOME
source '/opt/homebrew/Cellar/jenv/0.5.7/libexec/libexec/../completions/jenv.fish'
jenv rehash 2>/dev/null
jenv refresh-plugins
function jenv
  set command $argv[1]
  set -e argv[1]

  switch "$command"
  case enable-plugin rehash shell shell-options
    jenv "sh-$command" $argv | source
  case '*'
    command jenv "$command" $argv
  end
end
