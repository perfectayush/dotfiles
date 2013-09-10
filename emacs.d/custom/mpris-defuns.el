(defun vlc-linux-command (command-name) "Execute command for VLC" (interactive)
  (setq command-text (format "%s%s" "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.vlc /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player." command-name))
  (shell-command command-text))

(defun vlc-toggle () "Play/Pause Spotify" (interactive)
  (vlc-linux-command "PlayPause"))

(defun vlc-previous () "Starts the song over in Spotify" (interactive)
  (vlc-linux-command "Previous"))

(defun vlc-next () "Next song in Spotify" (interactive)
  (vlc-linux-command "Next"))

(defun spotify-linux-command (command-name) "Execute command for Spotify" (interactive)
  (setq command-text (format "%s%s" "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player." command-name))
  (shell-command command-text))

(defun spotify-toggle () "Play/Pause Spotify" (interactive)
  (spotify-linux-command "PlayPause"))

(defun spotify-previous () "Starts the song over in Spotify" (interactive)
  (spotify-linux-command "Previous"))

(defun spotify-next () "Next song in Spotify" (interactive)
  (spotify-linux-command "Next"))

(provide 'mpris-defuns)
