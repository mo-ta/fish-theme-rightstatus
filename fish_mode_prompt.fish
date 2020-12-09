# ===========================
# Color setting

# You can set these variables in config.fish like:
# set -g color_dir_bg red
# If not set, default color from agnoster will be used.
# ===========================
set -q color_vi_mode_normal;    or set color_vi_mode_normal    green
set -q color_vi_mode_insert;    or set color_vi_mode_insert    blue
set -q color_vi_mode_visual;    or set color_vi_mode_visual    purple
set -q color_vi_mode_replace;   or set color_vi_mode_replace   red
set -q color_default_mode;      or set color_default_mode      yellow

# ===========================
# Cursor setting
# ===========================
set fish_cursor_default     block      blink
set fish_cursor_insert      line       blink
set fish_cursor_replace_one underscore blink
set fish_cursor_visual      block


function prompt_default_mode -d 'normal mode color'
    set_color -o $color_default_mode
end

function prompt_vi_mode -d 'vi mode status indicator'
  switch $fish_bind_mode
      case default replace_one
        set_color -o $color_vi_mode_normal
        echo -s -n "[N]"
      case insert
        set_color -o $color_vi_mode_insert
        echo -s -n "[I]"
      case visual
        set_color -o $color_vi_mode_visual
        echo -s -n "[V]"
      case replace
        set_color -o $color_vi_mode_replace
        echo -s -n "[R]"
    end
end

function fish_mode_prompt
  if test "$fish_key_bindings" = "fish_vi_key_bindings"
    prompt_vi_mode
  else
    prompt_default_mode
  end
end
