function fish_right_prompt -d "Write out the right prompt"

  set_color white
  echo "["
  set_color -o ffa500
  echo "AWS:"
  set_color normal
  set_color white
  echo $AWS_PROFILE
  echo "]"
  set_color normal
end
