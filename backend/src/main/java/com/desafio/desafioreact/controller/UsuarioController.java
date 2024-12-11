package com.desafio.desafioreact.controller;

import java.util.Base64;
import java.util.List;
import java.util.Optional;

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
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
@RequestMapping("/api")
public class UsuarioController {

	@Autowired
	private UsuarioRepository usuarioRepository; // Injeção do Repository

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

			if (imagem != null && !imagem.isEmpty()) {
				usuario.setFoto_perfil(imagem.getBytes());
			}

			if (usuario.isAtivo()) {
				long countAtivos = usuarioRepository.countByAtivoTrue();
				if (countAtivos >= 5) {
					throw new ResponseStatusException(HttpStatus.BAD_REQUEST,
							"Não é permitido mais de 5 usuários ativos.");
				}
			}

			usuarioRepository.save(usuario);
			return ResponseEntity.ok("Usuário cadastrado com sucesso.");
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Erro ao cadastrar usuário.");
		}
	}

	@GetMapping("/users")
	public List<Usuario> getAllUsers() {
		return usuarioRepository.findAll();
	}

	@GetMapping("/users/{id}")
	public ResponseEntity<Usuario> getUserById(@PathVariable Long id) {
		System.out.println("Requisição GET para o usuário com ID: " + id);
		return ResponseEntity.ok(usuarioRepository.findById(id)
				.orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Usuário não encontrado")));
	}

	@PutMapping(value = "/users/{id}", consumes = {"multipart/form-data"})
	public ResponseEntity<?> atualizarUsuario(
	    @PathVariable Long id,
	    @RequestPart("usuario") String usuarioJson,
	    @RequestPart(value = "foto_perfil", required = false) MultipartFile fotoPerfil) {
	    try {
	        // Converter JSON em objeto Usuario
	        ObjectMapper objectMapper = new ObjectMapper();
	        Usuario usuario = objectMapper.readValue(usuarioJson, Usuario.class);

	        // Log para verificar dados do usuário recebidos
	        System.out.println("Dados recebidos do usuário: " + usuario);

	        // Buscar o usuário existente no banco
	        Optional<Usuario> usuarioOptional = usuarioRepository.findById(id);

	        if (usuarioOptional.isPresent()) {
	            Usuario usuarioExistente = usuarioOptional.get();

	            // Atualizar dados do usuário
	            usuarioExistente.setNome(usuario.getNome());
	            usuarioExistente.setUsername(usuario.getUsername());
	            usuarioExistente.setEmail(usuario.getEmail());
	            usuarioExistente.setAtivo(usuario.isAtivo());
	            usuarioExistente.setTelefone(usuario.getTelefone());

	            if (usuario.getNivelPermissao() != null && usuario.getNivelPermissao().getId() != null) {
	                NivelPermissao nivelPermissao = nivelPermissaoRepository.findById(usuario.getNivelPermissao().getId())
	                        .orElseThrow(() -> new ResponseStatusException(HttpStatus.BAD_REQUEST, "Nível de permissão inválido"));
	                usuarioExistente.setNivelPermissao(nivelPermissao);
	            }

	            // Atualizar foto de perfil, se enviada
	            if (fotoPerfil != null && !fotoPerfil.isEmpty()) {
	                if (fotoPerfil.getSize() > 2 * 1024 * 1024) { // Limite de 2MB
	                    return ResponseEntity.badRequest().body("Arquivo de imagem muito grande. Máximo permitido: 2MB.");
	                }

	                // Validar tipo MIME (opcional)
	                String contentType = fotoPerfil.getContentType();
	                if (!contentType.equals("image/jpeg") && !contentType.equals("image/png")) {
	                    return ResponseEntity.badRequest().body("Formato de imagem inválido. Aceitos: JPEG e PNG.");
	                }

	                usuarioExistente.setFoto_perfil(fotoPerfil.getBytes());
	            }

	            // Salvar as alterações
	            usuarioRepository.save(usuarioExistente);

	            return ResponseEntity.ok("Usuário atualizado com sucesso.");
	        } else {
	            return ResponseEntity.status(404).body("Usuário não encontrado.");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        return ResponseEntity.status(400).body("Erro ao processar dados do usuário: " + e.getMessage());
	    }
	}



	@GetMapping("/users/{id}/foto")
	public ResponseEntity<String> obterFotoPerfil(@PathVariable Long id) {
		Optional<Usuario> usuarioOptional = usuarioRepository.findById(id);

		if (usuarioOptional.isPresent() && usuarioOptional.get().getFoto_perfil() != null) {
			String base64 = Base64.getEncoder().encodeToString(usuarioOptional.get().getFoto_perfil());
			return ResponseEntity.ok(base64);
		}

		return ResponseEntity.status(HttpStatus.NOT_FOUND).body("");
	}
}
