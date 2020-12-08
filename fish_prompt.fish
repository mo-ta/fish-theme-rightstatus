function fish_prompt
  echo -s -n (set_color $fish_color_cwd) (prompt_pwd) (set_color normal) '> '
end
