package com.ebook.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.ebook.entity.UserVO;

public class UserDAOImpl implements UserDAO {

	private Connection connection;

	/**
	 * @param connection
	 */
	public UserDAOImpl(Connection connection) {
		super();
		this.connection = connection;
	}

	@Override
	public boolean addUser(UserVO userValues) {
		boolean addRegFlag = false;
		String ADD_QRY = "INSERT INTO ebook_application.user(fullname,username,email,number,password) VALUES(?,?,?,?,?)";
		try {
			PreparedStatement pst = connection.prepareStatement(ADD_QRY);
			pst.setString(1, userValues.getFullName());
			pst.setString(2, userValues.getUserName());
			pst.setString(3, userValues.getEmail());
			pst.setString(4, userValues.getNumber());
			pst.setString(5, userValues.getPassword());

			int rowsAfff = pst.executeUpdate();
			if (rowsAfff == 1) {
				addRegFlag = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return addRegFlag;
	}

	@Override
	public UserVO getUser(String username, String password) {
		UserVO userValues = null;
		String GET_QRY = "SELECT * FROM ebook_application.user  WHERE username=? AND password=?";
		try {
			PreparedStatement pst = connection.prepareStatement(GET_QRY);
			pst.setString(1, username);
			pst.setString(2, password);
			ResultSet rst = pst.executeQuery();
			while (rst.next()) {
				userValues = new UserVO();
				userValues.setId(rst.getInt(1));
				userValues.setFullName(rst.getString(2));
				userValues.setUserName(rst.getString(3));
				userValues.setEmail(rst.getString(4));
				userValues.setNumber(rst.getString(5));
				userValues.setPassword(rst.getString(6));
				userValues.setAddress(rst.getString(7));
				userValues.setLandmark(rst.getString(8));
				userValues.setCity(rst.getString(9));
				userValues.setState(rst.getString(10));
				userValues.setPincode(rst.getString(11));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userValues;
	}

	@Override
	public UserVO getUserName(String email) {
		UserVO userValues = null;
		String GET_QRY = "SELECT * FROM ebook_application.user  WHERE email=?";
		try {
			PreparedStatement pst = connection.prepareStatement(GET_QRY);
			pst.setString(1, email);
			ResultSet rst = pst.executeQuery();
			while (rst.next()) {
				userValues = new UserVO();
				userValues.setId(rst.getInt(1));
				userValues.setFullName(rst.getString(2));
				userValues.setUserName(rst.getString(3));
				userValues.setEmail(rst.getString(4));
				userValues.setNumber(rst.getString(5));
				userValues.setPassword(rst.getString(6));
				userValues.setAddress(rst.getString(7));
				userValues.setLandmark(rst.getString(8));
				userValues.setCity(rst.getString(9));
				userValues.setState(rst.getString(10));
				userValues.setPincode(rst.getString(11));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userValues;

	}

	@Override
	public UserVO getUserPassword(String userName) {
		UserVO userValues = null;
		String GET_QRY = "SELECT * FROM ebook_application.user  WHERE username=?";
		try {
			PreparedStatement pst = connection.prepareStatement(GET_QRY);
			pst.setString(1, userName);
			ResultSet rst = pst.executeQuery();
			while (rst.next()) {
				userValues = new UserVO();
				userValues.setId(rst.getInt(1));
				userValues.setFullName(rst.getString(2));
				userValues.setUserName(rst.getString(3));
				userValues.setEmail(rst.getString(4));
				userValues.setNumber(rst.getString(5));
				userValues.setPassword(rst.getString(6));
				userValues.setAddress(rst.getString(7));
				userValues.setLandmark(rst.getString(8));
				userValues.setCity(rst.getString(9));
				userValues.setState(rst.getString(10));
				userValues.setPincode(rst.getString(11));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userValues;

	}

	@Override
	public boolean checkPassword(int id, String password) {
		boolean checkFlag = false;
		String QRY = "SELECT * FROM ebook_application.user  WHERE id=? AND password=?";
		try {
			PreparedStatement pst = connection.prepareStatement(QRY);
			pst.setInt(1, id);
			pst.setString(2, password);
			ResultSet rst = pst.executeQuery();
			while (rst.next()) {
				checkFlag = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return checkFlag;
	}

	@Override
	public boolean updateProfileDetails(UserVO userValues) {
		boolean updFlag = false;
		String ADD_QRY = "UPDATE ebook_application.user SET fullname=?,username=?,email=?,number=? WHERE id=?";
		try {
			PreparedStatement pst = connection.prepareStatement(ADD_QRY);
			pst.setString(1, userValues.getFullName());
			pst.setString(2, userValues.getUserName());
			pst.setString(3, userValues.getEmail());
			pst.setString(4, userValues.getNumber());
			pst.setInt(5, userValues.getId());

			int rowsAfff = pst.executeUpdate();
			if (rowsAfff == 1) {
				updFlag = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return updFlag;
	}

}
