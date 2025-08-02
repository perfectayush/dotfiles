function fget --wraps='aria2c -c --max-connection-per-server=8 --min-split-size=1M' --description 'alias fget=aria2c -c --max-connection-per-server=8 --min-split-size=1M'
  aria2c -c --max-connection-per-server=8 --min-split-size=1M $argv
        
end
