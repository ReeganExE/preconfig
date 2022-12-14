# Colors used for printing stuff - https://jonasjacek.github.io/colors/

#   [48; background
#   [38; foreground

# TODO
# [38;2;95;135;175m -> what's the second value?
# [38;2;95;135;175m -> SteelBlue
# [38;5;95;135;175m -> brownish?

# Logging
export color_success=$'\e[48;2;0;175;95m\e[38;2;225;225;225m' # white on SpringGreen3
export color_info=$'\e[48;2;0;175;255m\e[38;2;225;225;225m' # white on DeepSkyBlue1
export color_warning=$'\e[48;2;255;215;0m\e[38;2;128;128;128m' # grey on Gold1
export color_error=$'\e[48;2;255;0;0m\e[38;2;225;225;225m' # white on red
export color_default=$'\033[0m'

export tag_success="${color_success} SUCCESS ${color_default}"
export tag_info="${color_info} INFO ${color_default}"
export tag_warning="${color_warning} WARNING ${color_default}"
export tag_error="${color_error} ERROR ${color_default}"

# SSH
export color_blue=$'\e[48;2;0;95;175m\e[38;2;225;225;225m' # white on DeepSkyBlue4
export tag_ssh="${color_blue} SSH ${color_default}"

# TODO
export color_red=$'\e[48;2;255;0;0m\e[38;2;225;225;225m' # white on red
export tag_root="${color_red} ROOT ${color_default}"