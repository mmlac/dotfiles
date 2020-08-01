#!zsh

#Where we at?
FILEDIR=$(readlink --canonicalize $(dirname ${(%):-%x}))

if [ -e ~/.gitconfig ]; then
	echo "Moving ~/.gitconfig to a backup file ~/.gitconfig.backup.<random number>"
	mv ~/.gitconfig "~/.gitconfig.backup.$RANDOM"
fi

echo "Creating a symlink for .gitconfig"
ln -s $FILEDIR/.gitconfig ~/.gitconfig

if [ -e ~/.gitconfig.user ]; then
	echo "~/.gitconfig.user file already exists. Configure your git customizations there"
else
	echo "Set your git global user information"
	vared -p "Git Email:" -c gitemail
	vared -p "Git Name:" -c gitname

	echo "Writing git info to ~/.gitconfig.user"

	cat <<EOT > ~/.gitconfig.user
[user]
email = $gitemail
name = $gitname
EOT
fi
