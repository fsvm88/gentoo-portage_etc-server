pre_src_prepare() {
    if ! type epatch_user > /dev/null 2>&1; then
        local names="epatch_user epatch evar_push evar_push_set evar_pop estack_push estack_pop"
        source <(awk "/^# @FUNCTION: / { p = 0 } /^# @FUNCTION: (${names// /|})\$/ { p = 1; } p { print  }" /usr/portage/eclass/eutils.eclass)
    fi

    epatch_user

    for name in $names; do
        unset $name
    done
}
