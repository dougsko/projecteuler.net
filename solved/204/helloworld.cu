// example1.cpp : Defines the entry point for the console application. 
// compile with: nvcc -o helloworld helloworld.cu -lcudart
//
#include <stdio.h>
#include <stdlib.h>
#include <cuda.h>

__device__ int
get_global_id()
{
    int index;
    index =  blockIdx.x * blockDim.x + threadIdx.x;
    return index;
}

// Kernel that executes on the CUDA device __global__ void 
__global__ void 
square_array_gpu(float *a, int N) 
{
  int idx = get_global_id();
  int i;
  int count = 0;
  int factors[5];
  int remain;
  for(i = 0; i*i <= a[idx]; i += 2){
	if(remain = fmod(a[idx], i+1) == 0 ){
	  //count++;
	  factors[i] = i;
	}
  }
  for(i = 0; i < sizeof(factors); i++){
	  if(factors[i] > 5){
		  count++;
	  }
  }
  a[idx] = count;
  //a[idx] = a[idx] * a[idx];
}

// main routine that executes on the host int main(void) {
int
main(int argc, char **argv)
{
  float *a_h, *a_d; // Pointer to host & device arrays
  const int N = atoi(argv[1]); // Number of elements in arrays
  size_t size = N * sizeof(float);

  cudaEvent_t start, stop;
  cudaEventCreate(&start);
  cudaEventCreate(&stop);
  cudaEventRecord(start, 0);

  a_h = (float *)malloc(size); // Allocate array on host
  cudaMalloc((void **) &a_d, size); // Allocate array on device

  // Initialize host array and copy it to CUDA device
  for (int i=0; i < N; i++) 
  {
      a_h[i] = (float)i;
  }

  cudaMemcpy(a_d, a_h, size, cudaMemcpyHostToDevice);

  // Do calculation on device:
  //int block_size = 4;
  //int n_blocks = N/block_size + (N % block_size == 0 ? 0:1);
  square_array_gpu <<< 1, 1000>>> (a_d, sizeof(a_d));

  // Retrieve result from device and store it in host array
  cudaMemcpy(a_h, a_d, sizeof(float)*N, cudaMemcpyDeviceToHost);

  cudaEventRecord(stop, 0);
  cudaEventSynchronize(stop);
  float elapsedTime;
  cudaEventElapsedTime(&elapsedTime, start, stop);
  printf("Time to generate: %3.3f ms\n", elapsedTime);

  // Print results
  int count = 0;
  for (int i=0; i < N; i++)
  {
	if(a_h[i] == 0){
		count++;
	}
    printf("%d %.0f\n", i, a_h[i]);
  }
  printf("count = %d\n", count);

  // Cleanup
  free(a_h); 
  cudaFree(a_d);

  return 0;
}
