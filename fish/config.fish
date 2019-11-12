set -xg PYTHONPATH /home/zhujie/projects/metapi $PYTHONPATH
set -xg PYTHONPATH /home/zhujie/projects/dRep $PYTHONPATH
set -xg GOPATH /home/zhujie/.go
set -xg PYTHONPATH /home/zhujie/projects/pyani $PYTHONPATH
set -xg PYTHONPATH /home/zhujie/projects/MetaBGC/MetaBGC-V1.1/MetaBGC-V1.1_Scripts $PYTHONPATH

set -xg PATH /home/zhujie/projects/pyani/bin $PATH
set -xg PATH /home/zhujie/.cargo/bin $PATH

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/zhujie/.conda/envs/bioenv/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

set -x PATH /home/zhujie/.perl5/bin $PATH

set -x PERL5LIB /home/zhujie/.perl5/lib/perl5:$PERL5LIB
set -x PERL_LOCAL_LIB_ROOT /home/zhujie/.perl5:$PERL_LOCAL_LIB_ROOT
set -x PERL_MB_OPT "--install_base \"/home/zhujie/.perl5\""
set -x PERL_MM_OPT "INSTALL_BASE=/home/zhujie/.perl5"
set -x PERL_CPANM_OPT "--prompt -l /home/zhujie/.perl5"

set -x PATH /home/zhujie/projects/auto_otp_login/bin $PATH
