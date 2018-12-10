package com.rkshop.service.imple;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rkshop.dao.RechargeLogMapper;
import com.rkshop.entity.RechargeLog;
import com.rkshop.service.RechargeLogService;

@Service
public class RechargeLogServiceImple implements RechargeLogService {
	
	@Autowired
	private RechargeLogMapper rechargeLogMapper;

	@Override
	public List<RechargeLog> select(RechargeLog record) {
		return rechargeLogMapper.select(record);
	}

	@Override
	public int insert(RechargeLog record) {
		return rechargeLogMapper.insert(record);
	}

	@Override
	public int update(RechargeLog record) {
		return rechargeLogMapper.update(record);
	}

	@Override
	public int delete(Integer id) {
		return rechargeLogMapper.delete(id);
	}

}
