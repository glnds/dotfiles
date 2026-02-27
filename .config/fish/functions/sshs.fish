function sshs
  # Requires SSH config entry "saw" in ~/.ssh/config:
  #   Host saw
  #     User ec2-user
  #     IdentityFile ~/.ssh/saw_key
  #     ForwardAgent yes
  set -l region (test -n "$AWS_DEFAULT_REGION"; and echo $AWS_DEFAULT_REGION; or echo eu-west-1)
  set -l nargs (count $argv)

  switch $nargs
      case 1
        set -l ip (aws ec2 describe-instances --query 'Reservations[*].Instances[*].[PrivateIpAddress]' --filters 'Name=instance-state-name,Values=running' 'Name=tag-key,Values=Name' "Name=tag-value,Values=$argv[1]*" --output text --region $region)
        ssh saw -o HostName=$ip
      case 2
        set -l ip (aws ec2 describe-instances --query 'Reservations[*].Instances[*].[PublicIpAddress]' --filters 'Name=instance-state-name,Values=running' 'Name=tag-key,Values=Name' "Name=tag-value,Values=$argv[1]*" --output text --region $region)
        ssh saw -o HostName=$ip
      case '*'
        echo "Usage: sshs instance_name [-p]"
  end
end
