# Defined in /var/folders/8z/n1vqbscn3ns3l68jg4_w6g540000gn/T//fish.wVnppe/__fish_describe_command.fish @ line 2
function __fish_describe_command --description 'Command used to find descriptions for commands'
	
    # string match --quiet --regex '^[a-zA-Z0-9_ ]+$' -- "$argv"
    # or return
    # type -q apropos; or return
    # apropos $argv 2>/dev/null | awk -v FS=" +- +" '{
		# split($1, names, ", ");
		# for (name in names)
			# if (names[name] ~ /^'"$argv"'.* *\([18]\)/ ) {
				# sub( "( |\t)*\\\([18]\\\)", "", names[name] );
				# sub( " \\\[.*\\\]", "", names[name] );
				# print names[name] "\t" $2;
			# }
	# }'
end
