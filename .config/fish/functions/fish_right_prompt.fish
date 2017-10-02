function fish_right_prompt -d "Write out the right prompt"

  set_color -o ffa500
  echo "<"
  echo $AWS_PROFILE
  echo ">"
  set_color normal
end
