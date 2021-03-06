/* Copyright Robert C. Ferrell, CPCA Ltd.  1995 */

/* $Id: attempt-receive-int.c,v 1.1.1.1 1999/06/09 02:04:06 dquinlan Exp $ */

/*
   int pgslib_attempt_receive_int(RcvR, myrank)
     COMM_RCV *RcvR;
     int       myrank;

This routine attemps to receive a message.  It first probes for a
message. If one has come in, then it receives it, otherwise it returns;

RETURN VALUE:
       0 = no message received
       > 0  message received

SIDE EFFECTS: 

If return value == 0, then there are no side effects.  

Data in RcvR is set by this routine.  If return value > 0, then a
  message was received.  
  N_Rcvd is incremented by one.
  N_Rcv_Buffers may have been increased, depending on flags.
*/

#include <stdlib.h>
#include "pgslib-include-c.h"

#define PGSLIB_DATA_TYPE int
#define PGSLIB_ROUTINE_TYPE_POSTFIX int
#define PGSLIB_ROUTINE_NAME(Base_Name) Base_Name ## int_c
#define PGSLIB_TYPE_NAME(Base_Name) Base_Name ## int
#define PGSLIB_MPI_DATA_TYPE MPI_INT

#include "pgslib-types.h"

#include "attempt-receive.c" 
