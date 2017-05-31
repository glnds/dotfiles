function getip
  if test (count $argv) -gt 2
    if [ $argv[3] = "-p" ]
      aws ec2 describe-instances --query 'Reservations[*].Instances[*].[PublicIpAddress]' --filters 'Name=instance-state-name,Values=running' 'Name=tag-key,Values=Name' "Name=tag-value,Values=$argv[1]" "Name=tag-key,Values=Name" "Name=tag-value,Values=*$argv[2]*" --output text
    else
      aws ec2 describe-instances --query 'Reservations[*].Instances[*].[PrivateIpAddress]' --filters 'Name=instance-state-name,Values=running' 'Name=tag-key,Values=Name' "Name=tag-value,Values=$argv[1]" "Name=tag-key,Values=Name" "Name=tag-value,Values=*$argv[2]*" --output text
    end
  else
    if test (count $argv) -gt 1
      aws ec2 describe-instances --query 'Reservations[*].Instances[*].[PrivateIpAddress]' --filters 'Name=instance-state-name,Values=running' 'Name=tag-key,Values=Name' "Name=tag-value,Values=$argv[1]" "Name=tag-key,Values=Name" "Name=tag-value,Values=*$argv[2]*" --output text
    else
      echo "Usage: getip squad_name instance_name [-p]"
    end
  end
end
