set -gx PYENV_ROOT "$HOME/.pyenv"
set -gx PATH "$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - fish)"

set -gx EDITOR nvim
set -gx SYSTEMD_EDITOR nvim

set fish_greeting # Disable greeting
set -g hydro_symbol_start " "
set -g hydro_color_pwd $fish_color_cwd
set -g hydro_color_prompt $fish_color_quote

if status is-interactive
    if test -z $TMUX
       tmux new -As0
    end
end
