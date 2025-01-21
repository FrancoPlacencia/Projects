package Algorithm;

import java.util.List;

/*
procedure bubbleSort(A : list of sortable items)
    n := length(A)
    repeat
        swapped := false
        for i := 1 to n-1 inclusive do
            // if this pair is out of order
            if A[i-1] > A[i] then
                // swap them and remember something changed
                swap(A[i-1], A[i])
                swapped := true
            end if
        end for
    until not swapped
end procedure
 */
public class BubbleSort {


    public List<Integer> bubbleSortList(List<Integer> list){
        Integer temp = 0;
        for(int i=0; i < list.size(); i++){
            for(int j=1; j < (list.size()-i); j++){
                if(list.get(j-1) > list.get(j)){
                    //swap elements
                    temp = list.get(j-1);
                    list.set(j-1, list.get(j));
                    list.set(j, temp);
                }
            }
        }
        return list;
    }

    public Integer[] bubbleSortArray(Integer list[]){
        Integer temp = 0;
        for(int i=0; i < list.length; i++){
            for(int j=1; j < (list.length-i); j++){
                if(list[j-1] > list[j]){
                    //swap elements
                    temp = list[j-1];
                    list[j-1] = list[j];
                    list[j] = temp;
                }
            }
        }
        return list;
    }
}
