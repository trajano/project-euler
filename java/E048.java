import java.math.*;

public class E048 {
    public static void main(final String[] argv) {
    	
    	BigInteger c = BigInteger.ZERO;
    	for (int i = 1; i <= 1000; ++i) {
    		BigInteger a = new BigInteger(String.valueOf(i)).pow(i);
    		c = c.add(a);
    	}

    	final String calced = c.toString(10);
        System.out.println(calced.substring(calced.length()-10));
    }
}
