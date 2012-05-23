//
//	File:		errorhandler.h
//
//	Purpose:	This file defines the error hancler classes.  
//

#ifndef ERRORHANDLER_H
#define ERRORHANDLER_H




//
// The Error Handler class
//
// This class defines and implements the error handler

class ErrorHandler {

private:
	vector<string>	etab;	// the erro table
	UINT32 errors;

public:
	ErrorHandler();
	~ErrorHandler();
	void	QueMsg(string &Msg);
	void	PrintMsgs(FILE *fp, UINT32 line);
	UINT32	GetNumErrors(void);
};



#endif // ERRORHANDLER_H