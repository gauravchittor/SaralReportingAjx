package com.saralReporting.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;

import com.saralReporting.db.DbConnection;

public class FetchServiceListDao {

	static Connection currentCon = null;

	public static HashMap<String, String> fetchServiceList(String deptId)	
	{
		HashMap<String, String> hm1 = new HashMap<String, String>();
		ResultSet rs1 = null;
		
		System.out.println("Value in Dao" + deptId);
		
		Statement stmt = null;
	
		String searchQuery = "SELECT service_code, service_name from \"Saral\".service_master WHERE dept_code='" + deptId + "' ";
		System.out.println("Query: " + searchQuery);
		
		
		currentCon = DbConnection.initiateCon();
		try {
			stmt = currentCon.createStatement();
			rs1 = stmt.executeQuery(searchQuery);
				
				while(rs1.next()){
					String service_code = rs1.getString("service_code");
					String service_name = rs1.getString("service_name");
					hm1.put(service_code, service_name);	
				}
			
			System.out.println(" HM1 " + hm1);
		} catch (Exception e) {
			System.out.println(e);
		}
		finally {
			if (rs1 != null) {
				try {
					rs1.close();
				} catch (Exception e) {
				}
				rs1 = null;
			}

			if (stmt != null) {
				try {
					stmt.close();
				} catch (Exception e) {
				}
				stmt = null;
			}

			if (currentCon != null) {
				try {
					currentCon.close();
				} catch (Exception e) {
				}

				currentCon = null;
			}
		}
		return hm1;
	}
	
	
	//function to fetch columns as per selected service
	
	public static HashMap<String, String> fetchColumns(String selectedRecord)	
	{
		HashMap<String, String> hm2 = new HashMap<String, String>();
		ResultSet rs2 = null;
		
		System.out.println("Value in Dao" + selectedRecord);
		
		Statement stmt = null;
	
		/*String searchQuery = "SELECT service_code, service_name from \"Saral\".service_master WHERE dept_code='" + selectedRecord + "' ";*/
		String searchQuery = "SELECT taskid, attribute_id, attribute_label FROM \"Saral\".attribute_master_data WHERE taskid='" + selectedRecord + "' ";
		
		System.out.println("Query: " + searchQuery);
		
		
		currentCon = DbConnection.initiateCon();
		try {
			stmt = currentCon.createStatement();
			rs2 = stmt.executeQuery(searchQuery);
				
				while(rs2.next()){
					String attribute_id = rs2.getString("attribute_id");
					String attribute_label = rs2.getString("attribute_label").trim();
					hm2.put(attribute_id, attribute_label);	
				}
			
			System.out.println(" HM2 " + hm2);
		} catch (Exception e) {
			System.out.println(e);
		}
		finally {
			if (rs2 != null) {
				try {
					rs2.close();
				} catch (Exception e) {
				}
				rs2 = null;
			}

			if (stmt != null) {
				try {
					stmt.close();
				} catch (Exception e) {
				}
				stmt = null;
			}

			if (currentCon != null) {
				try {
					currentCon.close();
				} catch (Exception e) {
				}

				currentCon = null;
			}
		}
		return hm2;
	}
}
