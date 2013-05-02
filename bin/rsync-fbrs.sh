#!/bin/sh
# 
# rsync FBRS from fbr01n to /usr/local/tripadvisor/
#   emails errors to <username>@tripadvisor.com
#   excludes media, URS, geo-rating, and typeahead service FBRS
#   by default copies world FBRS to /usr/local/tripadvisor/fbrs_1/
#   to also copy MA FBRS, uncomment section at end
#
# author: wfurr@tripadvisor.com
# last modified: 02 May 2013
#
fbrs_root="28942"
fbrs_dir="/usr/local/tripadvisor/fbrs/$fbrs_root/"
opts="--archive --delete --exclude=ff.media-* --exclude=ff.urs-* --exclude=ff.member-geo-ratings.dat* --exclude=ff.typeahead2.*"
email=`whoami`"@tripadvisor.com"

if [ "$1" = "--verbose" ]
then
opts=$opts" --verbose --progress --human-readable"
fi

rsync_errors[0]="Success"
rsync_errors[1]="Syntax or usage error"
rsync_errors[2]="Protocol incompatibility"
rsync_errors[3]="Errors selecting input/output files, dirs"
rsync_errors[4]="Requested  action not supported: an attempt was made to manipulate 64-bit files on a platform that cannot support them; or an option was specified that is supported by the client and not by the server."
rsync_errors[5]="Error starting client-server protocol"
rsync_errors[6]="Daemon unable to append to log-file"
rsync_errors[10]="Error in socket I/O"
rsync_errors[11]="Error in file I/O"
rsync_errors[12]="Error in rsync protocol data stream"
rsync_errors[13]="Errors with program diagnostics"
rsync_errors[14]="Error in IPC code"
rsync_errors[20]="Received SIGUSR1 or SIGINT"
rsync_errors[21]="Some error returned by waitpid()"
rsync_errors[22]="Error allocating core memory buffers"
rsync_errors[23]="Partial transfer due to error"
rsync_errors[24]="Partial transfer due to vanished source files"
rsync_errors[25]="The --max-delete limit stopped deletions"
rsync_errors[30]="Timeout in data send/receive"
rsync_errors[35]="Timeout waiting for daemon connection"

logger Starting rsync of $fbrs_dir
rsync $opts fbr01n::local/fbrs/$fbrs_root/ $fbrs_dir
exit_status=$?
if [ $exit_status -eq 0 ]
then
    logger rsync complete for $fbrs_root
else
    logger rsync failed!! for $fbrs_root
    mail -s "Rsync of FBRS failed with status $?" -t $email << EOF
        Error message: ${rsync_errors[$exit_status]}
EOF
fi

