package InterviewPrep.warmup;

public class RepeatedString {
    public static void main(String[] args) {

        String s = "kmretasscityylpdhuwjirnqimlkcgxubxmsxpypgzxtenweirknjtasxtvxemtwxuarabssvqdnktqadhyktagjxoanknhgilnm";
        long n = 736778906400l;
        System.out.println(repeatedString(s,n));
    }

    private static long repeatedString(String s, long n) {
        if(s.equalsIgnoreCase("a")) {
            return n;
        } else {
            long occur = 0;
            long sSize = s.length();
            long mod = n % sSize;
            long div = n / sSize;
            for(int i=0; i<sSize; i++) {
                if(s.charAt(i) == 'a'){
                    occur++;
                }
            }
            occur = occur * div;
            for(int i=0; i<mod; i++) {
                if(s.charAt(i) == 'a'){
                    occur++;
                }
            }
            return occur;
            /*
            int occur = 0;
            StringBuffer t = new StringBuffer();
            while (t.length() < n) {
                t.append(s);
            }
            for(int i=0; i<n; i++) {
                if(t.charAt(i) == 'a'){
                    occur++;
                }
            }
            return occur;
            --------------------------------------------
            int occur = 0;
            int position = 0;
            int limit = s.length() -1;
            for(long i = 0; i<n; i++){
                if(position > limit) {
                    position = 0;
                }
                if(s.charAt(position) == 'a') {
                    occur++;
                }
                position++;
            }
            return occur;
            */
        }
    }
}
