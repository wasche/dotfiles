# svn diff -B, then copies to ~/Deskop/patches/BRANCHNAME_revision
function trdiff
{
    svn_branch=`svn branch 2>/dev/null | sed -e 's/.*/&/'`
    bug_number=0

    if [[ "$svn_branch" == "MAINLINE" || "$svn_branch" == "PRERELEASE" || "$svn_branch" == "PRODUCTION" ]]; then
        echo "taking MAINLINE/PRERELEASE/PRODUCTION diff"
        if (( $# == 1 )); then
            svn_branch=$1
            bug_number=$1
            svn diff > diffs.txt || return $?
        else
            echo "usage: trdiff <bug number>"
            return 1
        fi
    else
        svn diff -B
    fi

    original_dest="${HOME}/Desktop/patches/${svn_branch}"

    destfile=$original_dest
    revisions=1

    while [ -f "$destfile" ]; do
        destfile="${original_dest}_${revisions}"
        revisions=$[revisions + 1]
    done

    echo "copying diffs.txt to $destfile"
    cp diffs.txt $destfile
    push_patches

    # Gets username/pw from SVNTR login
    decoded=`echo $SVNTR_AUTH | base64 -d`
    auth=(${decoded//:/ })
    username="${auth[0]}@tripadvisor.com"
    tabugz="bugz -b https://bugs.tripadvisor.com/ -u $username -p ${auth[1]}"

    # Attach the patch to a bug automatically & update bug status
    if [[ "$bug_number" -gt 60000 ]]; then
        echo "Uploading diff to bugzilla & grabbing bug"
        $tabugz attach --patch -d "auto-attaching $destfile" $bug_number $destfile
        $tabugz modify -s ASSIGNED -a "$username" $bug_number
    fi
}

function push_patches
{
    # implement to sync your patches somewhere (e.g. dev server -> laptop)
    #  I use: rsync -are ssh ~/Desktop/patches/ nmerritt.local:~/Desktop/patches/
}
