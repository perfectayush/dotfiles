require 'rake'
require 'fileutils'

namespace :dot do
  home = ENV['HOME']
  pwd  = FileUtils.pwd
  spacemacs_d   = home + "/.spacemacs.d/"
  zprezto_d     = home + "/.zprezto"
  emacs_d       = home + "/.emacs.d"
  hammerspoon_d = home + "/.hammerspoon"

  desc "install all"
  task :all do
    Rake::Task['dot:zsh'].invoke
    Rake::Task['dot:emacs'].invoke
    Rake::Task['dot:tmux'].invoke
  end


  desc "install emacs config"
  task :emacs do
    puts "Installing emacs config ..."
    FileUtils.mkdir_p(spacemacs_d)
    FileUtils.ln_s(pwd + "/emacs/init.el", spacemacs_d,:force => true)
    FileUtils.ln_s(pwd + "/emacs/snippets", spacemacs_d,:force => true)
    Rake::Task['dot:spacemacs'].invoke unless File.exists?(emacs_d)
  end

  desc "install spacemacs"
  task :spacemacs do
    begin
      puts "Installing spacemacs ..."
      unless File.exists?(emacs_d)
        `git clone --recursive https://github.com/syl20bnr/spacemacs #{emacs_d}`
      end
    rescue => e
      puts e
      puts "Failed while installing spacemacs from internet"
    end
  end

  desc "install zsh config"
  task :zsh do
    puts "Installing zsh config ..."

    Rake::Task['dot:prezto'].invoke unless File.exists?(zprezto_d)

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
      unless File.exists?(zprezto_d)
        `git clone --recursive https://github.com/sorin-ionescu/prezto.git #{zprezto_d}`
      end
      Dir[home + "/.zprezto/runcoms/*"].reject{|f| f[/rc$|md$/]}.each do |file|
        FileUtils.ln_s(file,home + "/." + File.basename(file),:force => true)
      end
    rescue => e
      puts e
      puts "Failed while installing prezto from internet"
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
    FileUtils.rm_rf(home + "/.mpv")
    FileUtils.ln_s(pwd + "/mpv", home + "/.mpv",:force => true)
    fifofile = "#{pwd}/mpv/fifo"
    `mkfifo #{fifofile}` unless File.exists? fifofile
  end

  desc "install hammerspoon config"
  task :hs do
    puts "Installing hammerspoon config ..."
    FileUtils.rm_rf(hammerspoon_d)
    FileUtils.ln_s(pwd + "/hammerspoon", hammerspoon_d,:force => true)
  end
end
