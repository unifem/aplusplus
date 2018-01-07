/* Copyright Robert C. Ferrell, CPCA Ltd.  1995 */

/* $Id: random-send-rcv-double.c,v 1.1.1.1 1999/06/09 02:04:07 dquinlan Exp $ */

/*
   void pgslib_random_send_rcv_double(SendS, RcvR)

This routines takes two inputs, a COMM_SEND and a COMM_RCV structure.
  COMM_SEND contains the data for the messages to be send.
  COMM_RCV  holds the received data.  Depending on the particular
            need, COMM_RCV may be pre-allocated, or parts of it
	    may be allocated on the fly.

Since this is a random send, we don't know how many messages we will
receive.  We handle this by doing a global count of the number of
messages to be sent, then keeping track of the number of messages
received.  Once we've received (globally) as many messages were sent, 
were done.

*/


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

#include "random-send-rcv.c"
