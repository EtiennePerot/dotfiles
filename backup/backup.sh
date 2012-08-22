#!/usr/bin/env bash

actualFile="`readlink -f "$0"`"
cd "`dirname "$actualFile"`"

if [[ $EUID -ne 0 ]]; then
	exec sudo "$actualFile" "$@"
fi

if [ ! -e conf.sh ]; then
	echo "Missing config file at `pwd`/conf.sh."
	exit 1
fi
source conf.sh

for target in "${targets[@]}"; do
	echo "Backing up to $target..."
	includes=()
	for include in "${backupFiles[@]}"; do
		includes=("${includes[@]}" --include "$include")
	done
	excludes=()
	for exclude in "${excludedFiles[@]}"; do
		excludes=("${excludes[@]}" --exclude "$exclude")
	done
	gpgArgs=''
	for extraGpgArg in "${extraGpgArgs[@]}"; do
		gpgArgs="$gpgArgs $extraGpgArg"
	done
	export PASSPHRASE="$encryptionKeyPassphrase"
	export SIGN_PASSPHRASE="$signingKeyPassphrase"
	duplicity incremental                     \
		--name "$backupName"              \
		--archive-dir "$archiveDirectory" \
		--encrypt-key "$encryptionKey"    \
		--sign-key "$signingKey"          \
		--full-if-older-than "$fullEvery" \
		--volsize "$volumeSize"           \
		--exclude "$archiveDirectory"     \
		"${excludes[@]}"                  \
		"${includes[@]}"                  \
		--exclude '**'                    \
		--gpg-options="$gpgArgs"          \
		"${extraArgs[@]}"                 \
		/ "$target"
	unset SIGN_PASSPHRASE
	unset PASSPHRASE
done