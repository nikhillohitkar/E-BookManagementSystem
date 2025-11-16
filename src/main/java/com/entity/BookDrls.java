package com.entity;

public class BookDrls {
    private int bookid;
    private String bookname;
    private String author;
    private float price;
    private String categories;
    private String status;
    private String photo;
    private String email;

    // constructor
    public BookDrls() {}

    public BookDrls(String bookname, String author, float price, String categories, String status, String photo, String email) {
        this.bookname = bookname;
        this.author = author;
        this.price = price;
        this.categories = categories;
        this.status = status;
        this.photo = photo;
        this.email = email;
    }

    // ✅ getters & setters
    public int getBookId() {
        return bookid;
    }
    public void setBookId(int bookId) {
        this.bookid = bookId;
    }

    public String getBookName() {
        return bookname;
    }
    public void setBookName(String bookName) {
        this.bookname = bookName;
    }

    public String getAuthor() {
        return author;
    }
    public void setAuthor(String author) {
        this.author = author;
    }

    public float getPrice() {
        return price;
    }
    public void setPrice(float price) {
        this.price = price;
    }

    public String getCategories() {
        return categories;
    }
    public void setCategories(String categories) {
        this.categories = categories;
    }

    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }

    public String getPhoto() {
        return photo;
    }
    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

	
		
	}

