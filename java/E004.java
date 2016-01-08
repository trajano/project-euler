import java.math.*;

public class E004 {
	public static boolean isPalindromicNumber(final int x) {
		char[] a = String.valueOf(x).toCharArray();
		for (int i = 0; i < a.length/2; ++i) {
			if (a[i] != a[a.length - i - 1]) {
				return false;
			}
		}
		return true;
	}

    public static void main(final String[] argv) {

        int last = 0;
		for (int i = 100; i <= 999; ++i) {
			for (int j = i; j <= 999; ++j) {
				final int c = i*j;
				if (isPalindromicNumber(c)) {
					last = Math.max(last, c);
				}
			}
		}
		System.out.println(last);
    }
}
