# Minimalist Synced Lyrics

A clean, minimalist 3-line synced lyrics skin for Rainmeter. It fetches real-time lyrics using the LRCLIB API and synchronizes them perfectly with your music via WebNowPlaying.

## Features
* Real-time lyrics synchronization (displays previous, current, and next lines).
* Minimalist design with seamless text fading effects.
* Full UTF-8 support for multiple languages, including perfect Thai text rendering.
* Auto-hides seamlessly when the music stops or the player is closed.

## Requirements
To use this skin, you need to have the following installed:
* [Rainmeter](https://www.rainmeter.net/) (v4.5 or newer).
* A media player supported by WebNowPlaying (e.g., YouTube Music via browser).
* [WebNowPlaying Companion Extension](https://github.com/keifufu/WebNowPlaying-Companion) installed on your browser.

## Installation
1. Navigate to the **Releases** tab on the right side of this repository.
2. Download the latest `.rmskin` package.
3. Double-click the downloaded `.rmskin` file to install it automatically via Rainmeter.
4. Play a song on your supported media player, and the lyrics will appear on your desktop!

## Customization
You can easily change the font or size by right-clicking the skin, selecting **Edit skin**, and modifying the `[Variables]` section:
* `FontName`: Change to your preferred font (e.g., Leelawadee UI, Kanit).
* `FontSize`: Adjust the text size.
* `MaxWidth`: Adjust how wide the text block can stretch.

## Troubleshooting: Non-English Characters (????????)
If you are playing a song in a non-English language (such as Thai, Japanese, etc.) and the lyrics show up as question marks (`????????`), it is due to a Rainmeter file encoding requirement. 

To fix this:
1. Open the skin folder (`Documents\Rainmeter\Skins\MinimalSyncedLyrics`).
2. Open `Lyrics.ini` with **Notepad**.
3. Go to **File > Save As...** 
4. At the bottom of the save window, change the **Encoding** dropdown from `UTF-8` to **`UTF-16 LE`** (or **`Unicode`** in older Windows versions).
5. Save and replace the existing file.
6. Repeat the exact same steps for the `Sync.lua` file.
7. Right-click the skin on your desktop and select **Refresh skin**. The lyrics will now display perfectly!

## Credits
* Lyrics provided by the free and open-source [LRCLIB API](https://lrclib.net/).
* Developed by Supot Bamrung.
