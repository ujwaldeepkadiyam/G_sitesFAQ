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
