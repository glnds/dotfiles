# Add my SSH identity
function test_identities
  #echo "Check SSH identites..."
  ssh-add -l | grep "The agent has no identities." > /dev/null
  if [ $status -eq 0 ]
    echo "Adding SSH identites.."
    ssh-add ~/.ssh/mackey
    if [ $status -eq 2 ]
      start_agent
    end
    echo "SSH identities added."
  else
    #echo "SSH identities already initialized."
  end
end
