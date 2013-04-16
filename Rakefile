require 'rake'
require 'fileutils'

namespace :dot do
  home = ENV['HOME']
  pwd  = Fileutils.pwd
  
  desc "install all"
  task :all do
    RAKE::TASK[:zsh].invoke
    RAKE::TASK[:ackrc].invoke
    RAKE::TASK[:emacs].invoke
  end
  desc "install emacs config"
  task :emacs do
    puts "Installing emacs config ..."
    FileUtils.makedir_p(home + "/.emacs.d/custom/")
    FileUtils.ln_s(pwd + "/emacs.d/init.el", home + "/.emacs.d/")
    Dir.glob(pwd + "/emacs.d/*.el") do |elisp|
      FileUtils.ln_s(elisp, home + "/.emacs.d/" + elisp)
    end
  end
  
  desc "install zsh config"
  task :zsh do
    puts "Installing zsh config ..."
    Rake::Task["prezto"].invoke
    FileUtils.ln_s(pwd + "/zsh/zshrc", home + "/.zshrc")
    FileUtils.ln_s(pwd + "/zsh/zpreztorc", home + "/.zpreztorc")
    FileUtils.ln_s(pwd + "/zsh/prompt_archaic_setup", home + "/.zprezto/modules/prompt/functions/prompt_archaic_setup")
    end
  end
    
  desc "Install prezto ..."
  task :prezto do
    begin
      puts "Installing prezto"
      run %{ git clone --recursive https://github.com/sorin-ionescu/prezto.git #{home}/.zprezto }
    rescue
      puts "Failed while installing prezto from internet"
    end
  end
    
  
  desc "install ack config"
  task :ack do
    puts "Installing ack config ..."
    FileUtils.ln_s(pwd + "/emacs.d/ackrc", home + "/.emacs.d/.ackrc")
  end
   
end
