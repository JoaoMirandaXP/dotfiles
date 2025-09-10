if status is-interactive
    # Commands to run in interactive sessions can go here
    alias ls "eza -l --icons $argv" 
    mise activate fish | source
end


