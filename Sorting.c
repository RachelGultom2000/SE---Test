// Rachel Gultom
// Sorting Program
// Algorithm : Insertion Sort

#include<stdio.h>
void main(){
	
	int i,j,a,n, number[30];
	
	printf("Input the value : \n"); 
	scanf("%d",&n);
	
	printf("Input the numbers : \n");
	for(i = 0; i < n; ++i)
	scanf("%d", &number[i]);
	
	for(i = 0; i < n; ++i){
		
		for (j = i + 1; j < n; ++j){
			
			if(number [i] > number [j])
			{
				a = number[i];
				number[i] = number[j];
				number[j] = a;
			}
		}
	}
	
	printf("Output the value : \n");
	for(i = 0; i < n; ++i)
	printf("%d\n", number[i]);
}
