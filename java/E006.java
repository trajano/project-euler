import java.math.*;

public class E006 {
    public static void main(final String[] argv) {
    	

    	BigInteger c = BigInteger.ZERO;
    	for (int i = 1; i <= 100; ++i) {
    		BigInteger a = BigInteger.valueOf(i).pow(2);
    		c = c.add(a);
    	}

        int d = 0;
        for (int i = 1; i <= 100; ++i) {
            d += i;
        }
        BigInteger e = BigInteger.valueOf(d).pow(2);

        System.out.println(e.subtract(c));
    }
}
