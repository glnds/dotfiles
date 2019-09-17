# Start SSH Agent and set relevant variables
function start_agent
  #echo "Initializing new SSH agent ..."(hostname)
  echo "Initializing new SSH agent ...mackey"
  ssh-agent -c | sed 's/^echo/#echo/' > $SSH_ENV
  echo "succeeded"
  chmod 600 $SSH_ENV
  . $SSH_ENV > /dev/null
  #ssh-add ~/.ssh/(hostname)
  ssh-add ~/.ssh/mackey
end
