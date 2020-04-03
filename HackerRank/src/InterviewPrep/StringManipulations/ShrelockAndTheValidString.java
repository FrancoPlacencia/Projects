package InterviewPrep.StringManipulations;

import java.util.HashMap;
import java.util.Map;

/**
 * Sherlock considers a string to be valid if all characters of the string appear the same number of times. <br>
 * It is also valid if he can remove just 1 character at 1 index in the string, and the remaining characters will occur the same number of times. <br>
 * Given a string <b>s</b>, determine if it is valid. If so, return YES, otherwise return NO.<br>
 *<br>
 * For example, if <code>s = abc</code>, it is a valid string because frequencies are <code>{a:1,b:1,c:1}</code>.<br>
 * So is <code>s = abcc</code> because we can remove one c and have 1 of each character in the remaining string.<br>
 * If <code>s = abccc</code> however, the string is not valid as we can only remove 1 occurrence of c. <br>
 * That would leave character frequencies of <code>{a:1,b:1,c:2}</code>.
 */
public class ShrelockAndTheValidString {

    public static void main(String[] args) {
        String s = "ebhcgicceggecgdcibbeicigehhebabiehbdgaeaigihghbhigihfebgabicbgfhhedgbfehiahchcecedffhccebifcbdfcfaecicafahfiecceeaabbecfhgbfifabbffadcieeaiidddhfdeccaedbgcfdehbadihheieidgcfbdiiicgahebfbbdfeffegbdhgdagefhbgafaabfghdcbfdhabhfahbdhgifbghhafcieachcbeabccbiigdcfegcccfafehegbiecbdhabcffggiifaabfagbfdfbfacdcafabccgibiidgabiabigbgbbaideeagaaffcddhieicehhchfedfgbgbfhgedhacegaieeedggacbbgadeibbbcdhbabbieibcfbhgdbbiecdhbffaghhchhddcihgdgbgdcfgfggeaahffgiddeadgcegaiddhhdgagdidgacafececiebeigcbdfaedibbgbhciihcdifbacdagfbcefifefchhddadeaiegbfaidbeebiefghfghhdabdeegabagfbbdgbeaiiigeaadhbgebedddfihagdeiccdbcfchgadhgfaidaebfabbagdghebgagbfhfbgeagdgecbhfchebdgafceaffabagedbhcgcedaecdbiifefchcbgfbbibhiahchhfadffeacfbgeigaccedadaafhcieficdfhfheibfdhbgbfhhdfcghabacggchchbdaigbcihhdbifcdeggicgacehebadbdaibhdciefdgfhfeggdhgcaeeeidfebbaicgagcaiachffhadbddhhdbcehciagfdgeadidfcaaiafeadefbbbaidgiagbeacchbdaifgccgcfigefcachiiggbghfhbifciafgfigaabidhdgffcbgicbidibacbgfhddafbegdaagbhddceeifecciddigfiehdbdabahgaechffidebhicfcciahhchebdbei";
        System.out.println(isValid(s));
    }

    /**
     *
     * @param s String length from 1 to 100,000, only minus chars from a-z
     * @return YES or NO
     */
    private static String isValid(String s) {
        String result = "YES";
        HashMap<String, Integer> frecuency = new HashMap<>();
        for(int i=0; i<s.length(); i++) {
            String key = "" + s.charAt(i);
            if(frecuency.containsKey(key )) {
                int newValue = frecuency.get(key);
                newValue++;
                frecuency.replace(key, newValue);
            } else {
                frecuency.put(key, 1);
            }
        }
        int timesFreq = 0;
        int manyDiff = 0;
        int sizeDiff = 0;
        for (Map.Entry<String, Integer> entry : frecuency.entrySet()) {
            System.out.println(entry.getKey() + ":" + entry.getValue());
            if(timesFreq == 0){
                timesFreq = entry.getValue();
            } else {
                if(entry.getValue() != timesFreq) {
                    int size = Math.abs(entry.getValue() - timesFreq);
                    if(sizeDiff == 0) {
                        sizeDiff = size;
                    } else {
                        if(sizeDiff < size) {
                            sizeDiff = size;
                        }
                    }
                    manyDiff++;
                }
            }
            if(manyDiff > 1) {
                result = "NO - manyDiff";
            } else {
                if(sizeDiff > 1 && manyDiff != 1) {
                    result = "NO -sizeDiff";
                }
            }
        }
        return result;
    }
}
