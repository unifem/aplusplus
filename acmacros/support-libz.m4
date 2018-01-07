dnl Define macros for supporting z compression library.
dnl $Id: support-libz.m4,v 1.11 2002/01/30 16:33:49 gunney Exp $

AC_DEFUN(BTNG_VAR_SET_LIBZ,[
dnl Provides support for the z compression library.
dnl
dnl Arguments are:
dnl 1. Name of variable to set to path where z compression library is installed.
dnl    Nothig is done if this variable is unset.
dnl 2. Name of the INCLUDES variable similar to the automake INCLUDES variable.
dnl    This variable is modified ONLY if it is NOT set.
dnl 3. Name of the LIBS variable similar to the automake LIBS variable.
dnl    This variable is modified ONLY if it is NOT set.
dnl
dnl If arg1 is defined, assume that the user wants z compression
dnl support.  Do so by assigning arg2 and arg3 if they are not defined.
dnl
# End macro BTNG_VAR_SET_LIBZ
if test "${$1+set}" = set ; then
  if test ! "${$2+set}" = set ; then
    test -n "${$1}" && $2="-I${$1}/include"
  fi
  if test ! "${$3+set}" = set ; then
    btng_save_LIBS="$LIBS";	# Save for later recovery.
    btng_extra_libs=
    test -n "${$1}" && LIBS="-L${$1}/lib $LIBS"	# To facilitate library search.
    # Look for library.
    AC_SEARCH_LIBS([zlibVersion],z,[
      $3=`echo " $LIBS" | sed "s! $btng_save_LIBS!!"`; # Action if found
      test -n "${$1}" &&	\
	$3="-L${$1}/lib ${$3}"	# Add path flag to output variable.
      BTNG_AC_LOG_VAR($3, Found z compression library flag)
      ],[
      BTNG_AC_LOG_VAR($3, Did not find z compression library flag)
      ],[
      $btng_extra_libs
      ])
    LIBS="$btng_save_LIBS";	# Restore global-use variable.
  else
    BTNG_AC_LOG(Not looking for libz because $3 is not set)
  fi
fi
# End macro BTNG_VAR_SET_LIBZ
])dnl



AC_DEFUN(BTNG_SUPPORT_LIBZ,[
dnl Support z compression library by setting the variables
dnl libz_PREFIX, libz_INCLUDES, and libz_LIBS.
dnl Arg1: non-empty if you want the default to be on.
dnl
# Begin macro BTNG_SUPPORT_LIBZ

BTNG_ARG_WITH_ENV_WRAPPER(libz, libz_PREFIX,
ifelse($1,,
[  --with-libz[=PATH]
			Use z compression and optionally specify where
			it is installed.],
[  --without-libz	Do not use the z compression library.]),
ifelse($1,,unset libz_PREFIX; test "${with_libz+set}" = set && libz_PREFIX=,libz_PREFIX=))

BTNG_ARG_WITH_PREFIX(libz-includes,libz_INCLUDES,
[  --with-libz-includes=STRING
			Specify the INCLUDES flags for z compression.
			If not specified, and --with-libz=PATH is,
			this defaults to "-IPATH/include".])dnl

BTNG_ARG_WITH_PREFIX(libz-libs,libz_LIBS,
[  --with-libz-libs=STRING
			Specify LIBS flags for z compression.
			If not specified, and --with-libz=PATH is,
			this defaults to "-LPATH/lib -llapack -lblas".])dnl

BTNG_VAR_SET_LIBZ(libz_PREFIX,libz_INCLUDES,libz_LIBS)
# End macro BTNG_SUPPORT_LIBZ
])
