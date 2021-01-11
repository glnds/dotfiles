function hilp
  echo "aws sso login --profile my-dev-profile"
  echo "aws ssm start-session --target i-1234567890abcdef0"
  echo "aws sts decode-authorization-message --encoded-message some_message"
end
