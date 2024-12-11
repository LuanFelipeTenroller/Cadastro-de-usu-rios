package com.desafio.desafioreact.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.desafio.desafioreact.model.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, Long> {
    List<Usuario> findByNomeContaining(String nome);
    int countByAtivoTrue();
	
}

