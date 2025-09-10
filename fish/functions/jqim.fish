function jqim
    set query $argv[1]
    set file $argv[2]
    jq "'$(cat $HOME/.config/jq/utilidades.jq | sed 's/[[:space:]]/ /g'| sed ':a;N;$!ba;s/\n//g') $query'" $file
end

