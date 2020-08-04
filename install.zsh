#!zsh

#Where we at?
FILEDIR=$(readlink --canonicalize $(dirname ${(%):-%x}))
echo "I think we are in $FILEDIR"

# Symlink everything in config subfolder to the ~/.config folder.
# Skip if already present and don't alter

mkdir -p ~/.config

for dir in $FILEDIR/config/*(/); do
    matchdir=${dir#"$FILEDIR/config/"}
    [[ ! -a ~"/.config/$matchdir" ]] && ln -s "$dir" ~"/.config/$matchdir"
done

for customdir in $FILEDIR/custom/*(/); do
	if [ -e "$customdir/install.zsh" ]; then
		zsh "$customdir/install.zsh"
	fi
done
