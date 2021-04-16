package member.model;

public class MemberReportBean {
	
	private int no;
	private String reportuserid;
	private String reporteduserid;
	private String contents;
	private int count;
	
	
	// 라디오 상자 받아오는 값 적어놓은거임 ! 
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

	public MemberReportBean(int no, String reportuserid, String reporteduserid, String contents, int count,
			String report) {
		super();
		this.no = no;
		this.reportuserid = reportuserid;
		this.reporteduserid = reporteduserid;
		this.contents = contents;
		this.count = count;
		this.report = report;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getReportuserid() {
		return reportuserid;
	}

	public void setReportuserid(String reportuserid) {
		this.reportuserid = reportuserid;
	}

	public String getReporteduserid() {
		return reporteduserid;
	}

	public void setReporteduserid(String reporteduserid) {
		this.reporteduserid = reporteduserid;
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
