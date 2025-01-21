package InterviewPrep.warmup;

public class JumpingOnTheClouds {
    public static void main(String[] args) {
        int clouds [] = new int[]{0, 0, 0, 0, 1, 0};
        System.out.println(jumpingOnClouds(clouds));
    }

    private static int jumpingOnClouds(int[] c) {
        int n = c.length;
        int jumps = 0;
        for(int i=0; i<n ; i++) {
            // Can double jump
            int douleJump = i + 2;
            int simpleJump = i + 1;
            if(douleJump < n) {
                if(c[douleJump] != 1) {
                    jumps++;
                    i = simpleJump;
                    continue;
                }
            }
            if(simpleJump < n) {
                if(c[simpleJump] != 1) {
                    jumps++;
                    //i = simpleJump;
                }
            }
        }
        return jumps;
    }
}
