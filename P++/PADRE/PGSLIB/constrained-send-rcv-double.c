/*
   void pgslib_constrained_send_rcv_double(SendS, RcvR)

This routines takes two inputs, a COMM_SEND and a COMM_RCV structure.
  COMM_SEND contains the data for the messages to be send.
  COMM_RCV  holds the received data.  Depending on the particular
            need, COMM_RCV may be pre-allocated, or parts of it
	    may be allocated on the fly.

A barrier at the start of the routine insures that all PEs are ready for this
communication step.

*/


/* $Id: constrained-send-rcv-double.c,v 1.1.1.1 1999/06/09 02:04:06 dquinlan Exp $ */

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

#include "constrained-send-rcv.c"
