package com.desafio.desafioreact.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.desafio.desafioreact.model.NivelPermissao;
import com.desafio.desafioreact.repository.NivelPermissaoRepository;

@Service
public class NivelPermissaoService {
	@Autowired
    private NivelPermissaoRepository nivelPermissaoRepository;

    public List<NivelPermissao> findAll() {
        return nivelPermissaoRepository.findAll();
    }
}
