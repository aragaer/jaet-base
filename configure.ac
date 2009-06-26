AC_PREREQ([2.63])
AC_INIT([Just Another Eve Tool], [0.1], [aragaer@gmail.com])
AC_CONFIG_AUX_DIR([config])
AM_INIT_AUTOMAKE([-Wall -Werror foreign])
AC_CONFIG_FILES([Makefile
                 src/Makefile
                 src/components/Makefile
                 src/program/Makefile])
AC_ARG_WITH(gecko_sdk, AC_HELP_STRING([--with-gecko-sdk=DIR], [Path to Gecko SDK]))
AC_ARG_WITH(gecko_full_headers, AC_HELP_STRING([--with-gecko-headers=DIR], [Path to Gecko headers]))
AC_ARG_WITH(gecko_full_idl, AC_HELP_STRING([--with-gecko-idl=DIR], [Path to Gecko IDL files]))
AC_ARG_WITH(xpidl, AC_HELP_STRING([--with-xpidl=SOURCE_DIR], [Path to XPIDL binary]))

AC_PATH_PROG(PKG_CONFIG, pkg-config)

if test "x$with_gecko_sdk" != x -a "x$with_gecko_sdk" != xyes -a "x$with_gecko_sdk" != xno ; then
   IDLDIR="$with_gecko_sdk/idl"
   GECKO_INCLUDEDIR="$with_gecko_sdk/include"
   XPIDL="$with_gecko_sdk/bin/xpidl"
fi

if test "x$with_gecko_idl" != x -a "x$with_gecko_idl" != xyes -a "x$with_gecko_idl" != xno ; then
    IDLDIR="$with_gecko_idl"
fi

if test "x$with_gecko_headers" != x -a "x$with_gecko_headers" != xyes -a "x$with_gecko_headers" != xno ; then
    GECKO_INCLUDEDIR="$with_gecko_headers"
fi

if test "x$with_xpidl" != x -a "x$with_xpidl" != xyes -a "x$with_xpidl" != xno ; then
    XPIDL="$with_xpidl"
fi

xulrunner_package=libxul-unstable
if test x"$PKG_CONFIG" != x ; then
    if test x"$IDLDIR" = x ; then
        IDLDIR=`$PKG_CONFIG --variable=idldir $xulrunner_package`
        if test -d "$IDLDIR/unstable" ; then
            IDLDIR="$IDLDIR/unstable"
        fi
    fi
    if test x"$GECKO_INCLUDEDIR" = x ; then
        GECKO_INCLUDEDIR=`$PKG_CONFIG --variable=includedir $xulrunner_package`
        if test -d "$GECKO_INCLUDEDIR/unstable" ; then
            GECKO_INCLUDEDIR="$GECKO_INCLUDEDIR/unstable"
        fi
    fi
    if test x"$XPIDL" = x ; then
        sdkdir=`$PKG_CONFIG --variable=sdkdir $xulrunner_package`
        for i in "$sdkdir/bin/xpidl" "$sdkdir/xpidl" ; do
            if test -x $i ; then
                XPIDL=$i
            fi
        done         
        if test x"XPIDL" = x ; then 
            AC_MSG_ERROR([Can't find xpidl based on libxulrunner .pc file])
        fi
    fi
fi

if test "x$IDLDIR" != x ; then
   if ! test -f "$IDLDIR/nsIURI.idl" ; then
       AC_MSG_ERROR([Cannot find Gecko IDL files in $IDLDIR])
   fi
else
    AC_MSG_ERROR([Must either specify --with-gecko-sdk=DIR or --with-gecko-idl=DIR])
fi

if test "x$GECKO_INCLUDEDIR" != x ; then
   if ! test -f "$GECKO_INCLUDEDIR/nsIURI.h" ; then
       AC_MSG_ERROR([Cannot find Gecko headers in $GECKO_INCLUDEDIR])
   fi
else
    AC_MSG_ERROR([Must either specify --with-gecko-sdk=DIR or --with-gecko-headers=DIR])
fi

if test "x$XPIDL" != x ; then
    if ! test -x "$XPIDL" ; then
        AC_MSG_ERROR([Cannot find xpidl at $XPIDL])
    fi
else
    AC_MSG_ERROR([Must either specify --with-gecko-sdk=DIR or --with-xpidl=DIR])
fi

AC_SUBST(IDLDIR)
AC_SUBST(GECKO_INCLUDEDIR)
AC_SUBST(XPIDL)

AC_OUTPUT
