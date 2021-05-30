#include "MatrFun.h"

int main()
{
	initGPIO();
	printMatrA(0,1,2,3,4,5,6,7,8);
	printMatrB(0,1,2,3,4,5,6,7,8);

	initMatrA(0,1,2,3,4,5,6,7,8);
	transpose();
	printMatrC();


}
