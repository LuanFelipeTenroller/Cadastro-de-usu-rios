package com.desafio.desafioreact.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.desafio.desafioreact.model.Usuario;
import com.desafio.desafioreact.repository.UsuarioRepository;

@Service
public class UsuarioService {
    private final UsuarioRepository usuarioRepository;

    @Autowired
    public UsuarioService(UsuarioRepository usuarioRepository) {
        this.usuarioRepository = usuarioRepository;
    }

    
    public void verificarLimiteUsuariosAtivos() throws Exception {
        long countAtivos = usuarioRepository.countByAtivoTrue();
        if (countAtivos >= 5) {
            throw new Exception("Não é permitido mais de 5 usuários ativos simultâneos!");
        }
    }

    public Usuario salvarUsuario(Usuario usuario) throws Exception {
        
        if (usuario.isAtivo()) {
            verificarLimiteUsuariosAtivos();
        }

        return usuarioRepository.save(usuario);
    }

    public Usuario atualizarUsuario(Long id, Usuario usuario) throws Exception {
        Usuario usuarioExistente = usuarioRepository.findById(id)
                .orElseThrow(() -> new Exception("Usuário não encontrado"));

        
        if (usuario.isAtivo() && !usuarioExistente.isAtivo()) {
            verificarLimiteUsuariosAtivos();
        }

        usuarioExistente.setNome(usuario.getNome());
        usuarioExistente.setEmail(usuario.getEmail());
        usuarioExistente.setUsername(usuario.getUsername());
        usuarioExistente.setAtivo(usuario.isAtivo());

        return usuarioRepository.save(usuarioExistente);
    }

}

    
    
