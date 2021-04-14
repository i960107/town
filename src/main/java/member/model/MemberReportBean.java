package member.model;

public class MemberReportBean {
	private int no;
	private String report_userid;
	private String reported_userid;
	private String contents;
	private int count;
	
	// radio로 넘어오는값 받을라고 
	private String report;
	
	public String getReport() {
		return report;
	}

	public void setReport(String report) {
		this.report = report;
	}

	public MemberReportBean() {
		super();
	}

	public MemberReportBean(int no, String report_userid, String reported_userid, String contents, int count) {
		super();
		this.no = no;
		this.report_userid = report_userid;
		this.reported_userid = reported_userid;
		this.contents = contents;
		this.count = count;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getReport_userid() {
		return report_userid;
	}

	public void setReport_userid(String report_userid) {
		this.report_userid = report_userid;
	}

	public String getReported_userid() {
		return reported_userid;
	}

	public void setReported_userid(String reported_userid) {
		this.reported_userid = reported_userid;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	
	

}
