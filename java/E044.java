import java.util.*;

public class E044 {

    private static final List<Long> pentagonals = new ArrayList<>();
    private static long highestPentagonal = 0;

    public static long p(long n) {
        return (n * (3 * n - 1)) / 2;
    }

    public static boolean condition(int k, int j) {
        return pentagonals.contains(pentagonals.get(k) + pentagonals.get(j)) && 
            pentagonals.contains(pentagonals.get(k) - pentagonals.get(j));
    }

    public static boolean condition1(int k, int j) {
        return pentagonals.contains(pentagonals.get(k) + pentagonals.get(j));
    }

    public static void addPentagonals(long until) {
        while (highestPentagonal < until) {
            highestPentagonal = p(pentagonals.size());
            pentagonals.add(highestPentagonal);
        }
    }

	public static void main(final String[] argv) {

        addPentagonals(145);

        int k = 1;

        while (true) {
            
            for (int j = 1; j < k; ++j) {

                long sum = pentagonals.get(k) + pentagonals.get(j);
                if (sum > highestPentagonal) {
                    addPentagonals(sum);
                }

                if (condition(k,j)) {
                    System.out.println(Math.abs(p(k) - p(j)));
                    return;
                }
            }
            ++k;
        }

    }
}
