# Ring terminal bell when a long command finishes -> tmux flags the window (monitor-bell on).
# tmux ignores the bell in the active window, so only background windows light up.
status is-interactive; or return

set -q bell_min_duration_ms; or set -g bell_min_duration_ms 10000

function __bell_on_done --on-event fish_postexec
    test $CMD_DURATION -ge $bell_min_duration_ms; and printf '\a'
end
