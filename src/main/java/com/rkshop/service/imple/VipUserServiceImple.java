package com.rkshop.service.imple;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rkshop.dao.VipUserMapper;
import com.rkshop.entity.VipUser;
import com.rkshop.service.VipUserService;

@Service
public class VipUserServiceImple implements VipUserService {
	
	@Autowired
	private VipUserMapper vipUserMapper;

	@Override
	public List<VipUser> select(VipUser record) {
		return vipUserMapper.select(record);
	}

	@Override
	public int insert(VipUser record) {
		return vipUserMapper.insert(record);
	}

	@Override
	public int update(VipUser record) {
		return vipUserMapper.update(record);
	}

	@Override
	public int delete(Integer id) {
		return vipUserMapper.delete(id);
	}

}
