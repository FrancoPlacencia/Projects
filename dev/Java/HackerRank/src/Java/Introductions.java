package Java;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.NumberFormat;
import java.util.*;

public class Introductions {

    /**
     * Challenge 01 Welcome to Java!
     * Challenge 02 Java Stdin and Stdout I
     * Challenge 03 Java If-Else
     * Challenge 04 Java Stdin and Stdout II
     * Challenge 05 Java Output Formatting
     * Challenge 06 Java Loops I
     * Challenge 07 Java Loops II
     * Challenge 08 Java Datatypes
     * Challenge 09 Java End-of-file
     * Challenge 10 Java Static Initializer Block
     * Challenge 11 Java Int to String
     * Challenge 12 Java Date and Time
     * Challenge 13 Java Currency Formatter
     *
     * @param args
     */
    public static void main(String[] args) {
        //challenge12();
    }

    /**
     * Welcome to Javas
     * You must print two lines of output:
     * <p>
     * Print Hello, World. on the first line.
     * Print Hello, Java. on the second line.
     */
    private static void challenge01() {
        System.out.println("Hello, World.");
        System.out.println("Hello, Java.");
    }

    /**
     * In this challenge, you must read 3 integers from stdin and then print them to stdout.
     * Each integer must be printed on a new line.
     */
    private static void challenge02() {
        // Using Scanner
        Scanner scanner = new Scanner(System.in);
        int a = scanner.nextInt();
        int b = scanner.nextInt();
        int c = scanner.nextInt();

        System.out.println(a);
        System.out.println(b);
        System.out.println(c);

        // Using BufferedReader
        try {
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in));
            int d = Integer.parseInt(bufferedReader.readLine());
            int e = Integer.valueOf(bufferedReader.readLine());
            int f = Integer.parseInt(bufferedReader.readLine());

