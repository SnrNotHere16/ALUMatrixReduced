 #ifndef MATFUN_H
 #define MATFUN_H
//AXI GPIO driver
#include "xgpio.h"

//send data over UART
#include "xil_printf.h"

//receive data over UART
#include "xuartlite_l.h"
//Reset FIFO
#include "xuartlite.h"
//information about AXI peripherals
#include "xparameters.h"
#include <stdio.h>
void initGPIO();

void initMatrA(int a, int b, int c,
			   int d, int e, int f,
			   int g, int h, int i);

void initMatrB(int a, int b, int c,
		   	   int d, int e, int f,
			   int g, int h, int i);

void printMatrA();

void printMatrB();

void printMatrC();

void printDeterminant();

void transpose();

void addition();

void subtraction();

void multiplication();

void scalarMult();

void determinant();



#endif
