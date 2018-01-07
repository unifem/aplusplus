dnl Define macros for supporting HDF5.
dnl $Id: support-hdf5.m4,v 1.10 2001/10/24 02:29:44 gunney Exp $

AC_DEFUN(BTNG_VAR_SET_HDF5,[
dnl Provides support for the blas and lapack libraries.
dnl
dnl Arguments are:
dnl 1. Name of variable to set to path where hdf5 is installed.
dnl    Nothig is done if this variable is unset.
dnl 2. Name of the INCLUDES variable similar to the automake INCLUDES variable.
dnl    This variable is modified ONLY if it is NOT set.
dnl 3. Name of the LIBS variable similar to the automake LIBS variable.
dnl    This variable is modified ONLY if it is NOT set.
dnl
dnl If arg1 is defined, assume that the user wants blas and lapack
dnl support.  Do so by assigning arg2 and arg3 if they are not defined.
dnl
# Begin macro BTNG_VAR_SET_HDF5
if test "${$1+set}" = set ; then
  if test ! "${$2+set}" = set ; then
    test -n "${$1}" && $2="-I${$1}/include"
  fi
  if test ! "${$3+set}" = set ; then
    # Save for later recovery.
    btng_save_LIBS="$LIBS";
    # Extra libraries specific to this check.
    btng_extra_libs="$libz_LIBS -lm"
    # If a path is given, use it in the extra libs string.
    test -n "${$1}" && btng_extra_libs="-L${$1}/lib $btng_extra_libs"
    # Look for library.
    AC_SEARCH_LIBS([H5get_libversion],hdf5,[
      BTNG_AC_LOG_VAR(LIBS,After finding hdf5 flag)
      $3=`echo " $LIBS" | sed "s! $btng_save_LIBS!!"`; # Action if found
      # $3="$LIBS":	# Action if found
      # If path is given, add it to output variable.
      test -n "${$1}" && $3="-L${$1}/lib ${$3}"
      BTNG_AC_LOG_VAR($3, Found hdf5 library flag)
      ],[
      BTNG_AC_LOG_VAR($3, Did not find hdf5 library flag)
      AC_MSG_WARN(
[I could not systematically find the name of
the hdf5 library so I am using -lhdf5 instead.])
      $3="-lhdf5"
      test -n "${$1}" &&	\
	$3="-L${$1}/lib ${$3}"	# Add path flag to output variable.
      ],[
      $btng_extra_libs
      ])
    LIBS="$btng_save_LIBS";	# Restore global-use variable.
  else
    BTNG_AC_LOG(Not looking for hdf5 because $3 is not set)
  fi
fi
# End macro BTNG_VAR_SET_HDF5
])dnl



AC_DEFUN(BTNG_SUPPORT_HDF5,[
dnl Support hdf5 libraries by setting the variables
dnl hdf5_PREFIX, hdf5_INCLUDES, and hdf5_LIBS.
dnl Arg1: empty if you want the default to be off.
dnl
# Begin macro BTNG_SUPPORT_HDF5
BTNG_ARG_WITH_ENV_WRAPPER(hdf5, hdf5_PREFIX,
ifelse($1,,
[  --with-hdf5[=PATH]	Use HDF5 and optionally specify where it is installed.],
[  --without-hdf5	Do not use the HDF5 library.]),
ifelse($1,,unset hdf5_PREFIX; test "${with_hdf5+set}" = set && hdf5_PREFIX=,hdf5_PREFIX=))
BTNG_VAR_SET_HDF5(hdf5_PREFIX,hdf5_INCLUDES,hdf5_LIBS)
BTNG_AC_LOG_VAR(hdf5_PREFIX hdf5_INCLUDES hdf5_LIBS)
# End macro BTNG_SUPPORT_HDF5
])


