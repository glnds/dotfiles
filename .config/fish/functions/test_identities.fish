# Add my SSH identity
function test_identities
  ssh-add -l | grep "The agent has no identities" > /dev/null
  if [ $status -eq 0 ]
    #ssh-add ~/.ssh/(hostname)
    ssh-add ~/.ssh/mackey
    ssh-add ~/.ssh/saw_key
    if [ $status -eq 2 ]
      start_agent
    end
  end
end
