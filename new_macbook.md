# Setup macbook

## Apps

- Download brave (`Sync bookmark and opened tabs`)
- Dropbox
- KeepassXc
- orbstack
- vscode (install `code command`)
- tableplus
- insomnia
- gotiengviet (`ctrl+space`)
- better display (monitor control), flux
- logi option+, garmin express
- wps, obsidian
- telegram, messenger
- ChatGPT
- AppCleaner

## Configurations

### System settings

- Turn off all notifications
- Focus &rarr; Share across devices: `disable`
- Apprearance
- Lock Screen: `Require password immediately`
- Dim on battery: `disable`
- Hot corners: `remove all`
- Stage manager: `enable`
- Show windows from an application: `One at a Time`
- Click in the scrollbar to &rarr; Jump to the spot that's clicked
- Automatically rearrange Spaces based on most recent use: `disable`
- Key repeat rate: `max`
- Delay until repeat: `max-1`

### Config keyboard

- Keyboard navigation: `enable`
- Keyboard Shortcuts: `remove F11`
- Disable input source: `Keyboard Shortcuts` &rarr; `Input Sources` &rarr; `disable`
- Use F1, F2, etc. keys as standard function keys: `Keyboard Shortcuts` &rarr; `Function keys`
- Remove `fn` key action
- Dictation &rarr; auto-punctuation: `disable`

### Remove accent windows

```bash
defaults write -g ApplePressAndHoldEnabled -bool false
```

### Setup dock show/hide faster

```bash
defaults write com.apple.dock autohide -bool true && \
defaults write com.apple.dock autohide-delay -float 0 && \
defaults write com.apple.dock autohide-time-modifier -float 0.5 && \
killall Dock
```

### Setup iterm2

- General &rarr; Closing &rarr; Confirm "Quit iTerm2": `disable`
- General &rarr; Selection &rarr; Applications in terminal may access clipboard: `enable`
- Apprearance &rarr; General &rarr; Theme: `minimal`, Location: `Top`
- Apprearance &rarr; Windows &rarr; Hide scrollbars: `disable`
- Import [iterm-leoo-profile.json](./iterm-leoo-profile.json)
- [Config fonts for vscode](https://github.com/romkatv/powerlevel10k/issues/671)

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

### Setup homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Setup tmux

```bash
brew install tmux
```

copy file `.tmux.conf` to `~/` then restart tmux

```bash
tmux source ~/.tmux.conf
```

### Config github ssh key

```bash
chmod 400 ~/.ssh/id_rsa_leo && \
eval "$(ssh-agent -s)" && \
ssh-add --apple-use-keychain ~/.ssh/id_rsa_leo
```

### Setup direnv

```bash
brew install direnv
```

To use both `.env` and `.envrc`, add file `direnv.toml` to `~/.config/direnv/` then restart `zsh`

```bash
exec zsh
```

### Email

- Download Attachments: `None`
- Signatures
- Add accounts

### Obsidian

Config new vault

- Editor &rarr; Show line number: `enable`
- Files and links &rarr; config default location in vault folder and attachments in subfolder
- Config daily logs folder

### Better display

- Make fine scale default for volume keys
- Customize app content: show volume, hide resolution
