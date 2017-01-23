#!/bin/sh
# base16-shell (https://github.com/chriskempson/base16-shell)
# Base16 Shell template by Chris Kempson (http://chriskempson.com)
# Seti UI scheme by 

# This script doesn't support linux console (use 'vconsole' template instead)
if [ "${TERM%%-*}" = 'linux' ]; then
    return 2>/dev/null || exit 0
fi

color00="15/17/18" # Base 00 - Black
color01="cd/3f/45" # Base 08 - Red
color02="9f/ca/56" # Base 0B - Green
color03="e6/cd/69" # Base 0A - Yellow
color04="55/b5/db" # Base 0D - Blue
color05="91/5e/ba" # Base 0E - Magenta
color06="55/db/be" # Base 0C - Cyan
color07="d8/d4/d4" # Base 05 - White
color08="55/6d/77" # Base 03 - Bright Black
color09="d5/5d/63" # Base 08 - Bright Red
color10="b2/d4/77" # Base 0B - Bright Green
color11="ed/da/92" # Base 0A - Bright Yellow
color12="6c/bf/e0" # Base 0D - Bright Blue
color13="b6/94/d1" # Base 0E - Bright Magenta
color14="6c/e0/c7" # Base 0C - Bright Cyan
color15="f3/f2/f2" # Base 07 - Bright White
color16="db/7b/55" # Base 09
color17="8a/55/3f" # Base 0F
color18="1b/1f/14" # Base 01
color19="3B/75/8C" # Base 02
color20="43/a5/d5" # Base 04
color21="ee/ee/ee" # Base 06
color22="17/1f/36" # Base 06
color23="19/0a/12" # Base 06
color24="0c/0d/0e" # Base 06
color25="24/27/29" # Base 06
color26="2f/34/37" # Base 06
color27="46/63/b9" # Base 06
color28="33/00/66" # Base 06
color_foreground="d6/d6/d6" # Base 05
color_background="15/17/18" # Base 00
color_cursor="d6/d6/d6" # Base 05

if [ -n "$TMUX" ]; then
  # Tell tmux to pass the escape sequences through
  # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
  printf_template='\033Ptmux;\033\033]4;%d;rgb:%s\033\033\\\033\\'
  printf_template_var='\033Ptmux;\033\033]%d;rgb:%s\033\033\\\033\\'
  printf_template_custom='\033Ptmux;\033\033]%s%s\033\033\\\033\\'
elif [ "${TERM%%-*}" = "screen" ]; then
  # GNU screen (screen, screen-256color, screen-256color-bce)
  printf_template='\033P\033]4;%d;rgb:%s\033\\'
  printf_template_var='\033P\033]%d;rgb:%s\033\\'
  printf_template_custom='\033P\033]%s%s\033\\'
else
  printf_template='\033]4;%d;rgb:%s\033\\'
  printf_template_var='\033]%d;rgb:%s\033\\'
  printf_template_custom='\033]%s%s\033\\'
fi

# 16 color space
printf $printf_template 0  $color00
printf $printf_template 1  $color01
printf $printf_template 2  $color02
printf $printf_template 3  $color03
printf $printf_template 4  $color04
printf $printf_template 5  $color05
printf $printf_template 6  $color06
printf $printf_template 7  $color07
printf $printf_template 8  $color08
printf $printf_template 9  $color09
printf $printf_template 10 $color10
printf $printf_template 11 $color11
printf $printf_template 12 $color12
printf $printf_template 13 $color13
printf $printf_template 14 $color14
printf $printf_template 15 $color15

# 256 color space
printf $printf_template 16 $color16
printf $printf_template 17 $color17
printf $printf_template 18 $color18
printf $printf_template 19 $color19
printf $printf_template 20 $color20
printf $printf_template 21 $color21
printf $printf_template 22 $color22
printf $printf_template 23 $color23
printf $printf_template 24 $color24
printf $printf_template 25 $color25
printf $printf_template 26 $color26
printf $printf_template 27 $color27
printf $printf_template 28 $color28

# foreground / background / cursor color
if [ -n "$ITERM_SESSION_ID" ]; then
  # iTerm2 proprietary escape codes
  printf $printf_template_custom Pg d6d6d6 # forground
  printf $printf_template_custom Ph 151718 # background
  printf $printf_template_custom Pi d6d6d6 # bold color
  printf $printf_template_custom Pj 3B758C # selection color
  printf $printf_template_custom Pk d6d6d6 # selected text color
  printf $printf_template_custom Pl d6d6d6 # cursor
  printf $printf_template_custom Pm 151718 # cursor text
else
  printf $printf_template_var 10 $color_foreground
  printf $printf_template_var 11 $color_background
  printf $printf_template_custom 12 ";7" # cursor (reverse video)
fi

# clean up
unset printf_template
unset printf_template_var
unset color00
unset color01
unset color02
unset color03
unset color04
unset color05
unset color06
unset color07
unset color08
unset color09
unset color10
unset color11
unset color12
unset color13
unset color14
unset color15
unset color16
unset color17
unset color18
unset color19
unset color20
unset color21
unset color22
unset color23
unset color24
unset color25
unset color27
unset color28
unset color_foreground
unset color_background
unset color_cursor
