#!zsh


#Where we at?
FILEDIR=$(readlink --canonicalize $(dirname ${(%):-%x}))

mkdir -p ~/.zsh.before
mkdir -p ~/.zsh.after

for file in $FILEDIR/after/*(.N); do
    matchfile=${file#"$FILEDIR/after/"}
    [[ ! -a ~"/.zsh.after/$matchfile" ]] && ln -s "$file" ~"/.zsh.after/$matchfile"
done


for file in $FILEDIR/before/*(.N); do
    matchfile=${file#"$FILEDIR/before/"}
    [[ ! -a ~"/.zsh.before/$matchfile" ]] && ln -s "$file" ~"/.zsh.before/$matchfile"
done
