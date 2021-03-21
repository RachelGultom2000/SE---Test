// Rachel Gultom
// Palindrome Program
// Dynamic Palindrome 

#include <stdio.h>  
int main()  
{
    int n, i , j, temp, rem, num;
    printf("Enter value : ");
    scanf("%d",&n);
    int arr1[n];
    printf("Enter elements of array : ");
    for(i=0; i<n; i++)
    {
        scanf("%d",&arr1[i]);
    }
    
    
    //sorting of array in ascending order
    for(i=0; i<n; i++)
    {
        for(j=i+1; j<n; j++)
        {
           if(arr1[i]>arr1[j])
            {
                temp = arr1[i];
                arr1[i] = arr1[j];
                arr1[j] = temp;
            }
        }
    }
    for(i=n; i>=0; i--)
    {
        num = 0;
        temp = arr1[i];
        while(arr1[i]!=0)
        {
            rem = arr1[i] % 10;
            num = num*10 + rem;
            arr1[i] = arr1[i]/10;
        }
        if(num==temp)
        {
            printf("There are palindromes in the array : %d",num);
            break;
        } 
    }   
    if(i==-1)
    {
            printf("There is no palindrome in the array");
    }
    return 0;
} 
