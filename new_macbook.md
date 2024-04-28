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
- monitor control, flux
- logi option+, garmin express, wps, obsidian
- telegram, messenger
- WARP
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

### Config go environment

```bash
# add to .zshrc
export GOPATH=$(go env GOPATH)
export PATH=$GOPATH/bin:$PATH
```

### Email

- Download Attachments: `None`
- Signatures
- Add accounts
