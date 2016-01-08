import java.math.*;

public class E056 {
    public static int digitalSum(final BigInteger c) {
        final byte[] bytes = c.toString(10).getBytes();
        int sum = 0;
        for (byte b : bytes) {
            sum += b - '0';
        }
        return sum;
    }

    public static void main(final String[] argv) {
    	
        int max = 0;
    	for (int a = 0; a < 100; ++a) {
            for (int b = 0; b < 100; ++b) {
    		  BigInteger c = new BigInteger(String.valueOf(a)).pow(b);
              max = Math.max(max, digitalSum(c));
            }
    	}

        System.out.println(max);
    }
}
