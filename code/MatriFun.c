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

void resetMatr() {
	for (int i = 0; i <= 26; i++) {
	XGpio_DiscreteWrite(&gpio0, 1, i);
	XGpio_DiscreteWrite(&gpio1, 1, 0);
	}
	XGpio_DiscreteWrite(&gpio0, 1, 27);

}
void sendString(unsigned char message []){
	char i = 0;
	 while(message[i]!='\0'){
		 XUartLite_SendByte(XPAR_AXI_UARTLITE_0_BASEADDR, message[i]);
	    i++;
	  }
}

int inputThreeDigitNumberTX(){
	int total = 0;
	int static first = 0;
	if (first != 0)
	while (XUartLite_RecvByte (XPAR_AXI_UARTLITE_0_BASEADDR)!=13);
	if (first == 0)
		first++;
	sendString("Enter your number\n");
	total +=  (XUartLite_RecvByte (XPAR_AXI_UARTLITE_0_BASEADDR)-48)*100;
	total +=  (XUartLite_RecvByte (XPAR_AXI_UARTLITE_0_BASEADDR)-48)*10;
	total +=  XUartLite_RecvByte (XPAR_AXI_UARTLITE_0_BASEADDR)-48;
	return total;
}
void initMatrA(int a, int b, int c,
			   int d, int e, int f,
			   int g, int h, int i){

	//int k = inputThreeDigitNumberTX();
	//xil_printf("%d\n", k);
	XGpio_DiscreteWrite(&gpio0, 1, 0);
	XGpio_DiscreteWrite(&gpio1, 1, a);
	//int m = inputThreeDigitNumberTX();
	//xil_printf("%d\n", m);
	XGpio_DiscreteWrite(&gpio0, 1, 1);
	XGpio_DiscreteWrite(&gpio1, 1, b);
	//m = inputThreeDigitNumberTX();

	//xil_printf("%d\n", m);
	XGpio_DiscreteWrite(&gpio0, 1, 63);
	XGpio_DiscreteWrite(&gpio0, 1, 2);
	XGpio_DiscreteWrite(&gpio1, 1, c);
	//m = inputThreeDigitNumberTX();
	//xil_printf("%d\n", m);
	XGpio_DiscreteWrite(&gpio0, 1, 3);
	XGpio_DiscreteWrite(&gpio1, 1, d);
	//m = inputThreeDigitNumberTX();
	//xil_printf("%d\n", m);
	XGpio_DiscreteWrite(&gpio0, 1, 4);
	XGpio_DiscreteWrite(&gpio1, 1, e);
	//m = inputThreeDigitNumberTX();
	//xil_printf("%d\n", m);
	XGpio_DiscreteWrite(&gpio0, 1, 5);
	XGpio_DiscreteWrite(&gpio1, 1, f);
	//m = inputThreeDigitNumberTX();
	//xil_printf("%d\n", m);
	XGpio_DiscreteWrite(&gpio0, 1, 6);
	XGpio_DiscreteWrite(&gpio1, 1, g);
	//m = inputThreeDigitNumberTX();
	//xil_printf("%d\n", m);
	XGpio_DiscreteWrite(&gpio0, 1, 7);
	XGpio_DiscreteWrite(&gpio1, 1, h);
	//m = inputThreeDigitNumberTX();
	//xil_printf("%d\n", m);
	XGpio_DiscreteWrite(&gpio0, 1, 8);
	XGpio_DiscreteWrite(&gpio1, 1, i);

	printMatrA(a,b,c,d,e,f,g,h,i);

}

