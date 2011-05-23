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
