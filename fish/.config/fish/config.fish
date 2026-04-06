if status is-interactive

    # Remove fish greeting
    set fish_greeting 

    # Load machine-specific configuration
    if test -f ~/.config/fish/config.local.fish
        source ~/.config/fish/config.local.fish
    end

    # PATH configuration
    set --local paths \
        $HOME/.cargo/bin \
        $HOME/.local/bin \
        $HOME/bin \
        $HOME/usr/local/bin \
        /bin \
        /sbin \
        /usr/bin \
        /usr/sbin \
        /opt/homebrew/bin \
        /opt/homebrew/opt/libpq/bin \
        /opt/homebrew/opt/openjdk@11/bin \
        /opt/homebrew/sbin \
        /usr/local/opt/libpq/bin \
        $HOME/.npm-global/bin 
    for path in $paths
        if test -d $path
            fish_add_path $path
        end
    end

    # --- Aliases ---
    alias ..="cd .."
    alias ...="cd ../.."
    alias la='eza --long --all --total-size'
    alias lt='eza --tree'
    alias rm='rm -r'
    alias cp='cp -r'
    alias vscode='code'
    alias py='python'
    alias py3='python3'
    alias g='git'
    alias cc='claude'
    alias de='devin'
    alias op='openclaw'

    # --- Git ---
    abbr -a gs  'git status'
    abbr -a ga  'git add'
    abbr -a gc  'git commit -m'
    abbr -a gp  'git push'
    abbr -a gl  'git log --oneline --graph --decorate'
    abbr -a gco 'git checkout'
    abbr -a gcm 'git commit -m'

    # --- Docker ---
    abbr -a d  'docker'
    abbr -a dc 'docker compose'
    abbr -a dcr 'docker compose restart'
    abbr -a dcl 'docker compose logs -f'
    abbr -a dex 'docker exec -it'
    abbr -a ds  'docker stats --no-stream'

    # --- Macos ---
    abbr -a flush dns 'sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'
    abbr -a showfiles 'defaults write com.apple.finder AppleShowAllFiles -bool true and killall Finder'
    abbr -a hidefiles 'defaults write com.apple.finder AppleShowAllFiles -bool false and killall Finder'
    abbr -a fixapp 'sudo xattr -dr com.apple.quarantine'
    abbr -a signapp 'codesign --force --deep --sign -'
    
    # --- Macos custom ---
    abbr -a cat bat
    abbr -a ls eza --icons
    abbr -a top btop
    abbr -a grep rg

    # --- Setting ---
    set -gx EDITOR code

    starship init fish | source
    zoxide init fish | source
    fzf --fish | source

end