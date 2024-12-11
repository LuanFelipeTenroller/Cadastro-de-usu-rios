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

    public Usuario salvarUsuario(Usuario usuario) throws Exception {
        // Contar quantos usuários ativos existem atualmente no banco
        int usuariosAtivos = usuarioRepository.countByAtivoTrue();
        System.out.println("Usuários Ativos antes de salvar: " + usuariosAtivos);

        if (usuario.isAtivo() && usuariosAtivos >= 5) {
            throw new Exception("Não é permitido mais de 5 usuários ativos simultâneos!");
        }

        System.out.println("Salvando usuário: " + usuario);
        return usuarioRepository.save(usuario);
    }

    public Usuario atualizarUsuario(Long id, Usuario usuario) throws Exception {
        Usuario usuarioExistente = usuarioRepository.findById(id)
            .orElseThrow(() -> new Exception("Usuário não encontrado"));

        if (usuario.isAtivo() && !usuarioExistente.isAtivo()) {
            // Se o usuário está sendo ativado, verifique se o limite é atingido
            int usuariosAtivos = usuarioRepository.countByAtivoTrue();
            System.out.println("Usuários Ativos antes de atualizar: " + usuariosAtivos);

            if (usuariosAtivos >= 5) {
                throw new Exception("Não é permitido mais de 5 usuários ativos simultâneos!");
            }
        }

        usuarioExistente.setNome(usuario.getNome());
        usuarioExistente.setEmail(usuario.getEmail());
        usuarioExistente.setUsername(usuario.getUsername());
        usuarioExistente.setAtivo(usuario.isAtivo());

        System.out.println("Atualizando usuário: " + usuarioExistente);
        return usuarioRepository.save(usuarioExistente);
    }

    public List<Usuario> buscarPorNome(String nome) {
        return usuarioRepository.findByNomeContaining(nome);
    }

    public Usuario buscarPorId(Long id) {
        return usuarioRepository.findById(id).orElse(null);
    }
    
    
    
}
