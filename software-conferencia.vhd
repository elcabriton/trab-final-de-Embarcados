/******************************************************************************

                            Online C Compiler.
                Code, Compile, Run and Debug C program online.
Write your code in this editor and press "Run" button to compile and execute it.

*******************************************************************************/

#include <stdio.h>

int conv(int pixel[3][3]){ //pixel é uma matriz 3x3
    int mask[3][3];
    
    mask[0][0] = 1; mask[0][1] = 2; mask[0][2] = 1;
    mask[1][0] = 0; mask[1][1] = 0; mask[1][2] = 0;
    mask[2][0] = -1; mask[2][1] = -2; mask[2][2] = -1;
    
    int i = 1; int j = 1;
    int temp = (pixel[i-1][j-1] * mask[0][0]) + (pixel[i-1][j] * mask[0][1]) +
    (pixel[i-1][j+1] * mask[0][2]) + (pixel[i][j-1] * mask[1][0]) +
    (pixel[i][j] * mask[1][1]) + (pixel[i][j+1] * mask[1][2]) +
    (pixel[i+1][j-1] * mask[2][0]) + (pixel[i+1][j] * mask[2][1]) +
    (pixel[i+1][j+1] * mask[2][2]);
    return temp;
}


int main()
{
    int pixel[3][3] = {
        {15, 10, 10},
        {14, 24, 30},
        {10, 10, 23}
    };
    
    printf("\nResultado é: %d", conv(pixel));

    return 0;
}
