package com.ebook.dao;

import com.ebook.entity.UserVO;

public interface UserDAO {

	public boolean addUser(UserVO userValues);

	public UserVO getUser(String username, String password);

	public UserVO getUserName(String email);

	public UserVO getUserPassword(String userName);

	public boolean checkPassword(int id, String password);

	public boolean updateProfileDetails(UserVO user);

}
