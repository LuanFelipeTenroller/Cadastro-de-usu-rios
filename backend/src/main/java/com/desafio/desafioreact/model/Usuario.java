package com.desafio.desafioreact.model;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Lob;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "usuario")
public class Usuario {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private String nome;
	private String email;
	private String username;
	private String senha;
	
	@Column(name = "telefone")
	private String telefone;
	
	@Lob
    private byte[] foto_perfil;

	@Column(columnDefinition = "TINYINT(1)")
	private boolean ativo;

	@ManyToOne
	@JoinColumn(name = "nivelpermissao_id")
	private NivelPermissao nivelPermissao;

	// Construtor padrão
	public Usuario() {
	}

	// Construtor com parâmetros
	public Usuario(String nome, String email, boolean ativo, String username, String senha, String telefone,
			NivelPermissao nivelPermissao) {
		this.nome = nome;
		this.email = email;
		this.ativo = ativo;
		this.username = username;
		this.senha = senha;
		this.telefone = telefone;
		this.nivelPermissao = new NivelPermissao();

	}

	
	
	
	
	
	

	public byte[] getFoto_perfil() {
		return foto_perfil;
	}

	public void setFoto_perfil(byte[] foto_perfil) {
		this.foto_perfil = foto_perfil;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}
	
	
	

	public boolean isAtivo() {
		return ativo;
	}

	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}




	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public NivelPermissao getNivelPermissao() {
		return nivelPermissao;
	}

	public void setNivelPermissao(NivelPermissao nivelPermissao) {
		this.nivelPermissao = nivelPermissao;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null || getClass() != obj.getClass())
			return false;
		Usuario usuario = (Usuario) obj;
		return id != null && id.equals(usuario.id);
	}

	@Override
	public int hashCode() {
		return 31;
	}

	@Override
	public String toString() {
		return "Usuario [id=" + id + ", nome=" + nome + ", email=" + email + ", username=" + username + ", senha="
				+ senha + ", telefone=" + telefone + ", status=" + ativo + ", nivelPermissao=" + nivelPermissao + "]";
	}

}
