package Java;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

public class TestCMD {

    public static final String COMMAND = "tasklist -v";

    public static void main(String[] args) {
        Process process = null;
        try {
            process = Runtime.getRuntime().exec(COMMAND);
            System.out.println("the output stream is " + process.getOutputStream());
            BufferedReader reader=new BufferedReader( new InputStreamReader(process.getInputStream()));
            String s;
            List<String> strings = new ArrayList<>();
            int top = 0;
            while ((s = reader.readLine()) != null){
                strings.add(s);
                top++;
                if(top > 10) {
                    break;
                }
            }
            for(String string: strings){
                System.out.println(string);
                String[] splitted = string.split("\\s\\s+");
                System.out.println("hola");
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
