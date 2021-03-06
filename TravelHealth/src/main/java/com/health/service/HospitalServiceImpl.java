package com.health.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.health.dao.HospitalDao;
import com.health.entity.Hospital;

@Service("hospitalService")
public class HospitalServiceImpl implements HospitalService{
	
	@Autowired
	private HospitalDao hospitalDao;
	
	@Override
	@Transactional
	public List<Hospital> findHospitalByPostCode(String postcode) {
		return hospitalDao.findByPostcode(postcode);
	}

	@Override
	@Transactional
	public List<Hospital> findHospitalBySuburb(String suburb) {
		return hospitalDao.findBySuburb(suburb);
	}

	@Override
	public List<Hospital> findHospitalByPostcodeAndMedical(String postcode, String medical) {
		return hospitalDao.findByPostcodeAndMedicalType(postcode, medical);
	}

	@Override
	public List<Hospital> findHospitalBySuburbAndMedical(String suburb, String medical) {
		return hospitalDao.findBySuburbAndMedicalType(suburb, medical);
	}

	@Override
	public Hospital findHospitalById(int hid) {
		return hospitalDao.findById(hid);
	}

}
