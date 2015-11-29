function fish_user_key_bindings --description 'Custom vi mode bindings'
  fish_vi_key_bindings

  bind -M insert -m default jj backward-char force-repaint
end
