package co.kh.dev.memberone.model;

import java.sql.Timestamp;

public class BasketVO {
	private String id;
	private String name;
	private String email;
	private Timestamp date;
	private String title;
	private int price;
	private int count;

	public BasketVO() {
		super();
	}

	public BasketVO(String id, String name, String email, Timestamp date, String title, int price, int count) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.date = date;
		this.title = title;
		this.price = price;
		this.count = count;
	}

	public BasketVO(String id, String name, String email, String title, int price, int count) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.title = title;
		this.price = price;
		this.count = count;
	}

	
	public BasketVO(String id, String name, String email, String title, int price) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.title = title;
		this.price = price;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

}
