import java.util.Calendar;
import java.util.GregorianCalendar;
import static java.util.Calendar.*;

public class E019 {
    public static void main(final String[] argv) {
        final Calendar c = new GregorianCalendar(1901, JANUARY, 1);
        final Calendar limit = new GregorianCalendar(2000, DECEMBER, 31);

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
