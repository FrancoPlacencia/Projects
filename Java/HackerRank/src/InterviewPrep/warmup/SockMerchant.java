package InterviewPrep.warmup;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class SockMerchant {
    private static final Scanner scanner = new Scanner(System.in);

    public static void main(String[] args) {
        int n = 20;
        int [] ar = new int[] {4, 5, 5, 5, 6, 6, 4, 1, 4, 4, 3, 6, 6, 3, 6, 1, 4, 5, 5, 5};
        System.out.println(sockMerchant(n,ar));
    }

    public static int sockMerchant(int n, int [] ar) {
        List<Integer> list = new ArrayList<>();
        int pairs = 0;
        for(int i=0; i<n; i++){
            list.add(ar[i]);
        }
        while(!list.isEmpty()){
            // Search for a pair
            int firstSock = list.get(0);
            List<Integer> temp = list.subList(1, list.size());
            if(temp.contains(firstSock)) {
                // if pair found delete both socks
                int index = temp.indexOf(firstSock) + 1;
                list.remove(index);
                list.remove(0);
                pairs++;
            } else {
                // if no pair delete the sock
                list.remove(0);
            }
        }
        return pairs;
    }
}
