#!zsh

#Where we at?
FILEDIR=$(readlink --canonicalize $(dirname ${(%):-%x}))
echo "I think we are in $FILEDIR"

# Symlink everything in config subfolder to the ~/.config folder.
# Skip if already present and don't alter

mkdir -p ~/.config

for dir in config/*(/); do
    matchdir=${dir#"config/"}
    [[ ! -a ~/.config/$matchdir ]] && ln -s $FILEDIR/config/$matchdir ~/.config/$matchdir
done
