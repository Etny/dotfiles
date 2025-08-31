#!/usr/bin/env fish

set session "_popup_$(tmux display -p '#S')"

if not tmux has -t $session 2> /dev/null
    set parrent_session "$(tmux display -p '#{session_id}')"
    set session_id "$(tmux new-session -c '#{pane_current_path}' -dP -s "$session" -F '#{session_^id}' -e TMUX_PARENT_SESSION="$parrent_session")"
    tmux set-option -s -t $session_id key-table popup \; \
        set-option -s -t $session_id status off \; \
        set-option -s -t $session_id prefix None \; \
        attach -t "$session"
end

exec tmux attach -t $session > /dev/null
