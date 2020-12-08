# ===========================
# Color setting

# You can set these variables in config.fish like:
# set -g color_dir_bg red
# If not set, default color from agnoster will be used.
# ===========================
set -q color_vi_mode_indicator; or set color_vi_mode_indicator black
set -q color_vi_mode_normal;    or set color_vi_mode_normal    green
set -q color_vi_mode_insert;    or set color_vi_mode_insert    blue
set -q color_vi_mode_visual;    or set color_vi_mode_visual    purple
set -q color_vi_mode_replace;   or set color_vi_mode_replace   red

# ===========================
# Cursor setting
# ===========================
set fish_cursor_default     block      blink
set fish_cursor_insert      line       blink
set fish_cursor_replace_one underscore blink
set fish_cursor_visual      block

function prompt_vi_mode -d 'vi mode status indicator'
  switch $fish_bind_mode
      case default replace_one
        set_color $color_vi_mode_normal
        # set_color -b $color_vi_mode_normal $color_vi_mode_indicator
        echo -s -n "[N]"
      case insert
        set_color $color_vi_mode_insert
        # set_color -b $color_vi_mode_insert $color_vi_mode_indicator
        echo -s -n "[I]"
      case visual
        set_color $color_vi_mode_visual
        # set_color -b $color_vi_mode_visual $color_vi_mode_indicator
        echo -s -n "[V]"
      case replace
        set_color $color_vi_mode_replace
        # set_color -b $color_vi_mode_replace $color_vi_mode_indicator
        echo -s -n "[R]"
    end
end

function fish_mode_prompt
  if test "$fish_key_bindings" = "fish_vi_key_bindings"
    prompt_vi_mode
  end
end
