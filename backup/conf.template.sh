# Please copy this file to conf.sh and change the values appropriately.

# Name of the backup
backupName="backup.`hostname`"

# Where to keep backup metadata (what has been backuped up, etc. This will automatically be excluded from the set of files to backup.
archiveDirectory="$HOME/.cache/duplicity"

# GPG keys; make sure these are in your keyring.
encryptionKey="D6E1C675"
signingKey="C3F591D0"

# Sadly, the encryption key's passphrase is required for this key too; see https://lists.nongnu.org/archive/html/duplicity-talk/2012-07/msg00003.html
encryptionKeyPassphrase="x4fqWVsBobSoa1dInpb5PLAcLWVWi_hgSNqZvekmo6POXd93"

# The signing key's passphrase is obviously required for signing
signingKeyPassphrase="MhM6dVr-qV_36UwnfKa9LesSuni4iqh2dxFbgn-0V0Qovxef"

# Files and directories to back up
backupFiles=(
	"/boot"
	"/etc"
	"/home"
	"/root"
	"/srv"
)

# Files and directories to exclude despite matching the patterns in $backupFiles. Note that $archiveDirectory is already excluded.
excludedFiles=(
)

# Destinations to back up to
targets=(
	"file:///media/homeserver/$HOME/backup"
)

# How far back should backups allow you to go
maxHistory="60D"

# How often should a full backup be done
fullEvery="30D"

# Backup volume size (megabytes)
volumeSize="384"

# Extra arguments for duplicity
extraArgs=(
	"--asynchronous-upload"
)

# Extra arguments for GPG
extraGpgArgs=(
	"--compress-algo=bzip2"
	"--bzip2-compress-level=9"
)