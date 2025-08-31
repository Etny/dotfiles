set -gx PYENV_ROOT "$HOME/.pyenv"
set -gx PATH "$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - fish)"

set -gx EDITOR nvim
set -gx SYSTEMD_EDITOR nvim

if status is-interactive
    if test -z $TMUX
       tmux new -As0
    end
end
