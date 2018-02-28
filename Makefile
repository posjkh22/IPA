SRC				=./src
LIB				=./lib
INCLUDE			=./include
BIT				=./bitcode
TESTCASE		= ./TestCases
TESTCLASS 		= testcase5
TEST			= testcase5-9
OPTION 			= --target=Linux
THREAD1			= --thread=Unithread
THREAD2			= --thread=Multithread

run: all
	./test $(TESTCASE)/$(TESTCLASS)/$(TEST).bc > test_out

run2: 
	./test $(TESTCASE)/$(TESTCLASS)/$(TEST).bc $(OPTION) $(THREAD1)


all: clean main Support ArgumentPass TaskManager IRcodeData IRcodeTextDataSet wFunction wBasicBlock wInstruction path pathImpl checker BugReport
	clang++ -std=c++11 \
	$(LIB)/main.o \
	$(LIB)/IRcodeData.o \
	$(LIB)/ArgumentPass.o \
	$(LIB)/TaskManager.o \
	$(LIB)/IRcodeTextDataSet.o \
	$(LIB)/wFunction.o \
	$(LIB)/wBasicBlock.o \
	$(LIB)/wInstruction.o \
	$(LIB)/Support.o \
	$(LIB)/Path.o \
	$(LIB)/PathImpl.o \
	$(LIB)/checker.o \
	$(LIB)/BugReport.o \
	-o test \
	`llvm-config --cxxflags --libs --ldflags --system-libs`
	
main:
	clang++ -std=c++11 -c main.cpp  \
	-o $(LIB)/main.o \
	`llvm-config --cxxflags` \
	-I$(INCLUDE)

Support:
	clang++ -std=c++11 \
	-c $(SRC)/Support.cpp \
	-o $(LIB)/Support.o \
	-I$(INCLUDE) \
	`llvm-config --cxxflags`

ArgumentPass:
	clang++ -std=c++11 \
	-c $(SRC)/ArgumentPass.cpp \
	-o $(LIB)/ArgumentPass.o \
	-I$(INCLUDE) \
	`llvm-config --cxxflags`

TaskManager:
	clang++ -std=c++11 \
	-c $(SRC)/TaskManager.cpp \
	-o $(LIB)/TaskManager.o \
	-I$(INCLUDE) \
	`llvm-config --cxxflags`

IRcodeData:
	clang++ -std=c++11 \
	-c $(SRC)/IRcodeData.cpp \
	-o $(LIB)/IRcodeData.o \
	`llvm-config --cxxflags` \
	-I$(INCLUDE)

IRcodeTextDataSet:
	clang++ -std=c++11 \
	-c $(SRC)/IRcodeTextDataSet.cpp \
	-o $(LIB)/IRcodeTextDataSet.o \
	`llvm-config --cxxflags` \
	-I$(INCLUDE)

wFunction:
	clang++ -std=c++11 \
	-c $(SRC)/wFunction.cpp \
	-o $(LIB)/wFunction.o \
	`llvm-config --cxxflags` \
	-I$(INCLUDE)
	
wBasicBlock:
	clang++ -std=c++11 \
	-c $(SRC)/wBasicBlock.cpp \
	-o $(LIB)/wBasicBlock.o \
	`llvm-config --cxxflags` \
	-I$(INCLUDE)

wInstruction:
	clang++ -std=c++11 \
	-c $(SRC)/wInstruction.cpp \
	-o $(LIB)/wInstruction.o \
	-I$(INCLUDE) \
	`llvm-config --cxxflags`

path:
	clang++ -std=c++11 \
	-c $(SRC)/Path.cpp \
	-o $(LIB)/Path.o \
	-I$(INCLUDE) \
	`llvm-config --cxxflags`

pathImpl:
	clang++ -std=c++11 \
	-c $(SRC)/PathImpl.cpp \
	-o $(LIB)/PathImpl.o \
	-I$(INCLUDE) \
	`llvm-config --cxxflags`

checker:
	clang++ -std=c++11 \
	-c $(SRC)/checker.cpp \
	-o $(LIB)/checker.o \
	-I$(INCLUDE) \
	`llvm-config --cxxflags`

BugReport:
	clang++ -std=c++11 \
	-c $(SRC)/BugReport.cpp \
	-o $(LIB)/BugReport.o \
	-I$(INCLUDE) \
	`llvm-config --cxxflags`

clean:
	rm -f test test_out $(LIB)/*.o