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
- Keyboard navigation: `enable`
- Keyboard Shortcuts: `remove F11`
- Hot corners: `remove all`
- Stage manager: `enable`
- Show windows from an application: `One at a Time`
- Use F1, F2, etc. keys as standard function keys
- Disable input source
- Jump to the spot that's clicked
- Automatically rearrange Spaces based on most recent use
- Key repeat rate: `max`
- Delay until repeat: `max-1`

### Setup dock show/hide faster

```bash
defaults write com.apple.dock autohide -bool true
```

```bash
defaults write com.apple.dock autohide-delay -float 0
```

```bash
defaults write com.apple.dock autohide-time-modifier -float 0.5
```

```bash
killall Dock
```

### Setup iterm2

- General &rarr; Closing &rarr; Confirm "Quit iTerm2": `disable`
- Apprearance &rarr; Windows &rarr; Hide scrollbars: `disable`
- Import [iterm-leoo-profile.json](./iterm-leoo-profile.json)
- [Config fonts for vscode](https://github.com/romkatv/powerlevel10k/issues/671)

```bash
# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

```bash
# zsh syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

```bash
# zsh auto-suggestions
git clone <https://github.com/zsh-users/zsh-autosuggestions> ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

### Setup homebrew

```bash
/bin/bash -c "$(curl -fsSL <https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh>)"
```

### Setup tmux

```bash
brew install tmux
tmux show -g > ~/.tmux.conf
```

```bash
# add to `~/.tmux.conf`
set-option -g mouse on
```

```bash
# add to ~/.zshrc
eval "$(/opt/homebrew/bin/brew shellenv)"
```

### Config github ssh key

```bash
chmod 400 ~/.ssh/id_rsa_leo
```

```bash
eval "$(ssh-agent -s)"
```

```bash
ssh-add --apple-use-keychain ~/.ssh/id_rsa_leo
```

### Setup direnv

```bash
brew install direnv
```

To use both `.env` and `.envrc`

```toml
# add to ~/.config/direnv/direnv.toml
[global]
load_dotenv = true
```

restart `zsh`

```bash
exec zsh
```

### Config go environment

```bash
# add to ~/.zshrc
export GOPATH=$(go env GOPATH)
export PATH=$GOPATH/bin:$PATH
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
