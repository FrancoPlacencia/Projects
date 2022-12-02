import Algorithm.BubbleSort;

import java.util.ArrayList;
import java.util.List;

public class SortingAlgorithm {

    public static void main(String[] args) {
        BubbleSort bs = new BubbleSort();
        List<Integer> unorderedList = new ArrayList<Integer>();
        List<Integer> orderedList = new ArrayList<Integer>();
        System.out.println("Unordered List:");
        for(int i=0; i< 10; i++){
            unorderedList.add((int)(Math.random() * 100));
        }
        for(Integer num: unorderedList){
            System.out.println(num);
        }
        System.out.println("\nOrdered List:");
        orderedList.addAll(bs.bubbleSortList(unorderedList));
        for(Integer num: orderedList){
            System.out.println(num);
        }
    }
}
