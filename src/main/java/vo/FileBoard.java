package vo;

import java.util.Date;

public class FileBoard {
	
	private int no;
	private String title;
	private String description;
	private String fileName;
	private long fileSize;
	private User user;
	private String deleted;
	private Date updatedDate;
	private Date createdDate;
	
	public FileBoard() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getFileName() {
		return fileName;
	}
	
	public String getRealFileName() {
		return fileName.substring(13);
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getDeleted() {
		return deleted;
	}

	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	@Override
	public String toString() {
		return "FileBoard [no=" + no + ", title=" + title + ", description=" + description + ", fileName=" + fileName
				+ ", fileSize=" + fileSize + ", user=" + user + ", deleted=" + deleted + ", updatedDate=" + updatedDate
				+ ", createdDate=" + createdDate + "]";
	}

}
