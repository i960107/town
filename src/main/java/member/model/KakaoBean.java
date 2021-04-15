package member.model;

import java.util.HashMap;
import java.util.Map;

public class KakaoBean {

	private Integer id;
	private String connected_at;
	private Properties properties;
	private kakao_account kakao_account;
	private Map<String, Object> additional_properties = new HashMap<String, Object>();

	public class kakao_account {

		private Boolean profile_needs_agreement;
		private Profile profile;
		private Boolean has_email;
		private Boolean email_needs_agreement;
		private Boolean is_email_valid;
		private Boolean is_email_verified;
		private String email;
		private Boolean has_gender;
		private Boolean gender_needs_agreement;
		private Map<String, Object> additional_properties = new HashMap<String, Object>();

		/**
		 * No args constructor for use in serialization
		 *
		 */
		public kakao_account() {
		}

		/**
		 *
		 * @param has_email
		 * @param gender_needs_agreement
		 * @param profile
		 * @param is_email_valid
		 * @param profile_needs_agreement
		 * @param email_needs_agreement
		 * @param has_gender
		 * @param is_email_verified
		 * @param email
		 */
		public kakao_account(Boolean profile_needs_agreement, Profile profile, Boolean has_email, Boolean email_needs_agreement,
				Boolean is_email_valid, Boolean is_email_verified, String email, Boolean has_gender,
				Boolean gender_needs_agreement) {
			super();
			this.profile_needs_agreement = profile_needs_agreement;
			this.profile = profile;
			this.has_email = has_email;
			this.email_needs_agreement = email_needs_agreement;
			this.is_email_valid = is_email_valid;
			this.is_email_verified = is_email_verified;
			this.email = email;
			this.has_gender = has_gender;
			this.gender_needs_agreement = gender_needs_agreement;
		}
		
		class Profile {

			private String nickname;
			private String thumbnail_image_url;
			private String profile_image_url;
			private Map<String, Object> additional_properties = new HashMap<String, Object>();

			/**
			 * No args constructor for use in serialization
			 *
			 */
			public Profile() {
			}

			/**
			 *
			 * @param thumbnail_image_url
			 * @param nickname
			 * @param profile_image_url
			 */
			public Profile(String nickname, String thumbnail_image_url, String profile_image_url) {
				super();
				this.nickname = nickname;
				this.thumbnail_image_url = thumbnail_image_url;
				this.profile_image_url = profile_image_url;
			}

			public String getNickname() {
				return nickname;
			}

			public void setNickname(String nickname) {
				this.nickname = nickname;
			}

			public String getthumbnail_image_url() {
				return thumbnail_image_url;
			}

			public void setthumbnail_image_url(String thumbnail_image_url) {
				this.thumbnail_image_url = thumbnail_image_url;
			}

			public String getprofile_image_url() {
				return profile_image_url;
			}

			public void setprofile_image_url(String profile_image_url) {
				this.profile_image_url = profile_image_url;
			}

			public Map<String, Object> getadditional_properties() {
				return this.additional_properties;
			}

			public void setAdditionalProperty(String name, Object value) {
				this.additional_properties.put(name, value);
			}

		}

		public Boolean getprofile_needs_agreement() {
			return profile_needs_agreement;
		}

		public void setprofile_needs_agreement(Boolean profile_needs_agreement) {
			this.profile_needs_agreement = profile_needs_agreement;
		}

		public Profile getProfile() {
			return profile;
		}

		public void setProfile(Profile profile) {
			this.profile = profile;
		}

		public Boolean gethas_email() {
			return has_email;
		}

		public void sethas_email(Boolean has_email) {
			this.has_email = has_email;
		}

		public Boolean getemail_needs_agreement() {
			return email_needs_agreement;
		}

		public void setemail_needs_agreement(Boolean email_needs_agreement) {
			this.email_needs_agreement = email_needs_agreement;
		}

		public Boolean getis_email_valid() {
			return is_email_valid;
		}

		public void setis_email_valid(Boolean is_email_valid) {
			this.is_email_valid = is_email_valid;
		}

		public Boolean getis_email_verified() {
			return is_email_verified;
		}

		public void setis_email_verified(Boolean is_email_verified) {
			this.is_email_verified = is_email_verified;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public Boolean gethas_gender() {
			return has_gender;
		}

		public void sethas_gender(Boolean has_gender) {
			this.has_gender = has_gender;
		}

		public Boolean getgender_needs_agreement() {
			return gender_needs_agreement;
		}

		public void setgender_needs_agreement(Boolean gender_needs_agreement) {
			this.gender_needs_agreement = gender_needs_agreement;
		}

		public Map<String, Object> getadditional_properties() {
			return this.additional_properties;
		}

		public void setAdditionalProperty(String name, Object value) {
			this.additional_properties.put(name, value);
		}

	}
	

	class Properties {

		private String nickname;
		private String profile_image;
		private String thumbnail_image;
		private Map<String, Object> additional_properties = new HashMap<String, Object>();

		/**
		 * No args constructor for use in serialization
		 *
		 */
		public Properties() {
		}

		/**
		 *
		 * @param nickname
		 * @param profile_image
		 * @param thumbnail_image
		 */
		public Properties(String nickname, String profile_image, String thumbnail_image) {
			super();
			this.nickname = nickname;
			this.profile_image = profile_image;
			this.thumbnail_image = thumbnail_image;
		}

		public String getNickname() {
			return nickname;
		}

		public void setNickname(String nickname) {
			this.nickname = nickname;
		}

		public String getprofile_image() {
			return profile_image;
		}

		public void setprofile_image(String profile_image) {
			this.profile_image = profile_image;
		}

		public String getthumbnail_image() {
			return thumbnail_image;
		}

		public void setthumbnail_image(String thumbnail_image) {
			this.thumbnail_image = thumbnail_image;
		}

		public Map<String, Object> getadditional_properties() {
			return this.additional_properties;
		}

		public void setAdditionalProperty(String name, Object value) {
			this.additional_properties.put(name, value);
		}

	}
	/**
	 * No args constructor for use in serialization
	 *
	 */
	public KakaoBean() {
	}

	/**
	 *
	 * @param connected_at
	 * @param id
	 * @param kakao_account
	 * @param properties
	 */
	public KakaoBean(Integer id, String connected_at, Properties properties, kakao_account kakao_account) {
		super();
		this.id = id;
		this.connected_at = connected_at;
		this.properties = properties;
		this.kakao_account = kakao_account;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getconnected_at() {
		return connected_at;
	}

	public void setconnected_at(String connected_at) {
		this.connected_at = connected_at;
	}

	public Properties getProperties() {
		return properties;
	}

	public void setProperties(Properties properties) {
		this.properties = properties;
	}

	public kakao_account getkakao_account() {
		return kakao_account;
	}

	public void setkakao_account(kakao_account kakao_account) {
		this.kakao_account = kakao_account;
	}

	public Map<String, Object> getadditional_properties() {
		return this.additional_properties;
	}

	public void setAdditionalProperty(String name, Object value) {
		this.additional_properties.put(name, value);
	}

}