void initMatrB(int a, int b, int c,
		   int d, int e, int f,
		   int g, int h, int i){

	//op:9-17 set matrix
	int m = inputThreeDigitNumberTX();
		xil_printf("0:%d\n", m);
		XGpio_DiscreteWrite(&gpio0, 1, 9);
		XGpio_DiscreteWrite(&gpio1, 1, m);
		m = inputThreeDigitNumberTX();
		xil_printf("1:%d\n", m);
		XGpio_DiscreteWrite(&gpio0, 1, 62);
		XGpio_DiscreteWrite(&gpio0, 1, 10);
		XGpio_DiscreteWrite(&gpio1, 1, m);
		m = inputThreeDigitNumberTX();
		xil_printf("2:%d\n", m);
		XGpio_DiscreteWrite(&gpio0, 1, 62);
		XGpio_DiscreteWrite(&gpio0, 1, 11);
		XGpio_DiscreteWrite(&gpio1, 1, m);
		m = inputThreeDigitNumberTX();
		xil_printf("3:%d\n", m);
		XGpio_DiscreteWrite(&gpio0, 1, 12);
		XGpio_DiscreteWrite(&gpio1, 1, m);
		m = inputThreeDigitNumberTX();
		xil_printf("4:%d\n", m);
		XGpio_DiscreteWrite(&gpio0, 1, 13);
		XGpio_DiscreteWrite(&gpio1, 1, m);
		m = inputThreeDigitNumberTX();
		xil_printf("5:%d\n", m);
		XGpio_DiscreteWrite(&gpio0, 1, 62);
		XGpio_DiscreteWrite(&gpio0, 1, 14);
		XGpio_DiscreteWrite(&gpio1, 1, m);
		m = inputThreeDigitNumberTX();
		xil_printf("6:%d\n", m);
		XGpio_DiscreteWrite(&gpio0, 1, 15);
		XGpio_DiscreteWrite(&gpio1, 1, m);
		m = inputThreeDigitNumberTX();
		xil_printf("7:%d\n", m);
		XGpio_DiscreteWrite(&gpio0, 1, 62);
		XGpio_DiscreteWrite(&gpio0, 1, 16);
		XGpio_DiscreteWrite(&gpio1, 1, m);
		XGpio_DiscreteWrite(&gpio0, 1, 62);
		m = inputThreeDigitNumberTX();
		xil_printf("8:%d\n", m);
		XGpio_DiscreteWrite(&gpio0, 1, 62);
		XGpio_DiscreteWrite(&gpio0, 1, 17);
		XGpio_DiscreteWrite(&gpio1, 1, m);
		printMatrB(a,b,c,d,e,f,g,h,i);

}

void printMatrA(int a, int b, int c,
				int d, int e, int f,
				int g, int h, int i){
	xil_printf("A =\n");
	xil_printf("%d %d %d\n", a,b,c);
	xil_printf("%d %d %d\n", d,e,f);
	xil_printf("%d %d %d\n\n", g,h,i);
}

void printMatrB(int a, int b, int c,
				int d, int e, int f,
				int g, int h, int i){
	xil_printf("B =\n");
	xil_printf("%d %d %d\n", a,b,c);
	xil_printf("%d %d %d\n", d,e,f);
	xil_printf("%d %d %d\n\n", g,h,i);
}

void printMatrC(){
	xil_printf("C =\n");
	XGpio_DiscreteWrite(&gpio0, 1, 18);
	xil_printf("%d ", XGpio_DiscreteRead(&gpio2,1));
	XGpio_DiscreteWrite(&gpio0, 1, 19);
	xil_printf("%d ", XGpio_DiscreteRead(&gpio2,1));
	XGpio_DiscreteWrite(&gpio0, 1, 20);
	xil_printf("%d\n", XGpio_DiscreteRead(&gpio2,1));
	XGpio_DiscreteWrite(&gpio0, 1, 21);
	xil_printf("%d ", XGpio_DiscreteRead(&gpio2,1));
	XGpio_DiscreteWrite(&gpio0, 1, 22);
	xil_printf("%d ", XGpio_DiscreteRead(&gpio2,1));
	XGpio_DiscreteWrite(&gpio0, 1, 23);
	xil_printf("%d\n", XGpio_DiscreteRead(&gpio2,1));
	XGpio_DiscreteWrite(&gpio0, 1, 24);
	xil_printf("%d ", XGpio_DiscreteRead(&gpio2,1));
	XGpio_DiscreteWrite(&gpio0, 1, 25);
	xil_printf("%d ", XGpio_DiscreteRead(&gpio2,1));
	XGpio_DiscreteWrite(&gpio0, 1, 26);
	xil_printf("%d\n\n", XGpio_DiscreteRead(&gpio2,1));
}
void printDeterminant(){
	xil_printf("det(A) = ");


}

void transpose(){
	XGpio_DiscreteWrite(&gpio0, 1, 16);
	XGpio_DiscreteWrite(&gpio1, 1, 8);
	XGpio_DiscreteWrite(&gpio0, 1, 28);
	xil_printf("\n\n");
}

void addition(){
	XGpio_DiscreteWrite(&gpio0, 1, 62);
	XGpio_DiscreteWrite(&gpio0, 1, 29);
	xil_printf("A+B = \n");
}

void subtraction(){
	XGpio_DiscreteWrite(&gpio0, 1, 63);
	XGpio_DiscreteWrite(&gpio0, 1, 30);
	xil_printf("A-B = \n");
}

void multiplication(){

}

void scalarMult(int c){

}

void determinant(){

}


