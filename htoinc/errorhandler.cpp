//
//	File:		errorhandler.cpp
//
//	Purpose:	This file implements the member functions for the
//				ErrorHandler class
//
//	Copyright 2003 by Tim Leonard, all rights reserved
//	

using namespace std;
#include <cstdlib>
#include <vector>
#include <string>
#include <map>
#include <list>


#include "mytypes.h"
//#include <stdio.h>
//#include <string.h>
#include "errorhandler.h"

extern	UINT32	errors;					// total number of error messages queued

//
//	Method:		ErrorHandler class constructor
//
//	Purpose:	Initialize the error handler 
//				sets next = 0, indicating an empty table and
//				initializes the errortable pointers to null.
//
//	Input:		nothing
//
//	Output:		nothing
//
//	Side Effects:
//

ErrorHandler::ErrorHandler (void) {

	errors = 0;
	etab.clear();
}


//
//	Method:		ErrorHandler class destructor
//
//	Purpose:	Clean up any errors left in the table and
//				release their memory.
//
//	Input:		nothing
//
//	Output:		nothing
//
//	Side Effects:
//				Releases dynamic memory
//
//

ErrorHandler::~ErrorHandler(void) {

}


//
//
//	Method:		QueueMsg
//
//	Purpose:	Place a message in the error table.
//
//				If the error table is full, the method discards
//				the message and returns without error.
//
//	Input:		pointer to a null terminated character string.
//
//	Output:		nothing
//
//	Side Effects:
//				Dynamic memory is allocated for the message string
//
//

void ErrorHandler::QueMsg(string &Msg) {

	errors++;
//
// throw away error messages if max number already stored.
//
	etab.push_back( Msg);
}



//
//	Method:	PrintMsgs
//
//	Purpose:	Write all messages in the error table to a file
//				and clear out the table.
//
//				If the error table is empty, nothing is written to
//				the file and no error is returned to the caller
//
//	Input:		file pointer where the message are to be printed
//				line number that errors occurred on
//
//	Output:		nothing
//
//	Side Effects:
//				Messages were assumed to held in dynamic memory storage.
//				This function calls delete to remove them.
//

void ErrorHandler::PrintMsgs(FILE *fp, UINT32 line) {

	if (errors) {

		for (UINT32 i=0; i<errors; i++) {

//			printf(" Line: %d  Error: %s",line,etab[i]);
			fprintf(fp," Line: %d  Error: %s",line,etab[i].c_str());
		}

	}
	errors = 0;
	etab.clear();
}


//
//	Method:	GetNumErrors
//
//	Purpose:	Return the total number of errors queued since analysis
//				started.
//
//	Input:		nothing
//
//	Output:		Number of error messages queued 
//
//	Side Effects:
//

UINT32 ErrorHandler::GetNumErrors(void) {

	return errors;
}


