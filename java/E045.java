public class E045 {
    /**
     * @deprecated hexagonal numbers are also triangular numbers so there's no need for this method.
     */
    @Deprecated
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
    	
    	long pn = 165L + 1;
    	long hn = 143L;

    	while (p(pn) != h(hn)) {
        
    		if (p(pn) < h(hn)) {
    			++pn;
    			continue;
    		} else {
    			++hn;
    		}
    	}

        System.out.println(p(pn));
    }
}
