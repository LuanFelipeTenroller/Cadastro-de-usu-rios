package com.desafio.desafioreact.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.desafio.desafioreact.model.NivelPermissao;

public interface NivelPermissaoRepository extends JpaRepository<NivelPermissao, Long> {

	NivelPermissao findByPermissao(String permissao);
}
