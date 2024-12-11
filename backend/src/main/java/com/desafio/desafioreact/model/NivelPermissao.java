package com.desafio.desafioreact.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class NivelPermissao {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	private Long id;

	@Column(name = "permissao", nullable = false)
	private String permissao;

	private String descricao;

	
	public Long getId() {
		return id;
	}



	public String getPermissao() {
		return permissao;
	}



	public void setPermissao(String permissao) {
		this.permissao = permissao;
	}


	public void setId(Long id) {
		this.id = id;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
}