#include "MatrFun.h"

int main()
{
	int j = 0;
	initGPIO();
	resetMatr();
	printMatrA(0,1,2,3,4,5,6,7,8);
	initMatrA(0,1,2,3,4,5,6,7,8);
	initMatrB(0,1,2,3,4,5,6,7,8);
	transpose();
	printMatrC();
//	initMatrA(0,1,2,3,4,5,6,7,8);
//	initMatrB(0,1,2,3,4,5,6,7,8);
	//transpose();
	printMatrC();
	printMatrC();
	addition();
	printMatrC();
	subtraction();
	printMatrC();
	/*
	initMatrB(0,1,2,3,4,5,6,7,8);
	transpose();
	printMatrC();
	*/
	/*
	xil_printf("d d d\n");
	printMatrC();
	addition();
	printMatrC();
	subtraction();
	printMatrC();
	*/



}
