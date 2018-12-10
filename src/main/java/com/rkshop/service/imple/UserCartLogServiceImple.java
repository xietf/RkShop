package com.rkshop.service.imple;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rkshop.dao.UserCartLogMapper;
import com.rkshop.entity.UserCartLog;
import com.rkshop.service.UserCartLogService;

@Service
public class UserCartLogServiceImple implements UserCartLogService {
	
	@Autowired
	private UserCartLogMapper userCartLogMapper;

	@Override
	public List<UserCartLog> select(UserCartLog record) {
		return userCartLogMapper.select(record);
	}

	@Override
	public int insert(UserCartLog record) {
		return userCartLogMapper.insert(record);
	}

	@Override
	public int update(UserCartLog record) {
		return userCartLogMapper.update(record);
	}

	@Override
	public int delete(Integer id) {
		return userCartLogMapper.delete(id);
	}

	@Override
	public List<UserCartLog> towTableList(UserCartLog record) {
		return userCartLogMapper.towTableList(record);
	}
	
	@Override
	public UserCartLog towTableList2(UserCartLog record) {
		return userCartLogMapper.towTableList2(record);
	}

}
