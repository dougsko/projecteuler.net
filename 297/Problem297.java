public class Problem297 {
    private static long[] fibo = new long[100];
    private static long[] sumZFibo = new long[100];

    private static long sumZ(long n) {
        if (n <= 3)
            return sumZFibo[(int)n];
        else {
            int i = 1;
            while (fibo[i] <= n)
                i++;
            i--;
            return sumZFibo[i] + sumZ(n - fibo[i]) + n - fibo[i];
        }
    }

    public static void main(String[] args) {
        final long max = 100000000000000000L;

        fibo[0] = 0;    sumZFibo[0] = 0;
        fibo[1] = 1;    sumZFibo[1] = 0;
        fibo[2] = 2;    sumZFibo[2] = 1;

        int i = 2;
        while (fibo[i++] <= max) {
            fibo[i] = fibo[i-1] + fibo[i-2];
            sumZFibo[i] = sumZFibo[i-1] + sumZFibo[i-2] + fibo[i-2];
        }

        System.out.println(sumZ(max));
    }
}
