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
- Change single quote and double quotes

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

### Setup dock show/hide faster and stop bouncing

```bash
defaults write com.apple.dock autohide -bool true && \
defaults write com.apple.dock autohide-delay -float 0 && \
defaults write com.apple.dock autohide-time-modifier -float 0.5 && \
defaults write com.apple.dock no-bouncing -bool TRUE && \
killall Dock
```

### Setup iterm2

- General &rarr; Closing &rarr; Confirm "Quit iTerm2": `disable`
- General &rarr; Selection &rarr; Applications in terminal may access clipboard: `enable`
- Apprearance &rarr; General &rarr; Theme: `minimal`, Location: `Top`
- Apprearance &rarr; Windows &rarr; Hide scrollbars: `disable`
- Import [iterm-leoo-profile.json](./iterm-leoo-profile.json)
- [Config fonts for vscode](https://github.com/romkatv/powerlevel10k/issues/671)
- Disable all confirmation on shutdown: `enable`

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

### Setup zsh plugins

#### zsh-syntax-highlighting

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

#### zsh-autosuggestions

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

#### you-should-use

```bash
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $ZSH_CUSTOM/plugins/you-should-use
```

#### asdf

[Guide](https://asdf-vm.com/guide/getting-started.html)

```bash
brew install wxwidgets
brew install openjdk
brew install asdf

asdf plugin add erlang
asdf plugin add elixir
asdf install erlang latest
# incase install error
KERL_CONFIGURE_OPTIONS="--disable-jit" asdf install erlang latest
asdf install elixir latest
asdf global erlang <latest_version>
asdf global elixir <latest_version>
```

#### pyenv

```bash
brew install xz
brew install pyenv
pyenv install -l
pyenv install <latest_version>
pyenv global <latest_version>
```

#### direnv

```bash
brew install direnv
```

To use both `.env` and `.envrc`, add file `direnv.toml` to `~/.config/direnv/` then restart `zsh`

```bash
exec zsh
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
cp -r ~/Dropbox/.confidentiality/.ssh/ ~/.ssh
```

```bash
chmod 400 ~/.ssh/id_rsa_leo && \
eval "$(ssh-agent -s)" && \
ssh-add --apple-use-keychain ~/.ssh/id_rsa_leo
```

### Brave

#### Settings

- Shields &rarr; Content filtering &rarr; add ABPVN
- Site and Shields Settings &rarr; Permissions: `disallow`
- Search engine &rarr; Show search suggestions: `enable`
- Password manager &rarr; Offer to save passwords and passkeys: `disable`

#### Extensions

- Refined github
- Dark reader

### GoTiengViet

- Kiểu gõ: Telex
- Khởi động khi Login
- Bỏ chọn "Tự động khôi phục phím với từ sai"

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
- Show quit BetterDisplay in the button bar
- Show button at the top of the menu
- Disable "crash report" and "licensing & pro features" in Application

### KeepassXC

- General &rarr; Auto-Type: uncheck `Use entry title to match windows for global Auto-Type`
- Security: uncheck `Lock databases after inactivity`
