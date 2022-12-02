package Java;

import java.util.Scanner;

public class Strings {

    /**
     * challenge01  Java String Introduction
     * challenge02  Java Substring
     * challenge03  Java Substring Comparisons
     * challenge04  Java String Reverse
     * challenge05  Java Anagrams
     * challenge06  Java String Tokens
     * challenge07  Pattern Syntax Checker
     * challenge08  Java Regex
     * challenge09  Java Regex 2 - Duplicate Words
     * challenge10  Valid Username Regular Expression
     * challenge11  Tag Content Extractor
     *
     * @param args
     */
    public static void main(String[] args) {
        challenge02();
    }

    /**
     * <h3>Objective:</h3>
     * <p>This exercise is to test your understanding of Java Strings.<br>
     * The elements of a String are called characters. The number of characters in a String is called the length,
     * and it can be retrieved with the String.length() method.<br>
     * Given two strings of lowercase English letters, A and B, perform the following operations:</p>
     * <ol>
     *     <li>Sum the lengths of A and B.</li>
     *      <li>Determine if A is lexicographically larger than B (i.e.: does B come before A in the dictionary?).</li>
     *      <li>Capitalize the first letter in A and B and print them on a single line, separated by a space.</li>
     * </ol>
     * <h3>Input Format:</h3>
     * <p>The first line contains a string A. The second line contains another string B.<br>
     * The strings are comprised of only lowercase English letters.</p>
     * <h3>Output Format:</h3>
     * <p>There are three lines of output:</p>
     * <ol>
     *      <li>For the first line, sum the lengths of A and B.</li>
     *      <li>For the second line, write Yes if A is lexicographically greater than B otherwise print No instead.</li>
     *      <li>For the third line, capitalize the first letter in both A and B and print them on a single line, separated by a space.</li>
     * </ol>
     */
    private static void challenge01() {
        Scanner scanner = new Scanner(System.in);
        String A = scanner.nextLine();
        String B = scanner.nextLine();
        System.out.println(A.length() +  B.length());
        if(A.compareToIgnoreCase(B) > 0) {
            System.out.println("Yes");
        } else {
            System.out.println("No");
        }
        String upperA = A.substring(0,1).toUpperCase() + A.substring(1);
        String upperB = B.substring(0,1).toUpperCase() + B.substring(1);
        System.out.println( upperA + " " + upperB);
    }

    /**
     * <h3>Objective:</h3>
     * <p>Given a string, s, and two indices, start and end, print a substring consisting of all characters in the inclusive range from start to end-1.</p>
     *
     * <h3>Input Format:</h3>
     * <p>The first line contains a single string denoting s.<br>
     * The second line contains two space-separated integers denoting the respective values of start and end.</p>
     *
     * <h3>Constraints:</h3>
     * <ul>
     *     <li>1 <= |s| <= 100</li>
     *     <li>0 <= start < end <= n</li>
     *     <li>String  consists of English alphabetic letters (i.e.,[a-z,A-Z]) only.</li>
     * </ul>
     *
     * <h3>Output Format:</h3>
     * <p>Print the substring in the inclusive range from start to end-1.</p>
     */
    private static void challenge02() {
        Scanner scanner = new Scanner(System.in);
        String S = scanner.nextLine();
        int start = scanner.nextInt();
        int end = scanner.nextInt();
        if(S.length() >= 1 && S.length() <= 100){
            if(start >= 0 && start < end) {
                if(end > start && end <= S.length()){
                    if(S.matches("[a-zA-Z]+")){
                        System.out.println(S.substring(start, end));
                    } else {
                        System.out.println("S String must be alphabetic letters");
                    }
                } else {
                    System.out.println("end must be in range [" + start + "," + S.length() + "]");
                }
            } else {
                System.out.println("start must be in range [0," + end + "]");
            }
        } else {
            System.out.println("S String length must be in range [1,100]");
        }
    }
}
