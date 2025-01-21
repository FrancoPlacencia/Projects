package InterviewPrep.warmup;

public class CountingValleys {

    public static void main(String[] args) {
        int n= 12;
        String path = "DDUUDDUDUUUD";
        System.out.println(countingValleys(n, path));
    }
    public static int countingValleys(int n, String s) {
        int altitude = 0;
        int path [] = new int [n+1];
        path[0] = altitude;
        for(int i=0; i<n; i++){
            if(s.charAt(i) == 'U') {
                altitude++;
                path[i+1] = altitude;
            } else if (s.charAt(i) == 'D') {
                altitude--;
                path[i+1] = altitude;
            } else {
                // ERROR
            }
        }
        boolean valley = false;
        boolean montain = false;
        int valleys = 0;
        for(int i=0; i < path.length; i++) {
            int position = path[i];
            if(position == 0) {
                valley = false;
                montain = false;
            }
            if(position > 0 && !valley && !montain) {
                montain = true;
            }
            if(position < 0 && !valley && !valley) {
                valley = true;
                valleys++;
            }
            if (position > 0 && valley){
                valley = false;
                montain = true;
            }
            if (position < 0 && montain){
                valley = true;
                valleys++;
                montain = false;
            }
        }
        return valleys;
    }
}
