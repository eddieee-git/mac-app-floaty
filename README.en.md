<p align="center"><img src="docs/images/icon.png" width="96" alt="Floaty icon"></p>

<h1 align="center">Floaty</h1>

<p align="center">Floating sticky notes, right from the macOS menu bar<br>Keep them above other apps, and hide them all with one shortcut.</p>

<p align="center">
  <a href="https://github.com/eddieee-git/mac-app-floaty/releases/latest">Download the latest version</a> ·
  <a href="#install">Install</a> ·
  <a href="#how-to-use">How to use</a> ·
  <a href="#shortcuts">Shortcuts</a> ·
  <a href="#faq">FAQ</a> ·
  <a href="CHANGELOG.en.md">Changelog</a> ·
  <a href="README.md">한국어</a>
</p>

<p align="center"><img src="docs/images/stickers.png" alt="Three Floaty stickies on screen"></p>

## Features

- **Always on top**: Toggle it per sticky with the pin. Opacity is adjustable per sticky too.
- **Rich text**: Font, size, text color, highlight, bold, italic, underline, strikethrough, bullets, checklists (click ☐ to check it), alignment, and clear formatting. Paste images, and addresses become clickable links. ⌘⇧F finds text inside a sticky.
- **Collapse and hide**: Keep only the title row, or hide stickies, one at a time or all at once.
- **Global shortcuts**: Create, collapse, or hide stickies while using any app. You choose the keys.
- **Alarms**: At the set time, the sticky comes to the front, plays a sound, and flashes. Snooze for 5 minutes or repeat daily.
- **Lock**: Content stays covered until you unlock it with Touch ID or your Mac login password.
- **Manage Stickies window**: See every note in a list and edit them in one window. Hidden stickies work like a notepad here, and search and the Trash (emptied after 30 days) live here too.
- **Files**: Save stickies as RTFD, RTF, or plain text, import them, and print them.
- **Customize**: 10 colors, light and dark themes, date formats, and sound effects per action.
- **In-app updates**: tells you about new versions, checks the signature, and swaps them in.
- **Korean and English**: Choose the language in Settings. It follows your Mac's language at first.

## Install

Requires a Mac with Apple silicon (M1 or later) and macOS 13 or later. Intel Macs aren't supported.

1. Download `Floaty-x.y.z.dmg` from [Releases](https://github.com/eddieee-git/mac-app-floaty/releases/latest) and open it.
2. Drag **Floaty** into **Applications**.
3. Open Floaty. It has no Apple Developer signature, so macOS blocks the first launch. Click **Done**, then:
   - **macOS 15 (Sequoia) or later**: System Settings → Privacy & Security, scroll to the bottom, click **Open Anyway** next to Floaty, then **Open**.
   - **macOS 13 and 14**: right-click Floaty in Applications → **Open**.

   If you prefer Terminal: `xattr -dr com.apple.quarantine /Applications/Floaty.app`
4. There is no Dock icon. A pinned-note icon appears in the menu bar and a **Getting Started with Floaty** sticky opens.

See the [installation guide](docs/install.en.md) for details and for moving to another Mac.

## How to use

1. Click the Floaty icon in the menu bar and choose **New Sticky**, or press **⌃⌘N**.
2. Type your note. It saves automatically.
3. Drag the title row to put it where you want.
4. Press **⌃⌘H** to hide every sticky; press it again to bring them back.

Formatting, alarms, locking, the Manage Stickies window and saving to files are covered in the [user guide](docs/guide.en.md).

For flip-clock timers, alarms, and calendar alerts, see the companion app [Clocky](https://github.com/eddieee-git/mac-app-clocky).

## Shortcuts

| Key | Action |
|---|---|
| ⌃⌘N | (global) New sticky |
| ⌃⌘H | (global) Show/hide all |
| ⌃⌘M | (global) Collapse/expand all |
| ⌃⌥M | (global) Collapse/expand the current sticky |
| ⌃⌥H | (global) Hide/show the current sticky |
| ⌃⌘⌫ | (global) Delete the current sticky (asks first) |
| esc | Collapse/expand the sticky |
| F2 | Rename |
| ⌘F | Manage Stickies (search) |

Global shortcuts can be changed or turned off in Settings → **Shortcuts**. Formatting shortcuts inside a sticky are in the [user guide](docs/guide.en.md#keyboard-shortcuts).

## Settings

| Tab | What's there |
|---|---|
| General | Language, theme, open at login, confirm before deleting, empty the Trash after 30 days (on by default), check for new versions automatically (on by default) and install them automatically (on by default) |
| Stickies | Default size, font, text size, always on top and color for new stickies; opacity for all stickies |
| Dates | Date, year, weekday and time formats |
| Colors | Title row and background for each of the 10 colors (light and dark separately) |
| Sounds | Sound effects (off by default), also send alarms to Notification Center, a sound per action |
| Shortcuts | Global shortcuts, the rename key |
| About | Version, links to GitHub, the changelog and problem reports, more apps |

## FAQ

**What does it send?**
Only one request to GitHub's public API asking for the latest release, when checking for updates. Nothing about your stickies or usage is ever sent. Turn off automatic checks in Settings and not even that is sent.

**Where are stickies stored?**
Only on this Mac, in `~/Library/Application Support/Floaty`. There is no iCloud sync. The last 7 days are backed up automatically, once a day.

**How safe is a locked note?**
The body of a locked note is encrypted on disk (the key is in your login keychain). Titles are not encrypted, and other apps running under your account are not blocked.

**I opened the app and see nothing.**
There is no Dock icon. Look at the menu bar at the top of the screen. With many menu bar items, the icon may be hidden.

More questions are answered in the [user guide FAQ](docs/guide.en.md#faq).

## Uninstall

1. Menu bar Floaty icon → **Quit Floaty**
2. Move Floaty from Applications to the Trash
3. (Optional) To remove stickies and settings too, see [Uninstalling in the installation guide](docs/install.en.md#uninstalling).

## Build from source

Requires an Apple silicon Mac, macOS 13 or later, and the Xcode Command Line Tools (Xcode itself isn't needed).

```bash
./scripts/test.sh        # self-test
./scripts/build-app.sh   # build/Floaty.app + build/Floaty-<version>.dmg
open build/Floaty.app
```

The app is signed with the Hardened Runtime and has no third-party libraries.

## License

[MIT](LICENSE)

<!-- more-apps:start -->
## More apps

| | App | |
|---|---|---|
| <img src="https://raw.githubusercontent.com/eddieee-git/mac-app-clocky/main/docs/images/icon.png" width="32" alt=""> | [Clocky](https://github.com/eddieee-git/mac-app-clocky) | Flip-clock timers, alarms and calendar alerts from the menu bar |
| <img src="https://raw.githubusercontent.com/eddieee-git/mac-app-gitty/main/docs/images/icon.png" width="32" alt=""> | [Gitty](https://github.com/eddieee-git/mac-app-gitty) | Work with Git repositories like a file manager |
| <img src="https://raw.githubusercontent.com/eddieee-git/mac-app-grabby/main/docs/images/icon.png" width="32" alt=""> | [Grabby](https://github.com/eddieee-git/mac-app-grabby) | Capture, mark it up in place, and paste right away |
| <img src="https://raw.githubusercontent.com/eddieee-git/mac-app-peeky/main/docs/images/icon.png" width="32" alt=""> | [Peeky](https://github.com/eddieee-git/mac-app-peeky) | Bring back menu bar icons hidden behind the notch |
<!-- more-apps:end -->
