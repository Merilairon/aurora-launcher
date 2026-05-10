# Aurora Launcher (Aurora / CheatHappens for Linux)

**The Aurora Launcher is currently on version 1.540.**

## DISCLAIMER

This project is _NOT_ affiliated with, funded by, or paid by CheatHappens.  
The work done here is purely from the contributors who donate their time and effort.  
CheatHappens makes Aurora (the trainer/mod tool).  
We (`aurora-launcher`) enable you to run it on Linux (and by extension, the Steam Deck).

## Support & Contributions

If this tool helps you, please consider one or more of the following:

- **Star the project** to show support and visibility.
- **Code contributions are welcome!**  
  We are actively looking for developers to improve the launcher.
  - General developers to improve the current launcher.
  - Flatpak compatibility improvements.

- **Answering issues**:
  - Help others by referencing existing solutions or adding new ones.

For more help or to contribute:

- Suggest improvements via [GitHub Issues](https://github.com/Merilairon/aurora-launcher/issues)
- Report / Help solve bugs by [filing / answering an Issue](https://github.com/Merilairon/aurora-launcher/issues)

## Quick Guide

**This guide covers the most relevant steps to get Aurora running on Linux/Steam Deck.**

- **Optional:** If you have access to another PC and wish to control the Steam Deck remotely,  
  consider using **[RustDesk](https://github.com/rustdesk/rustdesk/releases/latest)** for easier setup (the `.flatpak` is easiest).

- **Info:** You need an active [CheatHappens](https://www.cheathappens.com) subscription to use Aurora trainers.

1. Python `python-venv` (or `python3-venv` or `venv` or `virtualenv`; use first one found)  
   and `Tk` need to be installed.  
   Tk / Tkinter may be under a different name in your distribution's repos.  
   If none of the below options work (or your distro is missing), search on the internet for `install Tkinter for YOURDISTRO`.
   - Ubuntu/Debian: `sudo apt install python3-tk`
   - Arch Linux: `sudo pacman -S tk`
   - Fedora: `sudo dnf install python3-tkinter`
2. Install GE-Proton, which is necessary to run the game and Aurora with. Using Valve's own Proton seems to work, but using GE-Proton is recommended:
   1. Search for and install `ProtonUp-QT` via your distro's software center. If using Flatpak, command is: `flatpak install net.davidotek.pupgui2`.
   2. Download the latest GE-Proton in `ProtonUp-QT`.
3. Restart Steam/SteamOS.
4. In a terminal session (Konsole if using KDE Plasma):
   1. Change directory to a location of your choosing, then run `git clone https://github.com/Merilairon/aurora-launcher`.  
      Make note of the directory obtained with `readlink -f aurora-launcher` (which will be labeled `{path/to/aurora-launcher}` for the rest of this guide).
   2. Run `chmod -R ug+x aurora-launcher`.  
      **NOTE:** To use this tool with the Flatpak version of Steam (not recommended), additional setup may be required.
5. In your Steam Library, open the game settings for the game you want to use Aurora with. Make sure you ran the game once before doing this!
   1. In the `Compatibility` tab, change the Proton version to the one installed in Step 2, or otherwise to the latest numbered Proton (e.g. Proton-9.0).
   2. Under `Launch Options`, input `{path/to/aurora-launcher}/aurora %command%`.
6. Start the game.
7. Select "no" to the "copy prefix question" if it appears and says `might work`.  
   If it mentions `likely works` (or better) go to step 8 (accept all).
8. Select download.
9. Select Yes/Ok until no more windows appear.  
   All rundll32.exe errors can safely be ignored (by clicking `no`).  
   Aurora should start with the game.
10. (Only done once): Login to your CheatHappens account in Aurora.
11. Select the game you're running from the Aurora library, then activate the trainer.
12. You may now enable or switch cheats. Closing the Aurora window will keep it running in the background.

aurora-launcher will automatically update if you installed it using step 4.

## Common Issues

### Dot Net Error

- If you see a .net error in Aurora that means your prefix is messed up.
- After you close the game the troubleshooter should come up (close in-game, not from Steam).

1. Select "Delete game prefix".
2. Rerun the game, and when it asks you to use an already installed prefix say no.
3. Click Download.
4. A tested prefix will be downloaded.
5. After that it should work.

## Additional

**aurora-launcher is based on the wemod-launcher project by DaniAsh551 and Marvin1099, adapted for Aurora/CheatHappens.**  
**If you find this tool helpful, please star the project.**
