
#include "BugReport.hpp"

using namespace IPA;

/*
BugReport::BugReport(IRcodeData* IRcode)
{
	m_IRcode = IRcode;
}
*/


unsigned int BugReport::returnBugLocation()
{
	
	BugLocation* bugloc = popBugLocation();
	//1llvm::BasicBlock* bugloc_bb = bugloc->bb;
	//llvm::Instruction* bug_inst = bugloc->inst;

	unsigned int LineNum = 0;
	//if(DILocation* loc = bug_inst->getDebugLoc())
	if(DILocation* loc = bugloc->getDebugLoc())
	{
		LineNum = loc->getLine();
	}

	std::cout << "[LineNum] " << LineNum << std::endl; 

	return LineNum;

}

bool BugReport::showBugLocation(BugLocation* bugloc)
{

	unsigned int LineNum = 0;
	llvm::StringRef filename;
	llvm::StringRef dirname;
	//if(DILocation* loc = bug_inst->getDebugLoc())
	if(DILocation* loc = bugloc->getDebugLoc())
	{
		LineNum = loc->getLine();
		filename = loc->getFilename();
		dirname = loc->getDirectory();
		std::cout << " - Directory: " << dirname.str() << std::endl; 
		std::cout << " - Finename: " << filename.str() << std::endl; 
		std::cout << " - Line: " << LineNum << std::endl;
	}	

	return true;
}


bool BugReport::showBugLocation()
{
	while(m_BugLocationList.empty() == false)
	{
		BugLocation* bugloc = popBugLocation();
		//llvm::BasicBlock* bugloc_bb = bugloc->bb;
		//llvm::Instruction* bug_inst = bugloc->inst;

		unsigned int LineNum = 0;
		llvm::StringRef filename;
		llvm::StringRef dirname;
		//if(DILocation* loc = bug_inst->getDebugLoc())
		if(DILocation* loc = bugloc->getDebugLoc())
		{
			LineNum = loc->getLine();
			filename = loc->getFilename();
			dirname = loc->getDirectory();
			std::cout << " - Directory: " << dirname.str() << std::endl; 
			std::cout << " - Finename: " << filename.str() << std::endl; 
			std::cout << " - Line: " << LineNum << std::endl;
		}	
	}

	return true;
}

BugLocation* BugReport::popBugLocation()
{
	BugLocation* retBugLoc = m_BugLocationList.back();
	m_BugLocationList.pop_back();
	return retBugLoc;
}


bool BugReport::AddBugLocation(BugLocation* bugloc)
{
	m_BugLocationList.push_back(bugloc);
	return true;
}