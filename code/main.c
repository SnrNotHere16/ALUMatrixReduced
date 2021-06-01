#include "MatrFun.h"

int main()
{
	int j = 0;
	initGPIO();
	resetMatr();
	initMatrA(0,1,2,3,4,5,6,7,8);
	initMatrB(0,1,2,3,4,5,6,7,8);
	transpose();
	printMatrC();
	addition();
	printMatrC();
	subtraction();
	printMatrC();
	multiplication();
	printMatrC();
	scalarMult(2);
	printMatrC();
}
