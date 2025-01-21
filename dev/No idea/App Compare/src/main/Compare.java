package main;

import Entity.Activitie;
import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import javax.xml.XMLConstants;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

import org.apache.commons.lang3.StringEscapeUtils;

public class Compare {

    private static final String PATH = "./resources/xmls";
    private static final String EXCEL_FILE_LOCATION = "C:\\\\Apps\\MyFirstExcel.xls";

    public static void main(String[] args) {

        //1. Create an Excel file
        WritableWorkbook myFirstWbook = null;
        try {

            myFirstWbook = Workbook.createWorkbook(new File(EXCEL_FILE_LOCATION));

            // create an Excel sheet
            WritableSheet excelSheet = myFirstWbook.createSheet("Sheet 1", 0);

            // add something into the Excel sheet
            int rows = 10; // count
            int cols = 2;
            Label label = new Label(0, 0, "Palabra ID");
            excelSheet.addCell(label);
            label = new Label(1, 0, "Palabra");
            excelSheet.addCell(label);
            for(int i=0;i<cols;i++){
                for(int j=1; j<=rows;j++){
                    String a = "Test " + i + "-" + j;
                    label = new Label(i, j, a);
                    excelSheet.addCell(label);
                }

            }


            myFirstWbook.write();


        } catch (IOException e) {
            e.printStackTrace();
        } catch (WriteException e) {
            e.printStackTrace();
        } finally {

            if (myFirstWbook != null) {
                try {
                    myFirstWbook.close();
                } catch (IOException e) {
                    e.printStackTrace();
                } catch (WriteException e) {
                    e.printStackTrace();
                }
            }


        }

    }
}

