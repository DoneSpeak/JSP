package entity;

import java.util.Date;

public class Book {
//	书籍的相关属性
	private String isbn;
	private String name;
	private String author;
	private String intro; //书籍简介
	private float price_original;
	private float price;
	private String publish_company;
	private Date publish_time;
	private String img;
	
//	无参构造函数
	public Book(){		
	}

//	所有属性的getter和setter
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public float getPrice_original() {
		return price_original;
	}
	public void setPrice_original(float price_original) {
		this.price_original = price_original;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getPublish_company() {
		return publish_company;
	}
	public void setPublish_company(String publish_company) {
		this.publish_company = publish_company;
	}
	public Date getPublish_time() {
		return publish_time;
	}
	public void setPublish_time(Date publish_time) {
		this.publish_time = publish_time;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
//	用于购物车，区分不同的书
	@Override
	public int hashCode(){
		return this.getIsbn().hashCode() + this.getName().hashCode();
	}
	
	@Override
	public boolean equals(Object obj){
		if(this == obj){
			return true;
		}
		if(obj instanceof Book){
			Book b = (Book)obj;
			if(this.getIsbn().equals(b.getIsbn())
					&& this.getName().equals(b.getName())){
				return true;
			}else{
				return false;
			}
		}else{
			return false;
		}
	}
}
