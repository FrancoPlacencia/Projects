/* Copyright (c) 2001-2011, The HSQL Development Group
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice, this
 * list of conditions and the following disclaimer.
 *
 * Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 *
 * Neither the name of the HSQL Development Group nor the names of its
 * contributors may be used to endorse or promote products derived from this
 * software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL HSQL DEVELOPMENT GROUP, HSQLDB.ORG,
 * OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */


package org.hsqldb.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class TestJDBCGeneratedColumns extends TestBase {

    public TestJDBCGeneratedColumns(String name) {
        super(name);
    }

    public void testInsert() {

        boolean successPrepared = false;
        boolean successDirect   = false;

        try {
            Connection c  = newConnection();
            Statement  st = c.createStatement();
            String     s  = "DROP TABLE T IF EXISTS";

            st.execute(s);

            s = "CREATE TABLE T (I INTEGER GENERATED BY DEFAULT AS IDENTITY(START WITH 33), C CHARACTER(10))";

            st.execute(s);

            s = "INSERT INTO T (C) VALUES('TEST')";

            st.execute(s, Statement.RETURN_GENERATED_KEYS);

            ResultSet rs = st.getGeneratedKeys();

            while (rs.next()) {
                System.out.println("generated: " + rs.getInt(1));

                successDirect = rs.getInt(1) == 33;
            }

            PreparedStatement ps = c.prepareStatement(s,
                Statement.RETURN_GENERATED_KEYS);

            ps.execute();

            rs = ps.getGeneratedKeys();

            while (rs.next()) {
                System.out.println("" + rs.getInt(1));

                successPrepared = rs.getInt(1) == 34;
            }

            ps.close();

            ps = c.prepareStatement(s, new int[]{ 1 });

            ps.execute();

            rs = ps.getGeneratedKeys();

            while (rs.next()) {
                System.out.println("" + rs.getInt(1));

                successPrepared &= rs.getInt(1) == 35;
            }

            ps.close();

            ps = c.prepareStatement(s, new String[]{ "I" });

            ps.execute();

            rs = ps.getGeneratedKeys();

            while (rs.next()) {
                System.out.println("" + rs.getInt(1));

                successPrepared &= rs.getInt(1) == 36;
                successPrepared &= rs.getBigDecimal(1).intValue() == 36;
            }

            ps.close();

            ps = c.prepareStatement(s, new String[]{ "I", "C" });

            ps.execute();

            rs = ps.getGeneratedKeys();

            while (rs.next()) {
                System.out.println("" + rs.getInt(1));

                successPrepared &= rs.getInt(1) == 37;
                successPrepared &= rs.getBigDecimal(1).intValue() == 37;

                successPrepared &= rs.getString(2).startsWith("TEST");
            }

            ps.close();

            ps = c.prepareStatement(s, new String[]{ "C", "I" });

            ps.execute();

            rs = ps.getGeneratedKeys();

            while (rs.next()) {
                System.out.println("" + rs.getInt(2));

                successPrepared &= rs.getInt(2) == 38;
                successPrepared &= rs.getBigDecimal(2).intValue() == 38;

                successPrepared &= rs.getString(1).startsWith("TEST");
            }

            ps.close();

        } catch (Exception e) {
            System.out.print(e);
        }

        assertTrue(successPrepared);
        assertTrue(successDirect);
    }

    public void testBatchInsert() {

        boolean successPrepared = false;
        boolean successDirect   = false;

        try {
            Connection c  = newConnection();
            Statement  st = c.createStatement();
            String     s  = "DROP TABLE T IF EXISTS";

            st.execute(s);

            s = "CREATE TABLE T (I INTEGER GENERATED BY DEFAULT AS IDENTITY(START WITH 33), C CHARACTER(10))";

            st.execute(s);

            s = "INSERT INTO T (C) VALUES('TEST')";

            PreparedStatement ps = c.prepareStatement(s,
                Statement.RETURN_GENERATED_KEYS);

            ps.addBatch();
            ps.addBatch();
            ps.executeBatch();

            ResultSet rs = ps.getGeneratedKeys();

            int val = 33;
            while (rs.next()) {
                System.out.println("" + rs.getInt(1));

                successPrepared = rs.getInt(1) == val;
                val ++;
            }

            ps.close();

            ps = c.prepareStatement(s, new int[]{ 1 });

            ps.addBatch();
            ps.addBatch();
            ps.executeBatch();

            rs = ps.getGeneratedKeys();

            while (rs.next()) {
                System.out.println("" + rs.getInt(1));

                successPrepared &= rs.getInt(1) == val;
                val ++;
            }

            ps.close();

            ps = c.prepareStatement(s, new String[]{ "I" });

            ps.addBatch();
            ps.addBatch();
            ps.executeBatch();

            rs = ps.getGeneratedKeys();

            while (rs.next()) {
                System.out.println("" + rs.getInt(1));

                successPrepared &= rs.getInt(1) == val;
                successPrepared &= rs.getBigDecimal(1).intValue() == val;
                val ++;
            }

            ps.close();

            ps = c.prepareStatement(s, new String[]{ "I", "C" });

            ps.addBatch();
            ps.addBatch();
            ps.executeBatch();

            rs = ps.getGeneratedKeys();

            while (rs.next()) {
                System.out.println("" + rs.getInt(1));

                successPrepared &= rs.getInt("I") == val;
                successPrepared &= rs.getBigDecimal(1).intValue() == val;

                successPrepared &= rs.getString("C").startsWith("TEST");
                val ++;
            }

            ps.close();

            ps = c.prepareStatement(s, new String[]{ "C", "I" });

            ps.addBatch();
            ps.addBatch();
            ps.executeBatch();


            rs = ps.getGeneratedKeys();

            while (rs.next()) {
                System.out.println("" + rs.getInt(2));

                successPrepared &= rs.getInt(2) == val;
                successPrepared &= rs.getBigDecimal(2).intValue() == val;

                successPrepared &= rs.getString(1).startsWith("TEST");
                val ++;
            }

            ps.close();

        } catch (Exception e) {
            System.out.print(e);
        }

        assertTrue(successPrepared);
    }

}
