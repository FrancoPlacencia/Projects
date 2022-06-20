package InterviewPrep.StringManipulations;

import java.util.ArrayList;
import java.util.List;

/**
 * You are given a string containing characters  and  only. <br>
 * Your task is to change it into a string such that there are no matching adjacent characters. <br>
 * To do this, you are allowed to delete zero or more characters in the string.<br>
 * Your task is to find the minimum number of required deletions.<br>
 *
 * For example, given the string <b>s = AABAAB</b>, remove an <b>A</b> at positions <b>0</b> and <b>3</b> to make  in  deletions.<br>
 *
 * <b>Function Description</b>
 *
 * Complete the alternatingCharacters function in the editor below.
 * It must return an integer representing the minimum number of deletions to make the alternating string.
 *
 *
 *
 * For each query, print the minimum number of deletions required on a new line
 */
public class AlternatingCharacters {


    public static void main(String[] args) {
        List<String> list = new ArrayList<String>();
        list.add("AAAA");
        list.add("BBBBB");
        list.add("ABABABAB");
        list.add("BABABA");
        list.add("AAABBB");
        for(String s : list) {
            System.out.println(alternatingCharacters(s));
        }
    }

    /**
     *
     * @param s Each string  will consist only of characters <b>A</b> and <b>B</b>, the string from 1 to 100,000
     * @return
     */
    private static int alternatingCharacters(String s) {
        int deletes = 0;
        for(int i=0; i<s.length(); i++) {
            if(i==0) {
                //noting to do
                continue;
            } else {
                if(s.charAt(i) == s.charAt(i-1)) {
                    deletes++;
                }
            }
        }
        return deletes;
    }
}
