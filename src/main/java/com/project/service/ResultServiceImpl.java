package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.modelmapper.ModelMapper;

import com.project.dto.ResultDto;
import com.project.entity.Result;
import com.project.repository.ResultRepo;

@Service
public class ResultServiceImpl implements ResultService {

	@Autowired
	private ResultRepo repo;

	@Autowired
	private ModelMapper modelMapper;

	@Override
	public ResultDto save(ResultDto dto) {

		Result result = modelMapper.map(dto, Result.class);
		Result saved = repo.save(result);

		return modelMapper.map(saved, ResultDto.class);
	}
}