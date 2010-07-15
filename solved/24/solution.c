#include <stdio.h>

void print(const int *v, const int size)
{
  int i;

  if (v != 0) {
    for ( i = 0; i < size; i++) {
      printf("%d", v[i] );
    }
    printf("\n");
  }
} // print


void swap(int *v, const int i, const int j)
{
  int t;
  t = v[i];
  v[i] = v[j];
  v[j] = t;
} 


void rotateLeft(int *v, const int start, const int n)
{
  int i;  
  int tmp = v[start];
  for (i = start; i < n-1; i++) {
    v[i] = v[i+1];
  }
  v[n-1] = tmp;
} // rotateLeft


void permute(int *v, const int start, const int n)
{
  print(v, n);
  if (start < n) {
    int i, j;
    for (i = n-2; i >= start; i--) {
      for (j = i + 1; j < n; j++) {
	swap(v, i, j);
	permute(v, i+1, n);
      } // for j
      rotateLeft(v, i, n);
    } // for i
  }
} // permute

int main(){
    int v[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};

    permute(v, 0, sizeof(v)/sizeof(int));
    return 0;
}
