require 'rake'
require 'fileutils'

namespace :dot do
  home = ENV['HOME']
  pwd  = FileUtils.pwd
  
  desc "install all"
  task :all do
    RAKE::TASK[:zsh].invoke
    RAKE::TASK[:emacs].invoke
    RAKE::TASK[:tmux].invoke
  end
  
  desc "install emacs config"
  task :emacs do
    puts "Installing emacs config ..."
    FileUtils.mkdir_p(home + "/.emacs.d/custom/")
    FileUtils.ln_s(pwd + "/emacs.d/init.el", home + "/.emacs.d/",:force => true)
    Dir[ pwd + "/emacs.d/custom/*"].each do |elisp|
      FileUtils.ln_s(elisp, home + "/.emacs.d/custom/" + File.basename(elisp),:force => true)
    end
  end
  
  desc "install zsh config"
  task :zsh do
    puts "Installing zsh config ..."

    Rake::Task["prezto"].invoke unless File.exists?(home + "/.zprezto")

    FileUtils.ln_s(pwd + "/zsh/zshrc", home + "/.zshrc",:force => true)
    FileUtils.ln_s(pwd + "/zsh/zpreztorc", home + "/.zpreztorc",:force => true)
    FileUtils.ln_s(pwd + "/zsh/prompt_archaic_setup",
                   home + "/.zprezto/modules/prompt/functions/prompt_archaic_setup",
                  :force => true)
  end
    
  desc "install prezto"
  task :prezto do
    begin
      puts "Installing prezto"
      unless File.exists?(home + "/.zprezto")
        `git clone --recursive https://github.com/sorin-ionescu/prezto.git #{home}/.zprezto`
      end
      Dir[home + "/.zprezto/runcoms/*"].reject{|f| f[/rc$|md$/]}.each do |file|
        FileUtils.ln_s(file,home + "/." + File.basename(file),:force => true)
      end
    rescue => e
      puts e
      puts "Failed while installing prezto from internet"
    end
  end
    
  desc "install tmux config"
  task :tmux do
    puts "Installing tmux config ..."
    FileUtils.ln_s(pwd + "/tmux.conf", home + "/.tmux.conf",:force => true)
  end
  
end
