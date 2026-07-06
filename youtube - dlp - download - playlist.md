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
