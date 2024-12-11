import React, { useState, useEffect } from "react";
import axios from "axios";
import {
  TextField,
  Button,
  Box,
  Typography,
  MenuItem,
  Select,
  InputLabel,
  FormControl,
  FormControlLabel,
  Avatar,
  Switch,
} from "@mui/material";
import { useNavigate } from "react-router-dom";  // Importe o useNavigate

function CadastroUsuario() {
  const [formData, setFormData] = useState({
    nome: "",
    username: "",
    email: "",
    telefone: "",
    senha: "",
    ativo: false,
    fotoPerfil: null,
    nivelPermissaoId: "",
  });

  const [niveisPermissao, setNiveisPermissao] = useState([]);
  const [fotoPreview, setFotoPreview] = useState(null); // Estado para a pré-visualização da imagem

  const navigate = useNavigate();  // Defina o navigate

  // Buscar níveis de permissão no backend assim que o formulário carregar
  useEffect(() => {
    const fetchNiveisPermissao = async () => {
      try {
        const response = await axios.get("http://localhost:8080/api/niveis/all");
        setNiveisPermissao(response.data);
      } catch (error) {
        console.error("Erro ao buscar níveis de permissão: ", error);
      }
    };

    fetchNiveisPermissao();
  }, []);

  const handleChange = (e) => {
    const { name, value, type, checked } = e.target;
    setFormData((prevState) => ({
      ...prevState,
      [name]: type === "checkbox" ? checked : value,
    }));
  };

  const handleFileChange = (e) => {
    const file = e.target.files[0];
    setFormData({ ...formData, fotoPerfil: file });
    if (file) {
      // Definir o caminho da imagem para a pré-visualização
      const reader = new FileReader();
      reader.onloadend = () => {
        setFotoPreview(reader.result);
      };
      reader.readAsDataURL(file);
    }
  };

  const handleSubmit = async () => {
    const formDataToSubmit = new FormData();
    const usuarioObj = {
      nome: formData.nome,
      username: formData.username,
      email: formData.email,
      telefone: formData.telefone,
      senha: formData.senha,
      ativo: formData.ativo,
      nivelPermissao: { id: formData.nivelPermissaoId },
    };

    formDataToSubmit.append("usuario", JSON.stringify(usuarioObj));
    if (formData.fotoPerfil) {
      formDataToSubmit.append("imagem", formData.fotoPerfil);
    }
    

    try {
      const response = await axios.post(
        "http://localhost:8080/api/cadastrar",
        formDataToSubmit,
        { headers: { "Content-Type": "multipart/form-data" } }
      );
      alert(response.data);
      navigate("/"); // Redirecionar após o cadastro
    } catch (error) {
      console.error("Erro ao enviar dados: ", error.response?.data);
      alert("Erro ao enviar dados.");
    }
  };

  return (
    <Box sx={{ display: "flex", justifyContent: "center", alignItems: "center", flexDirection: "column", p: 4 }}>
      <Typography variant="h5" sx={{ mb: 3 }}>Cadastro de Usuário</Typography>
      
      {/* Imagem de Perfil */}
      <Box sx={{ display: "flex", justifyContent: "center", alignItems: "center", mb: 3 }}>
        <Avatar
          sx={{ width: 80, height: 80, bgcolor: "grey.300" }}
          src={fotoPreview || "/default-avatar.png"} // Imagem padrão se não houver pré-visualização
        />
      </Box>

      <Button
        variant="contained"
        component="label"
        sx={{ fontSize: "12px", textTransform: "none", marginBottom: "10px" }}
      >
        Adicionar imagem
        <input
          type="file"
          onChange={handleFileChange}
          hidden
        />
      </Button>

      <TextField
        name="nome"
        label="Nome"
        value={formData.nome}
        onChange={handleChange}
        fullWidth
        sx={{ mb: 2 }}
      />
      <TextField
        name="username"
        label="Username"
        value={formData.username}
        onChange={handleChange}
        fullWidth
        sx={{ mb: 2 }}
      />
      <TextField
        name="email"
        label="E-mail"
        value={formData.email}
        onChange={handleChange}
        fullWidth
        sx={{ mb: 2 }}
      />
      <TextField
        name="telefone"
        label="Telefone"
        value={formData.telefone}
        onChange={handleChange}
        fullWidth
        sx={{ mb: 2 }}
      />
      <TextField
        name="senha"
        label="Senha"
        type="password"
        value={formData.senha}
        onChange={handleChange}
        fullWidth
        sx={{ mb: 2 }}
      />

      {/* Nível de Permissão */}
      <FormControl fullWidth sx={{ mb: 2 }}>
        <InputLabel>Nível de Permissão</InputLabel>
        <Select
          name="nivelPermissaoId"
          value={formData.nivelPermissaoId}
          label="Nível de Permissão"
          onChange={handleChange}
        >
          {niveisPermissao.map((nivel) => (
            <MenuItem key={nivel.id} value={nivel.id}>
              {nivel.permissao}
            </MenuItem>
          ))}
        </Select>
      </FormControl>

      {/* Checkbox para marcar se o usuário será ativo */}
      <FormControlLabel
        control={
          <Switch
            name="ativo"
            checked={formData.ativo}
            onChange={handleChange}
          />
        }
        label="Usuário Ativo"
      />

      <Box sx={{ display: "flex", justifyContent: "flex-end", gap: 2, mt: 3 }}>
        <Button
          variant="outlined"
          sx={{ textTransform: "none" }}
        >
          Voltar
        </Button>
        <Button
          variant="contained"
          sx={{ textTransform: "none" }}
          onClick={handleSubmit}
        >
          Cadastrar
        </Button>
      </Box>
    </Box>
  );
}

export default CadastroUsuario;
