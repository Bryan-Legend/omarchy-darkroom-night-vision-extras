# Darkroom Night Vision Extras

Optional add-ons for the
[Darkroom Night Vision](https://github.com/Bryan-Legend/omarchy-darkroom-night-vision-theme)
Omarchy theme: a red screensaver and GNOME app styling for Omarchy, plus
matching themes for Windows and Google Chrome.

They live here rather than in the theme because an Omarchy theme is a palette
and the files that dress Omarchy in it, with nothing that runs. Everything
below is installed by hand.

```bash
git clone https://github.com/Bryan-Legend/omarchy-darkroom-night-vision-extras
```

## Omarchy

Some parts of the desktop can't be themed by a colors file alone. With the
theme installed, run:

```bash
omarchy-darkroom-night-vision-extras/omarchy/install.sh
```

- **GNOME apps (Nautilus and other GTK/libadwaita apps).** Links
  `~/.config/gtk-4.0/gtk.css` and `~/.config/gtk-3.0/gtk.css` to the theme's
  stylesheets through Omarchy's current-theme folder, so other themes keep the
  stock GNOME look. Nautilus's full-color folder icons and thumbnails are
  pushed into pure red with a CSS filter. Restart GNOME apps (`nautilus -q`)
  after switching themes. If you already have your own `gtk.css`, the
  installer leaves it alone.
- **Red screensaver.** Omarchy's screensaver effects choose their own colors.
  A small watcher switches on a red-only Hyprland screen shader while the
  screensaver is open — only when the theme is active — and turns it off
  again afterwards. It starts at login via `~/.config/hypr/autostart.lua`.

The installer copies what it needs, so the clone can be deleted afterwards.
Remove the extras with `omarchy/install.sh uninstall`.

## Windows

`windows/darkroom-night-vision.theme` is a Windows 11 contrast theme in the
same palette, with the *Pillars of Creation* wallpaper. Install it from the
clone:

```powershell
powershell -ExecutionPolicy Bypass -File windows\install.ps1
```

The script copies the wallpaper into your Windows themes folder and applies
the theme. Afterwards you can switch back to it under
**Settings › Accessibility › Contrast themes**. Double-clicking the `.theme`
file also works, but without the wallpaper. Windows then draws Explorer,
Settings, menus and classic apps in red on black. App icons, pictures and web
pages keep their real colors.

VS Code switches to its own high-contrast theme while a contrast theme is on.
To keep this one, set `"workbench.preferredHighContrastColorTheme":
"Darkroom Night Vision"`.

## Chrome

`chrome/` is a Google Chrome theme in the same palette: black window bar,
tabs, toolbar and new-tab page, with red text and icons. Chrome only loads
local themes by hand:

1. Open `chrome://extensions` and switch on **Developer mode**.
2. Click **Load unpacked** and choose the `chrome` folder from the clone.

The active tab stands out from the others by its brighter text alone.
Incognito windows keep Chrome's own colors.

## Credits

The Windows wallpaper is the JWST *Pillars of Creation* (NIRCam, 2022) by
NASA, ESA, CSA, STScI; J. DePasquale, A. Koekemoer, A. Pagan (STScI) —
[esawebb.org](https://esawebb.org/images/weic2216b/), CC BY 4.0. It was rotated,
cropped to 16:9 and converted to red-only; details in
[`windows/CREDITS.txt`](windows/CREDITS.txt).

## License

The extras' own files are [MIT](LICENSE). The photograph is a third-party work
under the license above.
