# My personal tool configurations

Dotfiles, app/config exports, and helper scripts for setting up and maintaining my macOS machine.

## Files

| File | Description | Where it goes |
| --- | --- | --- |
| [new_macbook.md](./new_macbook.md) | Step-by-step guide for setting up a fresh MacBook: apps to install, macOS system/keyboard settings, iTerm2, zsh, Homebrew, asdf, pyenv, direnv, tmux, SSH keys, Brave, etc. | — (reference) |
| [zshrc.conf](./zshrc.conf) | Zsh / oh-my-zsh config: Powerlevel10k theme, plugins (git, z, ssh-agent, syntax-highlighting, autosuggestions, asdf…), and init for Homebrew, asdf, pyenv, direnv, and Go. | append to / source from `~/.zshrc` |
| [.tmux.conf](./.tmux.conf) | tmux config (enables mouse support). | copy to `~/.tmux.conf` |
| [direnv.toml](./direnv.toml) | direnv global config so both `.env` and `.envrc` are loaded. | `~/.config/direnv/direnv.toml` |
| [iterm-leoo-profile.json](./iterm-leoo-profile.json) | Exported iTerm2 profile (colors, font, keys). | import via iTerm2 → Settings → Profiles → Other Actions → Import |
| [.gitignore](./.gitignore) | Ignores `.DS_Store`. | — |
| [scripts/](./scripts/) | Helper shell scripts (see below). | — |

## Scripts

> The scripts are not committed with an executable bit, so run them with an explicit interpreter (`sudo bash …`). If you prefer to run them directly (`./script.sh`), make them executable first with `chmod +x`.

### [scripts/install-sleep-schedule.sh](./scripts/install-sleep-schedule.sh)

Schedules macOS to automatically toggle "Prevent automatic sleeping when the display is off" (`pmset -c sleep`) on weekdays — stay awake during work hours, allow sleep after. It writes two LaunchDaemons to `/Library/LaunchDaemons` (owned `root:wheel`, mode `644`) and loads them via `launchctl`.

Defaults (edit the config block at the top of the script to change): wake/stay-awake at **09:00**, allow sleep at **18:00**, idle sleep after **10 min**, power-adapter only (`-c`).

Must run as **root** (changing the `-c` power profile requires it). Re-running is safe — it overwrites and reloads the jobs.

```bash
sudo bash scripts/install-sleep-schedule.sh
```

Verify:

```bash
pmset -g | grep ' sleep'
sudo launchctl list | grep preventsleep
```

### [scripts/uninstall-sleep-schedule.sh](./scripts/uninstall-sleep-schedule.sh)

Removes the LaunchDaemons created by the install script and unloads them. Your current `pmset` state is left as-is. Must run as **root**.

```bash
sudo bash scripts/uninstall-sleep-schedule.sh
```

To force "prevent sleep" on right now:

```bash
sudo pmset -c sleep 0
```
