#include "MatrFun.h"

int main()
{
	initGPIO();
	resetMatr();
	//initMatrA(0,1,2,3,4,5,6,7,8);
	//initMatrA(8,7,6,5,4,3,2,1,0);
	//initMatrB(0,1,2,3,4,5,6,7,8);
	initMatrA(20,11,4,-5,3,4,8,-100,25);
	initMatrB(1,0,0,0,1,0,0,0,1);
	transpose();
	printMatrC();
	addition();
	printMatrC();
	subtraction();
	printMatrC();
	multiplication();
	printMatrC();
	//scalarMult(2);
	scalarMult(-4);
	printMatrC();
	determinant();
}
