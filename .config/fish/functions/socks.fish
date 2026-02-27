# Start SSH Agent and set relevant variables
function socks
  set -x  AUTOSSH_PORT 0
  set -l pid (lsof -i 4tcp -P | ag 'localhost:2280' | awk '{print $2}')

  if test -z $pid
    echo "Create new SOCKS tunnel..."
  else
    echo "Restart SOCKS tunnel...(PID: $pid)"
    kill -9 $pid
  end

  # Host "socks-proxy" must be defined in ~/.ssh/config:
  #   Host socks-proxy
  #     HostName www.pixxis.be
  #     User root
  autossh -D 2280 -f -C -q -N socks-proxy
  sleep 2
  set -l npid (lsof -i 4tcp -P | ag 'localhost:2280' | awk '{print $2}')

  if test -z $pid
    echo "New SOCKS tunnel created, running under PID: $npid"
  else
    echo "SOCKS tunnel restarted, running under PID: $npid"
  end
end
