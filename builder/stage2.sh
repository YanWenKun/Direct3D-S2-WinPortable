#!/bin/bash
set -eux

# Chores
gcs='git clone --depth=1 --no-tags --recurse-submodules --shallow-submodules'
workdir=$(pwd)
python_exe="${workdir}/Direct3DS2_WinPortable/python_standalone/python.exe"
export PYTHONPYCACHEPREFIX="${workdir}/pycache2"
export PATH="$PATH:$workdir/Direct3DS2_WinPortable/python_standalone/Scripts"

# MKDIRs
mkdir -p "$workdir"/Direct3DS2_WinPortable/extras
export HF_HUB_CACHE="$workdir/Direct3DS2_WinPortable/HuggingFaceHub"
mkdir -p "${HF_HUB_CACHE}"

# Relocate python_standalone
# This move is intentional. It will fast-fail if anything breaks.
mv  "$workdir"/python_standalone  "$workdir"/Direct3DS2_WinPortable/python_standalone

# Add MinGit (Portable Git)
curl -sSL https://github.com/git-for-windows/git/releases/download/v2.49.0.windows.1/MinGit-2.49.0-64-bit.zip \
    -o MinGit.zip
unzip -q MinGit.zip -d "$workdir"/Direct3DS2_WinPortable/MinGit
rm MinGit.zip

# Download Scripts
cd "$workdir"/Direct3DS2_WinPortable/
$gcs https://github.com/YanWenKun/Direct3D-S2-WinPortable-Scripts.git WinScripts

# Download Direct3D-S2
cd "$workdir"/Direct3DS2_WinPortable/
$gcs https://github.com/YanWenKun/Direct3D-S2.git

# Copy & overwrite attachments
cp -rf "$workdir"/attachments/. \
    "$workdir"/Direct3DS2_WinPortable/

cd "$workdir"
