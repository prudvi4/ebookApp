package com.ebook.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ebook.entity.BookVO;

public class BookDAOImpl implements BookDAO {

	private Connection connection;

	/**
	 * @param connection
	 */
	public BookDAOImpl(Connection connection) {
		super();
		this.connection = connection;
	}

	@Override
	public boolean addBooks(BookVO books) {
		boolean addBookFlag = false;
		String BOOK_QRY = "INSERT INTO ebook_application.books(bookname,author,price,bookCategory,status,photo,user_email) VALUES(?,?,?,?,?,?,?)";
		try {
			PreparedStatement pst = connection.prepareStatement(BOOK_QRY);
			pst.setString(1, books.getBookname());
			pst.setString(2, books.getAuthor());
			pst.setString(3, books.getPrice());
			pst.setString(4, books.getBookCategory());
			pst.setString(5, books.getStatus());
			pst.setString(6, books.getPhoto());
			pst.setString(7, books.getUserEmail());
			int rowsAff = pst.executeUpdate();
			if (rowsAff == 1) {
				addBookFlag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return addBookFlag;
	}

	@Override
	public List<BookVO> getBooks() {
		List<BookVO> list = new ArrayList<BookVO>();
		BookVO books = null;
		String GET_QRY = "SELECT * FROM ebook_application.books";
		try {
			PreparedStatement pst = connection.prepareStatement(GET_QRY);
			ResultSet rst = pst.executeQuery();
			while (rst.next()) {
				books = new BookVO();
				books.setBookId(rst.getInt(1));
				books.setBookname(rst.getString(2));
				books.setAuthor(rst.getString(3));
				books.setPrice(rst.getString(4));
				books.setBookCategory(rst.getString(5));
				books.setStatus(rst.getString(6));
				books.setPhoto(rst.getString(7));
				books.setUserEmail(rst.getString(8));
				list.add(books);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public BookVO getBookById(int id) {
		BookVO books = null;
		String GET_QRY = "SELECT * FROM ebook_application.books WHERE bookId=?";
		try {
			PreparedStatement pst = connection.prepareStatement(GET_QRY);
			pst.setInt(1, id);
			ResultSet rst = pst.executeQuery();
			if (rst.next()) {
				books = new BookVO();
				books.setBookId(rst.getInt(1));
				books.setBookname(rst.getString(2));
				books.setAuthor(rst.getString(3));
				books.setPrice(rst.getString(4));
				books.setBookCategory(rst.getString(5));
				books.setStatus(rst.getString(6));
				books.setPhoto(rst.getString(7));
				books.setUserEmail(rst.getString(8));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return books;
	}

	@Override
	public boolean updBooks(BookVO books) {
		boolean editFlag = false;
		String EDI_QRY = "UPDATE ebook_application.books SET bookname=?,author=?,price=?,status=? WHERE bookId=?";

		try {
			PreparedStatement pst = connection.prepareStatement(EDI_QRY);
			pst.setString(1, books.getBookname());
			pst.setString(2, books.getAuthor());
			pst.setString(3, books.getPrice());
			pst.setString(4, books.getStatus());
			pst.setInt(5, books.getBookId());
			int rowsAff = pst.executeUpdate();
			if (rowsAff == 1) {
				editFlag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return editFlag;
	}

	@Override
	public boolean delBooks(int id) {
		boolean delFlag = false;
		String DEL_QRY = "DELETE FROM ebook_application.books WHERE bookId=?";
		try {
			PreparedStatement pst = connection.prepareStatement(DEL_QRY);
			pst.setInt(1, id);
			int rowsAff = pst.executeUpdate();
			if (rowsAff == 1) {
				delFlag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return delFlag;
	}

	@Override
	public List<BookVO> getNewBook() {
		List<BookVO> listNewBook = new ArrayList<BookVO>();
		BookVO books = null;
		String NEW_QRY = "SELECT * FROM ebook_application.books WHERE bookCategory=? AND status=? ORDER BY rand() LIMIT 4";
		try {
			PreparedStatement pst = connection.prepareStatement(NEW_QRY);
			pst.setString(1, "New Book");
			pst.setString(2, "Active");

			ResultSet rst = pst.executeQuery();
			while (rst.next()) {
				books = new BookVO();
				books.setBookId(rst.getInt(1));
				books.setBookname(rst.getString(2));
				books.setAuthor(rst.getString(3));
				books.setPrice(rst.getString(4));
				books.setBookCategory(rst.getString(5));
				books.setStatus(rst.getString(6));
				books.setPhoto(rst.getString(7));
				books.setUserEmail(rst.getString(8));
				listNewBook.add(books);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listNewBook;
	}

	@Override
	public List<BookVO> getRecentBook() {
		List<BookVO> listNewBook = new ArrayList<BookVO>();
		BookVO books = null;
		String NEW_QRY = "SELECT * FROM ebook_application.books WHERE status=? ORDER BY rand() LIMIT 4";
		try {
			PreparedStatement pst = connection.prepareStatement(NEW_QRY);
			pst.setString(1, "Active");

			ResultSet rst = pst.executeQuery();

			while (rst.next()) {
				books = new BookVO();
				books.setBookId(rst.getInt(1));
				books.setBookname(rst.getString(2));
				books.setAuthor(rst.getString(3));
				books.setPrice(rst.getString(4));
				books.setBookCategory(rst.getString(5));
				books.setStatus(rst.getString(6));
				books.setPhoto(rst.getString(7));
				books.setUserEmail(rst.getString(8));
				listNewBook.add(books);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listNewBook;
	}

	@Override
	public List<BookVO> getOldBook() {
		List<BookVO> listOldBook = new ArrayList<BookVO>();
		BookVO books = null;
		String NEW_QRY = "SELECT * FROM ebook_application.books WHERE bookCategory=? AND status=? ORDER BY rand() LIMIT 4";
		try {
			PreparedStatement pst = connection.prepareStatement(NEW_QRY);
			pst.setString(1, "Old Book");
			pst.setString(2, "Active");

			ResultSet rst = pst.executeQuery();
			while (rst.next()) {
				books = new BookVO();
				books.setBookId(rst.getInt(1));
				books.setBookname(rst.getString(2));
				books.setAuthor(rst.getString(3));
				books.setPrice(rst.getString(4));
				books.setBookCategory(rst.getString(5));
				books.setStatus(rst.getString(6));
				books.setPhoto(rst.getString(7));
				books.setUserEmail(rst.getString(8));
				listOldBook.add(books);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listOldBook;

	}

	@Override
	public List<BookVO> getAllNewBook() {
		List<BookVO> listNewBook = new ArrayList<BookVO>();
		BookVO books = null;
		String NEW_QRY = "SELECT * FROM ebook_application.books WHERE bookCategory=? AND status=?";
		try {
			PreparedStatement pst = connection.prepareStatement(NEW_QRY);
			pst.setString(1, "New Book");
			pst.setString(2, "Active");

			ResultSet rst = pst.executeQuery();
			while (rst.next()) {
				books = new BookVO();
				books.setBookId(rst.getInt(1));
				books.setBookname(rst.getString(2));
				books.setAuthor(rst.getString(3));
				books.setPrice(rst.getString(4));
				books.setBookCategory(rst.getString(5));
				books.setStatus(rst.getString(6));
				books.setPhoto(rst.getString(7));
				books.setUserEmail(rst.getString(8));
				listNewBook.add(books);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listNewBook;
	}

	@Override
	public List<BookVO> getAllRecentBook() {
		List<BookVO> listNewBook = new ArrayList<BookVO>();
		BookVO books = null;
		String NEW_QRY = "SELECT * FROM ebook_application.books WHERE status=? ";
		try {
			PreparedStatement pst = connection.prepareStatement(NEW_QRY);
			pst.setString(1, "Active");

			ResultSet rst = pst.executeQuery();

			while (rst.next()) {
				books = new BookVO();
				books.setBookId(rst.getInt(1));
				books.setBookname(rst.getString(2));
				books.setAuthor(rst.getString(3));
				books.setPrice(rst.getString(4));
				books.setBookCategory(rst.getString(5));
				books.setStatus(rst.getString(6));
				books.setPhoto(rst.getString(7));
				books.setUserEmail(rst.getString(8));
				listNewBook.add(books);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listNewBook;
	}

	@Override
	public List<BookVO> getAllOldBook() {
		List<BookVO> listOldBook = new ArrayList<BookVO>();
		BookVO books = null;
		String NEW_QRY = "SELECT * FROM ebook_application.books WHERE bookCategory=? AND status=?";
		try {
			PreparedStatement pst = connection.prepareStatement(NEW_QRY);
			pst.setString(1, "Old Book");
			pst.setString(2, "Active");

			ResultSet rst = pst.executeQuery();
			while (rst.next()) {
				books = new BookVO();
				books.setBookId(rst.getInt(1));
				books.setBookname(rst.getString(2));
				books.setAuthor(rst.getString(3));
				books.setPrice(rst.getString(4));
				books.setBookCategory(rst.getString(5));
				books.setStatus(rst.getString(6));
				books.setPhoto(rst.getString(7));
				books.setUserEmail(rst.getString(8));
				listOldBook.add(books);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listOldBook;
	}

	@Override
	public List<BookVO> getAllBooksOldByUserId(String email, String bookCategory) {
		List<BookVO> listOldBook = new ArrayList<BookVO>();
		BookVO books = null;
		String NEW_QRY = "SELECT * FROM ebook_application.books WHERE user_email=? AND bookCategory=?";
		try {
			PreparedStatement pst = connection.prepareStatement(NEW_QRY);
			pst.setString(1, email);
			pst.setString(2, bookCategory);

			ResultSet rst = pst.executeQuery();
			while (rst.next()) {
				books = new BookVO();
				books.setBookId(rst.getInt(1));
				books.setBookname(rst.getString(2));
				books.setAuthor(rst.getString(3));
				books.setPrice(rst.getString(4));
				books.setBookCategory(rst.getString(5));
				books.setStatus(rst.getString(6));
				books.setPhoto(rst.getString(7));
				books.setUserEmail(rst.getString(8));
				listOldBook.add(books);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listOldBook;

	}

	@Override
	public boolean deleteAllOldBookByUserId(String email, int bid) {
		boolean delFlag = false;
		String DEL_QRY = "DELETE FROM ebook_application.books WHERE user_email=? AND bookId=?";
		try {
			PreparedStatement pst = connection.prepareStatement(DEL_QRY);
			pst.setString(1, email);
			pst.setInt(2, bid);
			int rowsAff = pst.executeUpdate();
			if (rowsAff == 1) {
				delFlag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return delFlag;
	}

}
