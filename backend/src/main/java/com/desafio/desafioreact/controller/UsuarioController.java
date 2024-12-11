package com.desafio.desafioreact.controller;

import java.util.Base64;
import java.util.List;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;

import com.desafio.desafioreact.model.NivelPermissao;
import com.desafio.desafioreact.model.Usuario;
import com.desafio.desafioreact.repository.NivelPermissaoRepository;
import com.desafio.desafioreact.repository.UsuarioRepository;
import com.desafio.desafioreact.service.UsuarioService;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
@RequestMapping("/api")
public class UsuarioController {

	private static final Logger logger = LoggerFactory.getLogger(UsuarioController.class);

	@Autowired
	private UsuarioRepository usuarioRepository;

	@Autowired
	private UsuarioService usuarioService;

	@Autowired
	private NivelPermissaoRepository nivelPermissaoRepository;

	@PostMapping(value = "/cadastrar", consumes = { "multipart/form-data" })
	public ResponseEntity<String> cadastrarUsuario(@RequestPart("usuario") String usuarioJson,
			@RequestPart(value = "imagem", required = false) MultipartFile imagem) {
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			Usuario usuario = objectMapper.readValue(usuarioJson, Usuario.class);

			NivelPermissao nivel = nivelPermissaoRepository.findById(usuario.getNivelPermissao().getId()).orElseThrow(
					() -> new ResponseStatusException(HttpStatus.BAD_REQUEST, "Nível de permissão inválido"));

			usuario.setNivelPermissao(nivel);

			if (usuario.isAtivo()) {
				usuarioService.verificarLimiteUsuariosAtivos();
			}

			if (imagem != null && !imagem.isEmpty()) {
				usuario.setFoto_perfil(imagem.getBytes());
			}

			usuarioRepository.save(usuario);
			return ResponseEntity.ok("Usuário cadastrado com sucesso.");
		} catch (Exception ex) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body("Erro ao cadastrar usuário: " + ex.getMessage());
		}
	}

	@GetMapping("/users")
	public ResponseEntity<List<Usuario>> listarUsuarios() {
		try {
			List<Usuario> usuarios = usuarioRepository.findAll();
			return ResponseEntity.ok(usuarios);
		} catch (Exception ex) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}

	@GetMapping("/users/{id}")
	public ResponseEntity<Usuario> obterUsuario(@PathVariable Long id) {
		Optional<Usuario> usuario = usuarioRepository.findById(id);
		if (usuario.isPresent()) {
			return ResponseEntity.ok(usuario.get());
		} else {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
		}
	}

	@GetMapping("/users/{id}/foto")
	public ResponseEntity<String> obterFotoPerfil(@PathVariable Long id) {
	    Optional<Usuario> usuarioOptional = usuarioRepository.findById(id);
	    if (usuarioOptional.isPresent()) {
	        Usuario usuario = usuarioOptional.get();
	        byte[] foto = usuario.getFoto_perfil();

	        if (foto != null && foto.length > 0) {
	            // Codifica a imagem em Base64
	            String base64 = Base64.getEncoder().encodeToString(foto);
	            return ResponseEntity.ok(base64);  // Retorna a string Base64 da imagem
	        } else {
	            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Foto não encontrada.");
	        }
	    } else {
	        return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Usuário não encontrado.");
	    }
	}

	@PutMapping(value = "/users/{id}", consumes = { "multipart/form-data" })
	public ResponseEntity<String> atualizarUsuario(@PathVariable Long id, @RequestPart("usuario") String usuarioJson,
			@RequestPart(value = "foto_perfil", required = false) MultipartFile fotoPerfil) {
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			Usuario usuario = objectMapper.readValue(usuarioJson, Usuario.class);

			Optional<Usuario> usuarioExistenteOptional = usuarioRepository.findById(id);
			if (usuarioExistenteOptional.isPresent()) {
				Usuario usuarioExistente = usuarioExistenteOptional.get();

				if (!usuarioExistente.isAtivo() && usuario.isAtivo()) {
					usuarioService.verificarLimiteUsuariosAtivos();
				}

				usuarioExistente.setNome(usuario.getNome());
				usuarioExistente.setEmail(usuario.getEmail());
				usuarioExistente.setUsername(usuario.getUsername());
				usuarioExistente.setAtivo(usuario.isAtivo());

				if (fotoPerfil != null && !fotoPerfil.isEmpty()) {
					usuarioExistente.setFoto_perfil(fotoPerfil.getBytes());
				}

				usuarioRepository.save(usuarioExistente);
				return ResponseEntity.ok("Usuário atualizado com sucesso.");
			} else {
				return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Usuário não encontrado.");
			}
		} catch (Exception ex) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body("Erro ao atualizar usuário: " + ex.getMessage());
		}
	}
}