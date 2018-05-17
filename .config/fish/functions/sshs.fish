function sshs
  set -l nargs (count $argv)
  # echo $nargs
  # echo $AWS_PROFILE

  switch $nargs
      case 1
        set -l ip (aws ec2 describe-instances --query 'Reservations[*].Instances[*].[PrivateIpAddress]' --filters 'Name=instance-state-name,Values=running' 'Name=tag-key,Values=Name' "Name=tag-value,Values=$argv[1]*" --output text --region eu-west-1)
        ssh -A -i ~/.ssh/saw_key ec2-user@$ip
      case 2
        set -l ip (aws ec2 describe-instances --query 'Reservations[*].Instances[*].[PublicIpAddress]' --filters 'Name=instance-state-name,Values=running' 'Name=tag-key,Values=Name' "Name=tag-value,Values=$argv[1]*" --output text --region eu-west-1)
        ssh -A -i ~/.ssh/saw_key ec2-user@$ip
      case '*'
        echo "Usage: sshs instance_name [-p]"
  end
end
