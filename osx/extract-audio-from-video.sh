# $1 - source file full
# another way - 
# ffmpeg -i video.ts -c:0 copy audio.ac3

ffmpeg -i $1 -c copy $1.mp3
