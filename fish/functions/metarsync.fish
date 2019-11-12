function metarsync --description 'meta rsync' --argument source dest
	rsync -rlptDvzm --stats --human-readable --progress --copy-links rsync://$source $dest
end
