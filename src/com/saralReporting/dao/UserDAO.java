package com.saralReporting.dao;

import java.util.*;

import com.saralReporting.bean.UserBean;
import com.saralReporting.db.DbConnection;

import java.sql.*;

public class UserDAO {
	static Connection currentCon = null;
	static ResultSet rs = null;

	public static UserBean login(UserBean bean) {

		// preparing some objects for connection
		Statement stmt = null;

		String username = bean.getUsername();
		String password = bean.getPassword();

		String searchQuery = "SELECT m_adm_sign.sign_no, m_adm_sign.user_id, m_adm_sign.user_name, role_assignment.role_id, role_master.role_name, user_location.department_level_name, user_location.department_id, user_location_designation.designation_id, user_location_designation.designation_name FROM \"Saral\".m_adm_sign, \"Saral\".role_assignment, \"Saral\".role_master, \"Saral\".user_location, \"Saral\".user_location_designation WHERE (m_adm_sign.user_id = role_assignment.user_id) AND (role_assignment.role_id =  role_master.role_id) AND ((m_adm_sign.sign_no = '" + username + "') AND (m_adm_sign.passwd='" + password + "')) AND (m_adm_sign.user_id = user_location.user_id) AND (user_location.user_loc_id = user_location_designation.user_loc_id)";
		//String searchQuery = "SELECT m_adm_sign.sign_no, m_adm_sign.user_id, m_adm_sign.user_name, role_assignment.role_id, role_master.role_name, user_location.department_level_name, user_location.department_id, user_location_designation.designation_id, user_location_designation.designation_name FROM \"SaralDatabase\".m_adm_sign, \"SaralDatabase\".role_assignment, \"SaralDatabase\".role_master, \"SaralDatabase\".user_location, \"SaralDatabase\".user_location_designation WHERE (m_adm_sign.user_id = role_assignment.user_id) AND (role_assignment.role_id =  role_master.role_id) AND ((m_adm_sign.sign_no = '" + username + "') AND (m_adm_sign.passwd='" + password + "')) AND (m_adm_sign.user_id = user_location.user_id) AND (user_location.user_loc_id = user_location_designation.user_loc_id)";
				/*
				 * "SELECT * FROM \"SaralDatabase\".m_adm_sign Where sign_no = '"
				 * + username + "' AND passwd='" + password + "'";
				 */

		// "System.out.println" prints in the console; Normally used to trace
		// the process
		System.out.println("Your user name is " + username);
		System.out.println("Your password is " + password);
		System.out.println("Query: " + searchQuery);

		try {
			// connect to DB
			currentCon = DbConnection.initiateCon();
			stmt = currentCon.createStatement();
			rs = stmt.executeQuery(searchQuery);
			boolean more = rs.next();
			HashMap<String, String> hm = new HashMap<>();

			// if user does not exist set the isValid variable to false
			if (!more) {
				System.out.println("Sorry, you are not a registered user! Please sign up first");
				bean.setValid(false);
			}

			// if user exists set the isValid variable to true
			else if (more) {
				String user_name = rs.getString("user_name");
				String sign_no = rs.getString("sign_no");
				 String user_id = rs.getString("user_id");
				 String role_id1 = rs.getString("role_id");
				 String role_name1 = rs.getString("role_name");
				 String department_level_name = rs.getString("department_level_name");
				 String department_id = rs.getString("department_id");
				 String designation_id = rs.getString("designation_id");
				 String designation_name = rs.getString("designation_name");
				 //String location_id = rs.getString("location_id");
				 //String location_type_id = rs.getString("location_type_id");
				 //String state_id = rs.getString("state_id");
			     /*String firstName = rs.getString("firstName");*/
				System.out.println("Welcome " + user_name);
				hm.put(role_id1, role_name1);
				System.out.println("Role Id 1" + role_id1);
				System.out.println("Role Name 1" + role_name1);
				
				while(rs.next()){
					String role_id = rs.getString("role_id");
					String role_name = rs.getString("role_name");
					hm.put(role_id, role_name);	
				}
				
				System.out.println(hm);
				
				bean.setFirstName(user_name);
				bean.setSign_no(sign_no);
				bean.setUser_id(user_id);
				//bean.setRole_id(role_id);
				//bean.setRole_name(role_name);
				bean.setDepartment_level_name(department_level_name);
				bean.setDepartment_id(department_id);
				bean.setDesignation_id(designation_id);
				bean.setDesignation_name(designation_name);
				bean.setRole_list(hm);
				//bean.setLocation_id(location_id);
				//bean.setLocation_type_id(location_type_id);
				
				
				// String lastName = rs.getString("LastName");
				// bean.setLastName(lastName);
				bean.setValid(true);
			}
		}

		catch (Exception ex) {
			bean.setLoginMessage(ex.toString());
			System.out.println("Log In failed: An Exception has occurred! " + ex);
			System.out.println("Log In failed: Main issue is" + ex);
			return(bean);
		}

		// some exception handling
		finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception e) {
				}
				rs = null;
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

		return bean;

	}
}