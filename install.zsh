#!zsh

#Where we at?
FILEDIR=$(readlink --canonicalize $(dirname ${(%):-%x}))
echo "I think we are in $FILEDIR"

# Symlink everything in config subfolder to the ~/.config folder.
# Skip if already present and don't alter

mkdir -p ~/.config

for folder in config/*(/); do
    [[ ! -a ~/.config/$folder ]] && ln -s $FILEDIR/config/$folder ~/.config/$folder
done
