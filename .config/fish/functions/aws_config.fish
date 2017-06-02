function aws_config
  if not fgrep -q "[$argv]" ~/.aws/credentials
    echo "Please specify a valid profile."
  else
    set -e AWS_ACCESS_KEY
    set -e AWS_SECRET_KEY
    set account (awk "/\[$argv\]/,/^\$/ { if (\$1 == \"account_id\") { print \$3 }}" ~/.aws/credentials)
    set username (awk "/\[$argv\]/,/^\$/ { if (\$1 == \"username\") { print \$3 }}" ~/.aws/credentials)
    set mfarn "arn:aws:iam::$account:mfa/$username"
    echo $mfarn
    echo "Please enter your MFA token:"
    read -l mfa_token
    set json (aws --profile=$argv sts get-session-token --serial-number="$mfarn" --token-code=$mfa_token)
    set -g -x AWS_ACCESS_KEY_ID (echo $json | jq -r '.Credentials.AccessKeyId')
    set -g -x AWS_SECRET_ACCESS_KEY (echo $json | jq -r '.Credentials.SecretAccessKey')
    set -g -x AWS_SESSION_TOKEN (echo $json | jq -r '.Credentials.SessionToken')
  end
end
