set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8
#set -gx PATH /usr/local/miniconda3/bin $PATH
. /usr/local/miniconda3/etc/fish/conf.d/conda.fish
ssh-add -K ~/.ssh/id_rsa
