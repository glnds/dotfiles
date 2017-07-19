function getip
  set -l nargs (count $argv)
  # echo $nargs
  # echo $AWS_PROFILE

  switch $nargs
      case 1
        aws ec2 describe-instances --query 'Reservations[*].Instances[*].[PrivateIpAddress]' --filters 'Name=instance-state-name,Values=running' 'Name=tag-key,Values=Name' "Name=tag-value,Values=$argv[1]*" --output text
      case 2
        aws ec2 describe-instances --query 'Reservations[*].Instances[*].[PublicIpAddress]' --filters 'Name=instance-state-name,Values=running' 'Name=tag-key,Values=Name' "Name=tag-value,Values=$argv[1]*" --output text
      case '*'
        echo "Usage: getip instance_name [-p]"
  end
end
