package com.rkshop.service.imple;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rkshop.dao.UserAddressMapper;
import com.rkshop.entity.UserAddress;
import com.rkshop.service.UserAddressService;

@Service
public class UserAddressServiceImple implements UserAddressService {
	
	@Autowired
	private UserAddressMapper userAddressMapper;

	@Override
	public List<UserAddress> select(UserAddress record) {
		return userAddressMapper.select(record);
	}

	@Override
	public int insert(UserAddress record) {
		return userAddressMapper.insert(record);
	}

	@Override
	public int update(UserAddress record) {
		return userAddressMapper.update(record);
	}

	@Override
	public int delete(Integer id) {
		return userAddressMapper.delete(id);
	}

}
