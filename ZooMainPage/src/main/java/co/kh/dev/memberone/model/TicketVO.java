package co.kh.dev.memberone.model;

import java.sql.Timestamp;

public class TicketVO {
	private int no;
	private Timestamp date;
	private String title;
	private int price;
	private int id;

	public TicketVO(int no, Timestamp date, String title, int price, int id) {
		super();
		this.no = no;
		this.date = date;
		this.title = title;
		this.price = price;
		this.id = id;
	}

	public TicketVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "TicketVO [no=" + no + ", date=" + date + ", title=" + title + ", price=" + price + ", id=" + id + "]";
	}

}
