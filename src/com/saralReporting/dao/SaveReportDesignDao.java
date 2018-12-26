package com.saralReporting.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import com.mysql.jdbc.Statement;
import com.saralReporting.bean.ReportBean;
import com.saralReporting.db.DbConnection;

public class SaveReportDesignDao {

	public static String insertData(ReportBean reportbean) throws SQLException {
		
		String msg = "";
		Connection currentCon = DbConnection.initiateCon();
		PreparedStatement psmt = null;
		String SQL_INSERT = "INSERT INTO \"Saral\".tbl_reportdesigner (service_id, department_id, version_no, filter_cls, having_cls, background, table_format, table_color, tooltip, report_header, report_footer, user_id, designation_id, grouping_cls, where_condition, report_name) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		psmt = currentCon.prepareStatement(SQL_INSERT,Statement.RETURN_GENERATED_KEYS);
		
				psmt.setLong(1, reportbean.getService_id());
				psmt.setLong(2, reportbean.getDepartment_id());
				psmt.setLong(3, reportbean.getVersion_no());
				psmt.setString(4, reportbean.getFilter());
				psmt.setString(5, reportbean.getHaving());
				psmt.setString(6, reportbean.getBackground_text());
				psmt.setString(7, reportbean.getTable_format());
				psmt.setString(8, reportbean.getTable_color());
				psmt.setString(9, reportbean.getTooltip());
				psmt.setString(10, reportbean.getReport_header());
				psmt.setString(11, reportbean.getReport_footer());
				psmt.setString(12, reportbean.getUser_id());
				psmt.setLong(13, reportbean.getDesignation_id());
				psmt.setString(14, reportbean.getGrouping());
				psmt.setString(15, reportbean.getWhere_condition());
				psmt.setString(16, reportbean.getReport_name());
				
				//System.out.println(psmt.executeQuery().toString());
				int i = psmt.executeUpdate();
				System.out.println(i+" records inserted");
				
				if (i == 0) {
		            throw new SQLException("Creating user failed, no rows affected.");
		        }

		        try (ResultSet generatedKeys = psmt.getGeneratedKeys()) {
		            if (generatedKeys.next()) {
		                Long report_id =  generatedKeys.getLong(1);
		                if(report_id != null){
		                	HashMap<String, String> hmco = reportbean.getSelectedColmn();
		                	PreparedStatement psmnt2 = null;
		                	System.out.println("Your service ID for inserted record is: "+ report_id);
		                	Iterator<Entry<String, String>> it = hmco.entrySet().iterator();
		                	 int a = 0;
		                	 while (it.hasNext()){
		                		 Map.Entry pair = (Map.Entry)it.next();
		                		 String SQL_INSERT1 = "INSERT INTO \"Saral\".tbl_report_selectedcolumn (report_id, report_selected_column_id, report_selected_column_name) VALUES (?,?,?)";
		                		 psmnt2 = currentCon.prepareStatement(SQL_INSERT1);
		                		 
		                		 psmnt2.setLong(1, report_id);
		                		 psmnt2.setString(2, (String) pair.getKey());
		                		 psmnt2.setString(3, (String) pair.getValue());
		                		 int reco = psmnt2.executeUpdate();
		                		 a = a + reco;
		                		 System.out.println("inserted record for columns" + a);
		                	}
		                	 
		                	 if(a==0){
		                		 msg = "Report Design not saved";
		                	 }else {
		                		 msg = "Report Design has been saved";
		                	 }
		                	psmnt2.close();
		                }
		                
		            }
		            else {
		                throw new SQLException("Inserting report format failed , no ID obtained.");
		            }
		        }
				psmt.close();
				currentCon.close();
				return msg;
	}
}