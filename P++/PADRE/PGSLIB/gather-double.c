/* This routine moves data from nodeCommBufferData to offPEnodesData.
   gsENdata must be setup before this call.  That means that indexing
   and init_comm have been done.
   
The input is:
   nnodesThisPE
   nodeCommBufferData
   gsENdata (which knows how to do the communication)
   offPEnodesData (already allocated, but not loaded)

The output is node data at the elements
   offPEnodesData

   
   
*/

/* $Id: gather-double.c,v 1.1.1.1 1999/06/09 02:04:06 dquinlan Exp $ */

#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>

#include "pgslib-include-c.h"

#define PGSLIB_DATA_TYPE double
#define PGSLIB_ROUTINE_TYPE_POSTFIX double
#define PGSLIB_ROUTINE_NAME(Base_Name) Base_Name ## double_c
#define PGSLIB_TYPE_NAME(Base_Name) Base_Name ## double
#define PGSLIB_MPI_DATA_TYPE MPI_DOUBLE

#include "pgslib-types.h"

#include "gather.c"
