#include "MatrFun.h"

#define Gpio0ID XPAR_AXI_GPIO_0_DEVICE_ID
#define Gpio1ID XPAR_AXI_GPIO_1_DEVICE_ID
#define Gpio2ID XPAR_AXI_GPIO_2_DEVICE_ID
XGpio gpio0, gpio1, gpio2;
void initGPIO(){
	//initialize AXI GPIO
	XGpio_Initialize(&gpio0, Gpio0ID);
	XGpio_Initialize(&gpio1, Gpio1ID);
	XGpio_Initialize(&gpio2, Gpio2ID);

	//Set the direction of AXI GPIO
	XGpio_SetDataDirection(&gpio0, 1, 0x00000000); // set Element 0 to output
	XGpio_SetDataDirection(&gpio1, 1, 0x00000000); // set Element 1 to output
	XGpio_SetDataDirection(&gpio2, 1, 0xFFFFFFFF); // set Element 2 to input


}
void initMatrA(int a, int b, int c,
			   int d, int e, int f,
			   int g, int h, int i){

}

void initMatrB(int a, int b, int c,
		   int d, int e, int f,
		   int g, int h, int i){

}

void printMatrA(){
	xil_printf("A =\n");
}

void printMatrB(){
	xil_printf("B =\n");
}

void printMatrC(){
	xil_printf("C =\n");

}
void printDeterminant(){
	xil_printf("det(A) = ");

}

void transpose(){


}

void addition(){

}

void subtraction(){

}

void multiplication(){

}

void scalarMult(){

}

void determinant(){

}
