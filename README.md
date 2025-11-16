#  E-Book Management System

The **E-Book Management System** is a web-based application developed using  
**Java Servlets, JSP, MySQL, HTML, CSS**.  
This system allows users to register, login, browse e-books, view details, and place orders.

---

##  Features

### User Features
- User Registration & Login  
- Secure login with email and password  
- View all available books  
- Search books  
- View complete book details  
- Order e-books  
- View placed orders in “My Orders” section  
- Update user profile  

###  Admin Features
- Add new books  
- Edit book details  
- Delete books  
- Manage all orders  
 

---

##  Tech Stack

| Component | Technology |
|----------|------------|
| Backend  | Java Servlets, JSP |
| Database | MySQL |
| Frontend | HTML, CSS, JSTL |
| Server   | Apache Tomcat |
| IDE      | VS Code / Eclipse |

---

## 📁 Project Structure
E-BookManagementSystem/
│
├── src/main/java/
│   ├── com.DAO/
│   ├── com.DB/
│   ├── com.entity/
│   ├── com.admin.servlet/
│   └── com.user.servlet/
│
├── src/main/webapp/
│   ├── Admin_all_css_file/
│   ├── User_all_component/
│   ├── WEB-INF/
│   ├── *.jsp files (All Pages)
│   └── images/
│
├── pom.xml
├── .gitignore
└── README.md


---

##  Database Schema (MySQL)

### **Table: user**
| Field | Type |
|-------|------|
| id | INT (PK) |
| name | VARCHAR |
| email | VARCHAR |
| password | VARCHAR |
| phone | VARCHAR |

### **Table: books**
| Field | Type |
|-------|------|
| id | INT (PK) |
| bookName | VARCHAR |
| author | VARCHAR |
| price | DOUBLE |
| category | VARCHAR |
| status | VARCHAR |
| photo | VARCHAR |

### **Table: book_order**
| Field | Type |
|-------|------|
| orderId | INT (PK) |
| userId | INT |
| username | VARCHAR |
| bookName | VARCHAR |
| price | DOUBLE |
| paymentType | VARCHAR |

---

##  How to Run the Project

1.Install **Java 8+**, **MySQL**, **Apache Tomcat**  
2️.Create a database:
```sql
CREATE DATABASE ebook;

3️. Import tables
4️. Change MySQL username/password in DBConnect.java
5️. Deploy project on Tomcat
6️. Open in browser:

http://localhost:8080/E-BookManagementSystem/

 Future Improvements

Online payment integration

User OTP verification

Admin dashboard charts

Dark mode UI

REST APIs

 Developer

Nikhil Rohitkar
Java Developer | Web Application Builder

 License

This project is for educational purposes.
---

Agar chaho to main **README ko automatically GitHub style me beautify** bhi kar sakta hoon.  
Ya tumhari **project details ke hisaab se aur customize** bhi kar dunga.

Batao, kya isme kuch add/remove karna hai?


CREATE DATABASE ebook;


3️. Import tables
4️. Change MySQL username/password in DBConnect.java
5️. Deploy project on Tomcat
6️. Open in browser:

http://localhost:8080/E-BookManagementSystem/

 Future Improvements

Online payment integration

User OTP verification

Admin dashboard charts

Dark mode UI

REST APIs

 Developer

Nikhil Rohitkar
Java Developer | Web Application Builder

License

This project is for educational purposes.
---

