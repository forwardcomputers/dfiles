# SUDO - shout at bash to su commands
# Distributed under GNU GPLv2, @jthistle on github

shopt -s expand_aliases

IFS_=${IFS}
IFS=":" read -ra PATHS <<< "$PATH"

for i in "${PATHS[@]}"; do
	for j in $( ls "$i" ); do
		if [ ${j^^} != $j ] && [ $j != "sudo" ]; then
			alias ${j^^}="sudo $j"
		fi		
	done
done

alias SUDO='sudo $(history -p !!)'

IFS=${IFS_}

# end SUDO
