package entity;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

public class Cart {
//	车里会有很多的商品，所以我们可以用一个Map存放起来
//	商品集合
	private HashMap<Book, Integer> books;
	
//	总费用
	private double totalCost;
	
	public Cart(){}

	public HashMap<Book, Integer> getBooks() {
		return books;
	}

	public void setBooks(HashMap<Book, Integer> books) {
		this.books = books;
	}
	
	public double getTotalCost() {
		return totalCost;
	}

	public void setTotalCost(double totalCost) {
		this.totalCost = totalCost;
	}
	
	public double getOneTypeBookCostInCart(Book book){
		return book.getPrice()* books.get(book);
	}
}
