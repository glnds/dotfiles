function fish_right_prompt -d "Write out the right prompt"

  # set_color black -b f9a563
  # set_color -o f48f41
  set_color -o ffa500
  echo "<"
  echo $AWS_PROFILE
  echo ">"
  set_color normal

  # Print a yellow fork symbol when in a subshell
  set -l max_shlvl 1
  test $TERM = "screen"; set -l max_shlvl 2
  if test $SHLVL -gt $max_shlvl
    set_color yellow
    echo -n " ⑂"
    set_color normal
  end

  # Print a red dot for failed commands.
  if test $exit_code -ne 0
    set_color red
    echo -n " •"
    set_color normal
  end
end
