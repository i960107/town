package member.model;

public class MannerTempBean {

	private String id ;
	private float manner_temp ;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public float getManner_temp() {
		return manner_temp;
	}
	public void setManner_temp(float manner_temp) {
		this.manner_temp = manner_temp;
	}
	public MannerTempBean(String id, float manner_temp) {
		super();
		this.id = id;
		this.manner_temp = manner_temp;
	}
	public MannerTempBean() {
		super();
	}
	
	
}
