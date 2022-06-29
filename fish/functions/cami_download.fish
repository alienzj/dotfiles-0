# Defined in /home/zhujie/.config/fish/functions/cami_download.fish @ line 1
function cami_download --description "CAMI dawnoloader" --argument url pattern destination
	java -jar ~/.local/bin/camiClient.jar -d $url $destination -p $pattern --threads 8 --retry 3
end
