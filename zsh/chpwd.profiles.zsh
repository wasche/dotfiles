# Directory profiles
#
# Say you want certain settings to be active in certain directories.
# This is what you want.
#
# zstyle ':chpwd:profiles:/usr/src/grml(|/|/*)'   profile grml
# zstyle ':chpwd:profiles:/usr/src/debian(|/|/*)' profile debian
#
# When that's done and you enter a directory that matches the pattern
# in the third part of the context, a function called chpwd_profile_grml,
# for example, is called (if it exists).
#
# If no pattern matches (read: no profile is detected) the profile is
# set to 'default', which means chpwd_profile_default is attempted to
# be called.
#
# A word about the context (the ':chpwd:profiles:*' stuff in the zstyle
# command) which is used: The third part in the context is matched against
# ${PWD}. That's why using a pattern such as /foo/bar/(|/|/*) makes sense.
# Because that way the profile is detected for all these values of ${PWD}:
#   /foo/bar
#   /foo/bar/
#   /foo/bar/baz
# So, if you want to make double damn sure a profile works in /foo/bar
# and everywhere deeper in that tree, just use (|/|/*) and be happy.
#
# The name of the detected profile will be available in a variable called
# 'profile' in your functions. You don't need to do anything, it'll just
# be there.
#
# Then there is the parameter $CHPWD_PROFILE, set to the profile that is
# currently active. That way you can avoid running code for a profile
# that is already active, by running code such as the following at the
# start of your function:
#
# function chpwd_profile_grml() {
#     [[ ${profile} == ${CHPWD_PROFILE} ]] && return 1
#   ...
# }
#
# The initial value for $CHPWD_PROFILE is 'default'.
#
# Version requirement:
#   This feature requires zsh 4.3.3 or newer.
#   If you use this feature and need to know whether it is active in your
#   current shell, there are several ways to do that. Here are two simple
#   ways:
#
#   a) If knowing if the profiles feature is active when zsh starts is
#      good enough for you, you can put the following snippet into your
#      .zshrc.local:
#
#   (( ${+functions[chpwd_profiles]} )) && print "directory profiles active"
#
#   b) If that is not good enough, and you would prefer to be notified
#      whenever a profiles changes, you can solve that by making sure you
#      start *every* profile function you create like this:
#
#   function chpwd_profile_myprofilename() {
#       [[ ${profile} == ${CHPWD_PROFILE} ]] && return 1
#       print "chpwd(): Switching to profile: $profile"
#     ...
#   }
#
#     That makes sure you only get notified if a profile is *changed*,
#     not everytime you change directory, which would probably piss
#     you off fairly quickly. :-)
#
# There you go. Now have fun with that.
if [[ $ZSH_VERSION == 4.3.<3->* || $ZSH_VERSION == 4.<4->* || $ZSH_VERSION == <5->* ]] ; then

  CHPWD_PROFILE='default'
  function chpwd_profiles()
  {
    local -x profile

    zstyle -s ":chpwd:profiles:${PWD}" profile profile || profile='default'
    if (( ${+functions[chpwd_profile_$profile]} )) ; then
      chpwd_profile_${profile}
    fi

    CHPWD_PROFILE="${profile}"
    return 0
  }
  chpwd_functions=( ${chpwd_functions} chpwd_profiles )

fi
