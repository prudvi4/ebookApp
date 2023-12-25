package com.ebook.dao;

import java.util.List;

import com.ebook.entity.CartVO;

public interface CartDAO {
	public boolean addCart(CartVO cart);

	public List<CartVO> getCartDetailsByUser(int userId);

	public boolean remBookCartByBookId(int bid, int uid, int cid);
}
