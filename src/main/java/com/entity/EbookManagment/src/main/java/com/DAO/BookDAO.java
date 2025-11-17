package com.DAO;
import com.entity.BookDrls;
import java.util.List;

public interface BookDAO {
    public boolean addBooks(BookDrls b);
    public List<BookDrls> getAllBooks();
    public BookDrls getBookById(int id);
    public boolean updateBook(BookDrls b);
    public boolean deleteBook(int id);
    public List<BookDrls>getNewBook();
    public List<BookDrls>getRecentBook();

    public List<BookDrls>getAllNewBook();
    public List<BookDrls>getAllRecentBook();
    public List<BookDrls>getAllOldBook();
    public List<BookDrls>getBookByOld(String email,String cate);
    public boolean oldBookDelete(String email,String cat,int id);
    public List<BookDrls> getBookBySerch(String ch);
}
