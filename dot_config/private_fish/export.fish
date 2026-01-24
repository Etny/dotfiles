
set -gx PYENV_ROOT "$HOME/.pyenv"
set -gx PATH "$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - fish)"
