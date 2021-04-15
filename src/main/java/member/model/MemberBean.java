package member.model;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.web.multipart.MultipartFile;

public class MemberBean {

	@NotBlank(message = "아이디는 필수사항입니다.")
	private String id;
	
	@NotBlank(message = "비밀번호는 필수 입력사항입니다")
	private String pw;
	
	@NotBlank(message = "이름은 필수 입력사항입니다.")
	private String name;
	
	@NotNull(message = "성별을 선택해주세요")
	private String gender;
	
	@Pattern(regexp = "^[0-9]+$", message = "번호은 숫자로만 입력하세요.")
	@Size(min = 10, max = 11, message = "전화번호를 다시 확인해주세요.") // 번호 10~11개 까지만 입력
	@NotBlank(message = "전화번호는 필수 입력사항입니다.")
	private String phonenumber;
	
	@NotBlank(message = "이메일은 필수 입력사항입니다.")
	private String email;
	
	@NotBlank(message = "주소는 필수 입력사항입니다.")
	private String address;
	private String address1;
	private String address2;
	private String address3;
	private String image; // 프로필사진
	private String memberstatus; // 계정중지
	private int authority; // 관리자 권한
	
	// 패스워드 유효성 체크용
	@NotBlank(message = "비밀번호 확인은 필수 입력사항입니다")
	private String pwCheck;
	
	// 신고 갯수
	private int reportcount;
	
	public int getReportcount() {
		return reportcount;
	}

	public void setReportcount(int reportcount) {
		this.reportcount = reportcount;
	}

	// 신고하기 cnt 받아오는 값
	private int count;
	
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
	// 신고하기 계정 상태
	private int reportstatus;
	
	public int getReportstatus() {
		return reportstatus;
	}

	public void setReportstatus(int reportstatus) {
		this.reportstatus = reportstatus;
	}

	//이미지 파일명 받아오려고 필요함
	private MultipartFile upload;
	

	public MultipartFile getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
		this.image = upload.getOriginalFilename();
	}

	public String getPwCheck() {
		return pwCheck;
	}

	public void setPwCheck(String pwCheck) {
		this.pwCheck = pwCheck;
	}

	public MemberBean() {
		super();
	}

	public MemberBean(String id, String pw, String name, String gender, String phonenumber, String email,
			String address, String address1, String address2, String address3, String image, String memberstatus,
			int authority, String pwCheck, int reportcount, int count, MultipartFile upload) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.gender = gender;
		this.phonenumber = phonenumber;
		this.email = email;
		this.address = address;
		this.address1 = address1;
		this.address2 = address2;
		this.address3 = address3;
		this.image = image;
		this.memberstatus = memberstatus;
		this.authority = authority;
		this.pwCheck = pwCheck;
		this.reportcount = reportcount;
		this.count = count;
		this.upload = upload;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getAddress3() {
		return address3;
	}

	public void setAddress3(String address3) {
		this.address3 = address3;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getMemberstatus() {
		return memberstatus;
	}

	public void setMemberstatus(String memberstatus) {
		this.memberstatus = memberstatus;
	}

	public int getAuthority() {
		return authority;
	}

	public void setAuthority(int authority) {
		this.authority = authority;
	}


}
