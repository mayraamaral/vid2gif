#!/bin/sh	

# default settings, modify if you want.

ffmpeg -y -i $1 -vf fps=30,scale=716:-1:flags=lanczos,palettegen palette.png
ffmpeg -i $1 -i palette.png -filter_complex "fps=30,scale=716:-1:flags=lanczos[x];[x][1:v]paletteuse" $2
rm palette.png
echo "GIF created successfully! Made by github.com/mayraamaral"
