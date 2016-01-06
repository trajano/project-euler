public class E045 {
	public static long t(long n) {
		return (n * (n + 1)) / 2;
	}

	public static long p(long n) {
		return (n * (3 * n - 1)) / 2;
	}

	public static long h(long n) {
		return n * (2 * n - 1);
	}

    public static void main(final String[] argv) {
    	long tn = 285L + 1;
    	long pn = 165L;
    	long hn = 143L;

    	while (t(tn) != p(pn) || p(pn) != h(hn)) {
        
    		if (t(tn) < p(pn)) {
    			++tn;
    			continue;
    		} else if (p(pn) < h(hn)) {
    			++pn;
    			continue;
    		} else {
    			++hn;
    		}
    	}

        System.out.println(t(tn));
    }
}
