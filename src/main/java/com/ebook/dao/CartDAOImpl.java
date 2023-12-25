package com.ebook.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ebook.entity.CartVO;

public class CartDAOImpl implements CartDAO {
	private Connection connection;

	/**
	 * @param connection
	 */
	public CartDAOImpl(Connection connection) {
		super();
		this.connection = connection;
	}

	@Override
	public boolean addCart(CartVO cart) {
		boolean addCartFlag = false;
		String ADD_QRY = "INSERT INTO ebook_application.cart(bid,uid,bookName,authorName,price,totalprice) VALUES(?,?,?,?,?,?)";
		try {
			PreparedStatement pst = connection.prepareStatement(ADD_QRY);
			pst.setInt(1, cart.getBid());
			pst.setInt(2, cart.getUid());
			pst.setString(3, cart.getBookName());
			pst.setString(4, cart.getAuthorName());
			pst.setDouble(5, cart.getPrice());
			pst.setDouble(6, cart.getTotalprice());
			int rows = pst.executeUpdate();
			if (rows == 1) {
				addCartFlag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return addCartFlag;
	}

	@Override
	public List<CartVO> getCartDetailsByUser(int userId) {
		List<CartVO> list = new ArrayList<CartVO>();
		CartVO cart = null;
		double totalPrice = 0;
		String GET_CRT = "SELECT * FROM ebook_application.cart WHERE uid=?";
		try {
			PreparedStatement pst = connection.prepareStatement(GET_CRT);
			pst.setInt(1, userId);

			ResultSet rst = pst.executeQuery();

			while (rst.next()) {
				cart = new CartVO();
				cart.setCid(rst.getInt(1));
				cart.setBid(rst.getInt(2));
				cart.setUid(rst.getInt(3));
				cart.setBookName(rst.getString(4));
				cart.setAuthorName(rst.getString(5));
				cart.setPrice(rst.getDouble(6));
				totalPrice = totalPrice + rst.getDouble(7);
				cart.setTotalprice(totalPrice);
				list.add(cart);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean remBookCartByBookId(int bid, int uid, int cid) {
		boolean remFlag = false;
		String REM_QRY = "DELETE FROM ebook_application.cart WHERE bid=? AND uid=? AND cid=?";
		try {
			PreparedStatement pst = connection.prepareStatement(REM_QRY);
			pst.setInt(1, bid);
			pst.setInt(2, uid);
			pst.setInt(3, cid);

			int rows = pst.executeUpdate();
			if (rows == 1) {
				remFlag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return remFlag;
	}

}
