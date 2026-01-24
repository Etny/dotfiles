
set -gx EDITOR nvim
set -gx SYSTEMD_EDITOR nvim
set -gx fish_greeting # Disable greeting
set -gx hydro_symbol_start " "
set -gx hydro_color_pwd $fish_color_cwd
set -gx hydro_color_prompt $fish_color_quote
if status is-interactive
    if test -z $TMUX
       tmux new -As0
    end
end

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[ -f /home/ynte/.npm/_npx/6913fdfd1ea7a741/node_modules/tabtab/.completions/electron-forge.fish ]; and . /home/ynte/.npm/_npx/6913fdfd1ea7a741/node_modules/tabtab/.completions/electron-forge.fish