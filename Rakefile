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
    FileUtils.mkdir_p(home + "/.spacemacs.d/")
    FileUtils.ln_s(pwd + "/emacs/init.el", home + "/.spacemacs.d/",:force => true)
    Rake::Task["prezto"].invoke unless File.exists?(home + "/.emacs.d")
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

  desc "install spacemacs"
  task :spacemacs do
    begin
      puts "Installing spacemacs ..."
      unless File.exists?(home + "/.emacs.d/")
        `git clone --recursive https://github.com/syl20bnr/spacemacs ~/.emacs.d`
      end
    rescue => e
      puts e
      puts "Failed while installing spacemacs from internet"
    end
  end

  desc "install tmux config ..."
  task :tmux do
    puts "Installing tmux config ..."
    FileUtils.ln_s(pwd + "/tmux.conf", home + "/.tmux.conf",:force => true)
  end

  desc "install mpv config"
  task :mpv do
    puts "Installing mpv config ..."
    FileUtils.ln_s(pwd + "/mpv", home + "/.mpv",:force => true)
  end
end
