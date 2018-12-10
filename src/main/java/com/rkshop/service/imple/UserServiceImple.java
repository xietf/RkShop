package com.rkshop.service.imple;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rkshop.dao.UserMapper;
import com.rkshop.entity.User;
import com.rkshop.service.UserService;

@Service
public class UserServiceImple implements UserService {
	
	@Autowired
	private UserMapper userMapper;

	@Override
	public List<User> select(User record) {
		return userMapper.select(record);
	}

	@Override
	public int insert(User record) {
		return userMapper.insert(record);
	}

	@Override
	public int update(User record) {
		return userMapper.update(record);
	}

	@Override
	public int delete(Integer id) {
		return userMapper.delete(id);
	}

}
