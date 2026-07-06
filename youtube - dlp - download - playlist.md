# How to download a play list in mp4 in `githbash`

- Open `gitbash` in the folder where `yt-dlp.exe` is located.

```bash
./yt-dlp.exe \
  -f "bv*[ext=mp4][height<=1080]+ba[ext=m4a]/b[ext=mp4]" \
  -N 4 \
  -c \
  --download-archive downloaded.txt \
  --merge-output-format mp4 \
  -o "%(playlist_title)s/Stanford_LLM_Lecture-%(playlist_index)02d.mp4" \
  "https://www.youtube.com/playlist?list=PLoROMvodv4rOCXd21gf0CF4xr35yINeOy"
```

- If 1080p MP4 is not available, yt-dlp will automatically: fall back to best MP4 below 1080p (usually 720p)
- If you don’t specify ext=mp4, yt-dlp prefers WEBM for quality.

# Update ytdlp
```bash
./yt-dlp.exe -U
```
# UPDATED COMMAND

The Amrutham playlist consists of older TV media that was modernly upscaled and **remastered to HD**. For high-bitrate, remastered, or high-traffic entertainment content, YouTube completely drops legacy MP4 formats for resolutions above 720p to save bandwidth. Instead, it encodes the 1080p versions *strictly* using newer, more efficient video codecs:

* **VP9** (inside a `.webm` container)
* **AV1** (inside an `.mkv` container)

Because your command strictly looks for native MP4 video tracks (`[ext=mp4]`), it scans the Amrutham video formats, sees that the 1080p stream is WebM/AV1, rejects it, and is forced to drop down until it finds a native MP4 track—which happens to be the old 360p legacy stream (Format 18).

---

### The Universal Command

If you want a single command that works flawlessly for *both* Stanford lectures and Amrutham—giving you true 1080p while still outputting a final, highly-compatible `.mp4` file—just remove the strict `[ext=mp4]` requirement from the video stream selection.

Let `yt-dlp` grab the best 1080p stream (even if it's WebM), and let FFmpeg convert/merge it into your final MP4:

```bash
./yt-dlp.exe \
  --ffmpeg-location . \
  -f "bv*[height<=1080]+ba[ext=m4a]/b[height<=1080]" \
  -N 4 \
  -c \
  --download-archive downloaded.txt \
  --merge-output-format mp4 \
  -o "%(playlist_title)s/%(playlist_index)03d-%(title)s.mp4" \
  "PLAYLIST_URL_HERE"

```


Because your command included the --merge-output-format mp4 flag alongside your updated yt-dlp environment, FFmpeg has already done the heavy lifting automatically under the hood. The moment the download stream finished, yt-dlp automatically passed the raw files to FFmpeg, which instantly remuxed (stitched) them into a perfectly standard, native .mp4 container.

You do not need to run any extra conversion steps or commands. The file you are looking at right now in that properties window is a standalone, fully-baked 1080p MP4 file ready to play on any device. You are officially good to let the rest of the playlist run!


# Guide: Fixing the YouTube `n` Challenge Throttling Error in `yt-dlp`

### The Problem

YouTube frequently updates its video-throttling signature mechanism (known as the **`n` challenge**). When using cookies for bulk downloads, YouTube forces a JavaScript-based decryption challenge.

Because `yt-dlp` is a Python-based standalone binary, it **requires an external JavaScript runtime** installed on your system to process this challenge. Without it, `yt-dlp` fails to extract the high-definition video/audio streams, resulting in errors or falling back to only downloading thumbnail images.

Follow these steps to configure a JavaScript runtime environment and clear your cache to resolve the issue.

---

## Step 1: Install a JavaScript Runtime

`yt-dlp` natively looks for **Deno** because it runs securely in an isolated sandbox without modifying your local system node configurations.

1. Minimize Git Bash and open a standard Windows **PowerShell** window.
2. Paste the following official installation command and press **Enter**:

```powershell
irm https://deno.land/install.ps1 | iex

```

3. **Close all open terminal windows** (including Git Bash) after the installation completes. This ensures that Windows registers the newly added environment variables across your system.

> 💡 **Alternative:** If you already have **Node.js** installed on your machine for web development, you can skip this step. `yt-dlp` will automatically fall back and utilize your global `node` executable instead.

---

## Step 2: Clear the `yt-dlp` Cache

1. Re-open Git Bash.
2. Navigate back to your working directory:

```bash
cd /d/YOUTUBE-DOWNLOADER

```

3. Clear out the obsolete session tokens and corrupted handshake data stored in your local cache directory:

```bash
./yt-dlp.exe --rm-cache-dir

```

---

## Step 3: Run the Download Command

Execute the download script again. Ensure your browser is closed if you are pulling cookies directly from it, or reference your exported text file using the appropriate flags:

```bash
./yt-dlp.exe \
  --ffmpeg-location . \
  --cookies cookies.txt \
  -f "bv*[height<=1080]+ba[ext=m4a]/b[height<=1080]" \
  -N 4 \
  -c \
  --download-archive downloaded.txt \
  --merge-output-format mp4 \
  -o "%(playlist_title)s/Amrutham_Remastered-Ep-%(playlist_index)03d.mp4" \
  "https://www.youtube.com/playlist?list=PLiBmMNJci272DeFpLsrxofDWQO3VkO89r"

```

---

## Troubleshooting: Still Getting the Error?

If the system continues to throw format errors, your local binary might be missing the latest signature extraction rules required for YouTube's recent player modifications. Force a manual update to the absolute latest release of the application:

```bash
./yt-dlp.exe -U

```

Once your JavaScript runtime environment is active on your system path and `yt-dlp` is fully updated, the `n` challenge blocks will resolve, and your 1080p stream extractions will resume seamlessly.

####   Note
- Download `cookies.txt` from chrome using extension
- put `ffmpeg` in the same folder as `ytdlp`
