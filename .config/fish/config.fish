if status is-interactive
    fish_config theme choose rose-pine-dawn

    abbr --add ls eza
    abbr --add tree eza -T
    abbr --add vim nvim

    abbr --command git lg log --oneline --decorate --graph
    abbr --add wip "git add .; and git commit --no-verify --message 'wip'"

    # A smarter `cd` command.
    zoxide init fish --cmd cd | source

    # Pure Fish configuration.
    set --global pure_show_jobs true
    set --global pure_enable_nixdevshell true
    set --global pure_symbol_nixdevshell_prefix '❄️ ' # This looks  better with an additional space in Ghostty.
end
