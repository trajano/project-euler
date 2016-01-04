import java.util.Calendar;
import static java.util.Calendar.*;

public class E019 {
    public static void main(final String[] argv) {
        final Calendar c = Calendar.getInstance();
        c.set(MONTH, JANUARY);
        c.set(DAY_OF_MONTH, 1);
        c.set(YEAR, 1901);

        final Calendar limit = Calendar.getInstance();
        limit.set(MONTH, DECEMBER);
        limit.set(DAY_OF_MONTH, 31);
        limit.set(YEAR, 2000);

        int count = 0;
        while (c.before(limit)) {
        	if (c.get(DAY_OF_WEEK) == SUNDAY) {
        		++count;
        	}
        	c.add(MONTH, 1);
        }
        System.out.println(count);
    }
}
