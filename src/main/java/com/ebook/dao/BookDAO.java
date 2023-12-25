package com.ebook.dao;

import java.util.List;

import com.ebook.entity.BookVO;

public interface BookDAO {

	public boolean addBooks(BookVO books);

	public List<BookVO> getBooks();

	public BookVO getBookById(int id);

	public boolean updBooks(BookVO books);

	public boolean delBooks(int id);

	public List<BookVO> getNewBook();

	public List<BookVO> getRecentBook();

	public List<BookVO> getOldBook();

	public List<BookVO> getAllNewBook();

	public List<BookVO> getAllRecentBook();

	public List<BookVO> getAllOldBook();

	public List<BookVO> getAllBooksOldByUserId(String email, String bookCategory);

	public boolean deleteAllOldBookByUserId(String email, int bid);
}
