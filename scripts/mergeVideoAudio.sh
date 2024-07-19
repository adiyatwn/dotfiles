#!/usr/bin/env bash

# Check if three arguments are provided
if [ $# -ne 3 ]; then
	echo "Usage: $0 video_file audio_file output_file"
	exit 1
fi

# Assign arguments to variables
video_file="$1"
audio_file="$2"
output_file="$3"

# Check if files exist
if [ ! -f "$video_file" ]; then
	echo "Error: Video file '$video_file' does not exist."
	exit 1
fi

if [ ! -f "$audio_file" ]; then
	echo "Error: Audio file '$audio_file' does not exist."
	exit 1
fi

# FFmpeg command with arguments
ffmpeg -i "$video_file" -i "$audio_file" -c:v copy -c:a aac "$output_file"

echo "Merged video and audio into $output_file"
