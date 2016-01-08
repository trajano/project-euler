import java.math.*;

public class E048 {
    public static void main(final String[] argv) {
    	
    	final long cap = Long.MAX_VALUE / 1000;
    	long c = 0;
    	for (long i = 1; i <= 1000; ++i) {
    		long a = 1;
    		for (int j = 0; j < i; ++j) {
    			a *= i;
    			if (a > cap) {
    				final String ta = String.valueOf(a);
    				a  = Long.valueOf(ta.substring(ta.length() - 10));
    			}
    		}
    		c += a;
    	}

    	final String calced = String.valueOf(c);
        System.out.println(calced.substring(calced.length() - 10));
    }
}
