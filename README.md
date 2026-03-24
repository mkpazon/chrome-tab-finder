# chrome-tab-finder

Fuzzy-search and manage your Chrome tabs from the terminal. macOS only.

Uses `fzf` for interactive fuzzy matching and AppleScript to talk to Chrome. No extensions, no extra apps.

## Install

```bash
brew install fzf
git clone https://github.com/mkpazon/chrome-tab-finder.git ~/.chrome-tab-finder
chmod +x ~/.chrome-tab-finder/*.sh
```

Add an alias to your `~/.zshrc` (or `~/.bashrc`):

```bash
alias ft='~/.chrome-tab-finder/find-tab.sh'
```

Then `source ~/.zshrc`.

## Usage

```
$ ft
  Enter=focus | Ctrl-X=close tab
  5/42
> Android Design System Migration Dashboard  (pages.github.io)
  Add Missing Card component · Pull Request #4182  (github.com)
  Sprint 3 - Scrum Board - JIRA  (atlassian.net)
  Gmail - Inbox (3)  (mail.google.com)
  Claude Code Docs  (docs.anthropic.com)
Tab > dshboard
```

Start typing to filter. Typos are handled — `dshboard` finds `Dashboard`.

## Keyboard Shortcuts

| Key | Action |
|-----|--------|
| **Enter** | Focus the highlighted tab |
| **Ctrl-X** | Close the highlighted tab and refresh the list |
| **Esc** | Exit |

## Requirements

- macOS
- Google Chrome
- [fzf](https://github.com/junegunn/fzf)

## License

MIT
