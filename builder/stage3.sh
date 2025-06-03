#!/bin/bash
set -eux

ls -lahF

du -hd1 Direct3DS2_WinPortable

"C:\Program Files\7-Zip\7z.exe" a -t7z -m0=lzma2 -mx=7 -mfb=64 -md=128m -ms=on -mf=BCJ2 -v2140000000b Direct3DS2_WinPortable.7z Direct3DS2_WinPortable

ls -lahF