            System.out.println(d);
            System.out.println(e);
            System.out.println(f);
        } catch (IOException ioException) {
            System.out.println("Error on Reading Input");
            ioException.printStackTrace();
        } catch (NumberFormatException numberFormatException) {
            System.out.println("Error on Parsing Input");
            numberFormatException.printStackTrace();
        }
    }

    /**
     * <b>Task:</b><br>
     * Given an integer, n, perform the following conditional actions:
     * <ul>
     * <li>If n is odd, print <b>Weird</b></li>
     * <li>If n is even and in the inclusive range of 2 to 5, print <b>Not Weird</b></li>
     * <li>If n is even and in the inclusive range of 6 to 20, print <b>Weird</b></li>
     * <li>If n is even and greater than 20, print <b>Not Weird</b></li>
     * </ul>
     * <br><br>
     * <b>Input Format:</b><br>
     * A single line containing a positive integer, .
     * <br><br>
     * <b>Constraints:</b><br>
     * 1 <= n >= 100
     */
    private static void challenge03() {
        Scanner scanner = new Scanner(System.in);
        int N = scanner.nextInt();
        scanner.skip("(\r\n|[\n\r\u2028\u2029\u0085])?");
        if (N % 2 != 0) {
            System.out.println("Weird");
        } else {
            if (N >= 2 && N <= 5) {
                System.out.println("Not Weird");
            } else if (N >= 6 && N <= 20) {
                System.out.println("Weird");
            } else {
                System.out.println("Not Weird");
            }
        }
        scanner.close();
    }

    /**
     * <b>Input Format:</b><br>
     * There are three lines of input:
     * <ol>
     * <li>The first line contains an <code>Int</code>.</li>
     * <li>The second line contains a <code>Double</code>.</li>
     * <li>The third line contains a <code>String</code>.</li>
     * </ol>
     * <br><b>Output Format:</b><br>
     * There are three lines of output:
     * <ol>
     * <li>On the first line, print <code>String</code>: followed by the unaltered String read from stdin.</li>
     * <li>On the second line, print <code>Double</code>: followed by the unaltered double read from stdin.</li>
     * <li>On the third line, print <code>Int</code>: followed by the unaltered integer read from stdin.</li>
     * </ol>
     * <b>Note:</b> If you use the <code>nextLine()</code> method immediately following the <code>nextLine()</code> method,
     * recall that <code>nextLine()</code> reads integer tokens;
     * because of this, the last newline character for that line of integer input is still queued in the input buffer and the next <code>nextLine()</code>
     * will be reading the remainder of the integer line (which is empty).
     */
    private static void challenge04() {
        Scanner scanner = new Scanner(System.in);
        int i = scanner.nextInt();
        double d = scanner.nextDouble();
        scanner.nextLine();
        String s = scanner.nextLine();
        scanner.close();

        System.out.println("String: " + s);
        System.out.println("Double: " + d);
        System.out.println("Int: " + i);
    }

    /**
     * Java's <code>System.out.printf</code> function can be used to print formatted output.
     * The purpose of this exercise is to test your understanding of formatting output using printf.
     *
     * <br><br><b>Input Format:</b><br>
     * Every line of input will contain a String followed by an integer.<br>
     * Each String will have a maximum of 10 alphabetic characters, and each integer will be in the inclusive range from 0 to 999.
     *
     * <br><br><b>Output Format:</b><br>
     * In each line of output there should be two columns:
     * <ul>
     * <li>The first column contains the String and is left justified using exactly  characters.</li>
     * <li>The second column contains the integer, expressed in exactly  digits;
     * if the original input has less than three digits, you must pad your output's leading digits with zeroes.</li>
     * </ul>
     * <b>Sample Input:</b><br>
     * java 100<br>
     * cpp 65<br>
     * python 50<br>
     * <br><b>Sample Output:</b><br>
     * ================================<br>
     * java           100<br>
     * cpp            065<br>
     * python         050<br>
     * ================================<br>
     * <br><b>Explanation:</b><br>
     * Each String is left-justified with trailing whitespace through the first 15 characters.
     * The leading digit of the integer is the 16th character,
     * and each integer that was less than 3 digits now has leading zeroes.
     */
    private static void challenge05() {
        Scanner scanner = new Scanner(System.in);
        System.out.println("================================");
        for (int i = 0; i <= 3; i++) {
            String s1 = scanner.next();
            int x = scanner.nextInt();
            System.out.printf("%-15s%03d\n", s1, x);
        }
        System.out.println("================================");
    }

    /**
     * <h3>Objective:</h3>
     * In this challenge, we're going to use loops to help us do some simple math.
     *
     * <br><br><b>Task:</b><br>
     * Given an integer, N, print its first 10 multiples. Each multiple N x i (where 1 <= i >= 10) should be printed
     * on a new line in the form: N x i = result.
     *
     * <br><br><b>Input Format:</b><br>
     * A single integer, N.
     *
     * <br><br><b>Constraints:</b><br>
     * 2 <= N >= 20
     *
     * <br><br><b>Output Format:</b><br>
     * Print 10 lines of output; each line i (where 1 <= i >= 10) contains the result of N x i in the form:
     * "N x i = result."
     */
    private static void challenge06() {
        try {
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in));
            int N = Integer.parseInt(bufferedReader.readLine().trim());
            if (N >= 2 && N <= 20) {
                for (int i = 1; i <= 10; i++) {
                    int result = N * i;
                    System.out.println(N + " x " + i + " = " + result);
                }
            }
            bufferedReader.close();
        } catch (IOException ioException) {
            System.out.println("Error on Reading Input");
            ioException.printStackTrace();
        }
    }

    /**
     * <h3>Objective:</h3>
     * <p>We use the integers a, b, and n to create the following series:</p>
     * <code>(a + 2^0 * b), (a + 2^0 * b + 2^1 * b), ... , (a + 2^0 *b + 2^1 * b + ... + 2^n-1 * b)</code>
     * <p>You are given q queries in the form of a, b, and n. For each query,
     * print the series corresponding to the given a, b, and n values as a single line of n space-separated integers.</p>
     *
     * <h3>Input Format:</h3>
     * <p>The first line contains an integer, q, denoting the number of queries.<br>
     * Each line i of the q subsequent lines contains three space-separated integers describing the respective a, b, and n
     * values for that query.<p>
     *
     * <h3>Constraints:</h3>
     * <ul>
     *     <li> 0 <= q <= 500</li>
     *     <li> 0 <= a,b <= 50 </li>
     *     <li> 1 <= n <= 15 </li>
     * </ul>
     *
     * <h3>Output Format:</h3>
     * <p>For each query, print the corresponding series on a new line. Each series must be printed in order as a single
     * line of n space-separated integers.</p>
     */
    private static void challenge07() {
        Scanner scanner = new Scanner(System.in);
        int q = scanner.nextInt();
        if (q >= 0 && q <= 500) {
            for (int i = 0; i < q; i++) {
                int a = scanner.nextInt();
                int b = scanner.nextInt();
                int n = scanner.nextInt();
                if (n >= 1 && n <= 15) {
                    if (a >= 0 && a <= 50) {
                        if (b >= 0 && b <= 50) {
                            //(a + 2^0 * b), (a + 2^0 * b + 2^1 * b), ... , (a + 2^0 *b + 2^1 * b + ... + 2^n-1 * b)</code>
                            int result = a;
                            for (int s = 0; s < n; s++) {
                                int serie = (int) (Math.pow(2, s)) * b;
                                result += serie;
                                System.out.print(result + " ");
                            }
                            System.out.println();
                        } else {
                            System.out.println("b must be in range (0,50)");
                        }
                    } else {
                        System.out.println("a must be in range (0,50)");
                    }
                } else {
                    System.out.println("N must be in range (1,15)");
                }
            }
        } else {
            System.out.println("q must be in range (0,500)");
        }
        scanner.close();
    }

    /**
     * <h3>Objective:</h3>
     * <p>Java has 8 primitive data types; char, boolean, byte, short, int, long, float, and double. For this exercise, we'll work with the primitives used to hold integer values (byte, short, int, and long):</p>
     * <ul>
     * <li>A <code>byte</code> is an 8-bit signed integer.</li>
     * <li>A <code>short</code> is a 16-bit signed integer.</li>
     * <li>An <code>int</code> is a 32-bit signed integer.</li>
     * <li>A <code>long</code> is a 64-bit signed integer.</li>
     * </ul>
     * Given an input integer, you must determine which primitive data types are capable of properly storing that input.
     *
     * <h3>Input Format:</h3>
     * <p>The first line contains an integer, T, denoting the number of test cases.<br>
     * Each test case, T, is comprised of a single line with an integer, n, which can be arbitrarily large or small.</p>
     *
     * <h3>Output Format:</h3>
     * <p>For each input variable  and appropriate primitive dataType, you must determine if the given primitives are capable of storing it. If yes, then print:</p>
     * <p>
     * "n can be fitted in:"<br>
     * "* dataType"
     * <p>If there is more than one appropriate data type, print each one on its own line and order them by size (i.e.: ).</p>
     * byte < short < int < long
     * <p>If the number cannot be stored in one of the four aforementioned primitives, print the line:</p>
     * "n can't be fitted anywhere."
     */
    private static void challenge08() {
        Scanner scanner = new Scanner(System.in);
        int t = scanner.nextInt();
        for (int i = 0; i < t; i++) {
            try {
                long x = scanner.nextLong();
                System.out.println(x + " can be fitted in:");
                int byteBits = 8;
                int shortBits = 16;
                int intBits = 32;
                int longBits = 64;
                if (x >= (Math.pow(2, byteBits) / 2) * -1 && x <= (Math.pow(2, byteBits) / 2) - 1) {
                    System.out.println("* byte");
                }
                if (x >= (Math.pow(2, shortBits) / 2) * -1 && x <= (Math.pow(2, shortBits) / 2) - 1) {
                    System.out.println("* short");
                }
                if (x >= (Math.pow(2, intBits) / 2) * -1 && x <= (Math.pow(2, intBits) / 2) - 1) {
                    System.out.println("* int");
                }
                if (x >= (Math.pow(2, longBits) / 2) * -1 && x <= (Math.pow(2, longBits) / 2) - 1) {
                    System.out.println("* long");
                }
            } catch (Exception e) {
                System.out.println(scanner.next() + " can't be fitted anywhere.");
            }

        }
        scanner.close();
    }

    /**
     * <h3>Objective:</h3>
     * <p>The challenge here is to read n lines of input until you reach EOF, then number and print all n lines of content.<br>
     * <b>Hint:</b> Java's Scanner.hasNext() method is helpful for this problem.</p>
     *
     * <h3>Input Format:</h3>
     * <p>Read some unknown n lines of input from stdin(System.in) until you reach EOF; each line of input contains a non-empty String.:</h3>
     *
     * <h3>Output Format:</h3>
     * <p>For each line, print the line number, followed by a single space, and then the line content received as input.</p>
     */
    private static void challenge09() {
        Scanner scanner = new Scanner(System.in);
        int i = 1;
        while (scanner.hasNext()) {
            System.out.println(i + " " + scanner.nextLine());
            i++;
        }
        scanner.close();
    }

    /**
     * <h3>Objective:</h3>
     * <p>Static initialization blocks are executed when the class is loaded, and you can initialize static variables in those blocks.</p>
     * <p>If B <= 0 or H <= 0 , the output should be "java.lang.Exception: Breadth and height must be positive".</p>
     *
     * <h3>Input Format:</h3>
     * <p>There are two lines of input. The first line contains B: the breadth of the parallelogram. The next line contains H: the height of the parallelogram.
     *
     * <h3>Constraints:</h3>
     * <ul>
     *     <li> -100 <= B <= 100</li>
     *     <li> -100 <= H <= 100</li>
     * </ul>
     *
     * <h3>Output Format:</h3>
     * <p>If both values are greater than zero, then the main method must output the area of the parallelogram. Otherwise, print "java.lang.Exception: Breadth and height must be positive" without quotes.</p>
     */
    private static void challenge10() {
        Scanner scanner = new Scanner(System.in);
        int B = scanner.nextInt();
        int H = scanner.nextInt();
        if(B <= 0 || H <= 0){
            System.out.println("java.lang.Exception: Breadth and height must be positive");
        } else {
            System.out.println(B * H);
        }
    }

    /**
     * <h3>Objective:</h3>
     * <p>You are given an integer n, you have to convert it into a string.</p>
     * -100 <= n >= 100
     */
    private static void challenge11() {
        Scanner in = new Scanner(System.in);
        int n = in.nextInt();
        in.close();
        if (n >= -100 && n <= 100) {
            System.out.println("String.valueOf\t" + String.valueOf(n));
            System.out.println("Integer.toString\t" + String.valueOf(n));
            System.out.println("String.format\t" + String.format("%d", n));
            System.out.println("StringBuffer\t" + new StringBuffer().append(n));
            System.out.println("StringBuilder\t" + new StringBuilder().append(n));
        } else {
            System.out.println("b must be in range [-100,100]");
        }
    }

    /**
     * <h3>Objective:</h3>
     * You are given a date. You just need to write the method, getDay, which returns the day on that date.
     *
     * <h3>Example:</h3>
     * Day: dd
     * Month: mm
     * Year: YYYY
     * The method should return DAY_OF_THE_WEEK as the day on that date.
     */
    private static void challenge12() {
        Scanner scanner = new Scanner(System.in);
        int month = scanner.nextInt();
        int day = scanner.nextInt();
        int year = scanner.nextInt();
        Calendar calendar = Calendar.getInstance();
        calendar.set(year, month - 1, day);
        String weekDay = "";
        switch (calendar.get(Calendar.DAY_OF_WEEK)) {
            case Calendar.SUNDAY -> weekDay = "SUNDAY";
            case Calendar.MONDAY -> weekDay = "MONDAY";
            case Calendar.TUESDAY -> weekDay = "TUESDAY";
            case Calendar.WEDNESDAY -> weekDay = "WEDNESDAY";
            case Calendar.THURSDAY -> weekDay = "THURSDAY";
            case Calendar.FRIDAY -> weekDay = "FRIDAY";
            case Calendar.SATURDAY -> weekDay = "SATURDAY";
            default -> weekDay = "UNKNOWN";
        }
        System.out.println(weekDay);
    }

    /**
     * <h3>Objective:</h3>
     * <p>Given a double-precision number, payment, denoting an amount of money, use the <code>NumberFormat</code> class'
     * <code>getCurrencyInstance</code> method to convert payment into the US, Indian, Chinese, and French currency formats.<br>
     * Then print the formatted values as follows:</p>
     * <p>
     * US: formattedPayment<br>
     * India: formattedPayment<br>
     * China: formattedPayment<br>
     * France: formattedPayment<br>
     *
     * <p>where formattedPayment is payment formatted according to the appropriate Locale's currency.</p>
     *
     * <b>Note:</b> <p>India does not have a built-in Locale, so you must construct one where the language is en (i.e., English).</p>
     *
     * <h3>Input Format:</h3>
     * <p>A single double-precision number denoting payment.</p>
     *
     * <h3>Constraints:</h3>
     * 0 <= payment <= 10^9
     *
     * <h3>Output Format:</h3>
     * <ul>
     * <li>On the first line, print "US: u" where u is payment formatted for US currency.</li>
     * <li>On the second line, print "India: i" where i is payment formatted for Indian currency.</li>
     * <li>On the third line, print "China: c" where c is payment formatted for Chinese currency.</li>
     * <li>On the fourth line, print "France: f", where f is payment formatted for French currency.</li>
     * </ul>
     */
    private static void challenge13() {
        Scanner scanner = new Scanner(System.in);
        double payment = scanner.nextDouble();
        if (payment >= 0 && payment <= Math.pow(10, 9)) {
            String us = NumberFormat.getCurrencyInstance(Locale.US).format(payment);
            String india = NumberFormat.getCurrencyInstance(new Locale("en", "in")).format(payment);
            String china = NumberFormat.getCurrencyInstance(Locale.CHINA).format(payment);
            String france = NumberFormat.getCurrencyInstance(Locale.FRANCE).format(payment);
            System.out.println("US: " + us);
            System.out.println("India: " + india);
            System.out.println("China: " + china);
            System.out.println("France: " + france);

        } else {
            System.out.println("payment must be in range [0,10^9]");
        }
    }
}
