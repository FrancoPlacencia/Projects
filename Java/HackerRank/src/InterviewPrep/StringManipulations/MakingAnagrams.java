package InterviewPrep.StringManipulations;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Alice is taking a cryptography class and finding anagrams to be very useful.
 * We consider two strings to be anagrams of each other if the first string's letters can be rearranged to form the second string.
 * In other words, both strings must contain the same exact letters in the same exact frequency
 * For example, bacdc and dcbac are anagrams, but bacdc and dcbad are not.
 *
 * Alice decides on an encryption scheme involving two large strings where encryption is dependent on the minimum
 * number of character deletions required to make the two strings anagrams.
 * Can you help her find this number?
 *
 * Given two strings, A and B, that may or may not be of the same length, determine the minimum number of character
 * deletions required to make a and b anagrams. Any characters can be deleted from either of the strings.
 *
 * For example, if A=cde and B=dcf, we can delete e from string A and f from string B so that both remaining strings
 * are cd and dc which are anagrams.
 *
 * Function Description
 *
 * Complete the makeAnagram function in the editor below.
 * It must return an integer representing the minimum total characters that must be deleted to make the strings anagrams.
 *
 * makeAnagram has the following parameter(s):
 *
 * A: a string
 * B: a string
 *
 * Input Format
 *
 * The first line contains a single string, .
 * The second line contains a single string, .
 *
 * Constraints
 * 1 <= |a|,|b| <= 10^4
 * The strings a and b consist of lowercase English alphabetic letters ascii[a-z].
 */
public class MakingAnagrams {

    public static void main(String[] args) {
        String a = "fcrxzwscanmligyxyvym";
        String b = "jxwtrhvujlmrpdoqbisbwhmgpmeoke";
        System.out.println(makeAnagram(a,b));
    }

    private static int makeAnagram(String a, String b) {
        List<String> aList = new ArrayList<>();
        List<String> bList = new ArrayList<>();
        for(int i=0; i< a.length(); i++) {
            aList.add("" + a.charAt(i));
        }
        for(int i=0; i< b.length(); i++) {
            bList.add("" + b.charAt(i));
        }
        int deletes = aList.size() + bList.size();
        List<String> temp = new ArrayList<>();
        for(int i=0; i < aList.size(); i++) {
            if(bList.contains(aList.get(i))) {
                bList.remove(bList.indexOf(aList.get(i)));
                temp.add(aList.get(i));
            }
        }
        deletes -= temp.size() * 2;
        return deletes;
    }
}
