package com.desafio.desafioreact.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.desafio.desafioreact.model.NivelPermissao;
import com.desafio.desafioreact.service.NivelPermissaoService;

@RestController
@RequestMapping("/api/niveis")
public class NivelPermissaoController {

    @Autowired
    private NivelPermissaoService nivelPermissaoService; // Injeção do Service

    @GetMapping("/all")
    public ResponseEntity<List<NivelPermissao>> getAllNiveis() {
        return ResponseEntity.ok(nivelPermissaoService.findAll());
    }
}
