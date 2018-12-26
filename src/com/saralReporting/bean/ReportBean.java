package com.saralReporting.bean;

import java.util.HashMap;

public class ReportBean {
	
	private Long service_id;
	private Long department_id;
	private Long version_no;
	private String filter;
	private String having;
	private String background_text;
	private String table_format;
	private String table_color;
	private String tooltip;
	private String header_image_id;
	private String footer_image_id;
	private String report_header;
	private String report_footer;
	private String user_id;
	private Long designation_id;
	private String grouping;	
	private String where_condition;
	private String sub_query;
	private String final_query;
	private String report_name;
	/*private String report_id;*/
	private HashMap<String, String> selectedColmn;
	
	
	public Long getService_id() {
		return service_id;
	}
	public void setService_id(Long service_id) {
		this.service_id = service_id;
	}
	public Long getDepartment_id() {
		return department_id;
	}
	public void setDepartment_id(Long department_id) {
		this.department_id = department_id;
	}
	public Long getVersion_no() {
		return version_no;
	}
	public void setVersion_no(Long version_no) {
		this.version_no = version_no;
	}
	public String getFilter() {
		return filter;
	}
	public void setFilter(String filter) {
		this.filter = filter;
	}
	public String getHaving() {
		return having;
	}
	public void setHaving(String having) {
		this.having = having;
	}
	public String getBackground_text() {
		return background_text;
	}
	public void setBackground_text(String background_text) {
		this.background_text = background_text;
	}
	public String getTable_format() {
		return table_format;
	}
	public void setTable_format(String table_format) {
		this.table_format = table_format;
	}
	public String getTable_color() {
		return table_color;
	}
	public void setTable_color(String table_color) {
		this.table_color = table_color;
	}
	public String getTooltip() {
		return tooltip;
	}
	public void setTooltip(String tooltip) {
		this.tooltip = tooltip;
	}
	public String getHeader_image_id() {
		return header_image_id;
	}
	public void setHeader_image_id(String header_image_id) {
		this.header_image_id = header_image_id;
	}
	public String getFooter_image_id() {
		return footer_image_id;
	}
	public void setFooter_image_id(String footer_image_id) {
		this.footer_image_id = footer_image_id;
	}
	public String getReport_header() {
		return report_header;
	}
	public void setReport_header(String report_header) {
		this.report_header = report_header;
	}
	public String getReport_footer() {
		return report_footer;
	}
	public void setReport_footer(String report_footer) {
		this.report_footer = report_footer;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Long getDesignation_id() {
		return designation_id;
	}
	public void setDesignation_id(Long designation_id) {
		this.designation_id = designation_id;
	}
	public String getGrouping() {
		return grouping;
	}
	public void setGrouping(String grouping) {
		this.grouping = grouping;
	}
	public String getWhere_condition() {
		return where_condition;
	}
	public void setWhere_condition(String where_condition) {
		this.where_condition = where_condition;
	}
	public String getSub_query() {
		return sub_query;
	}
	public void setSub_query(String sub_query) {
		this.sub_query = sub_query;
	}
	public String getFinal_query() {
		return final_query;
	}
	public void setFinal_query(String final_query) {
		this.final_query = final_query;
	}
	public String getReport_name() {
		return report_name;
	}
	public void setReport_name(String report_name) {
		this.report_name = report_name;
	}
	public HashMap<String, String> getSelectedColmn() {
		return selectedColmn;
	}
	public void setSelectedColmn(HashMap<String, String> selectedColmn) {
		this.selectedColmn = selectedColmn;
	}
	
}
