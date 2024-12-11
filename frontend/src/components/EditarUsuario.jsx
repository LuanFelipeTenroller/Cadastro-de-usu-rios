import React, { useState, useEffect } from "react";
import { useParams, useNavigate } from "react-router-dom";
import axios from "axios";
import {
  Box,
  TextField,
  Button,
  Typography,
  FormControlLabel,
  FormControl,
  InputLabel,
  Select,
  MenuItem,
  Switch,
  Avatar,
} from "@mui/material";

function EditarUsuario() {
  const { id } = useParams(); // Obter o ID do usuário da URL
  const navigate = useNavigate();

  const [user, setUser] = useState({
    nome: "",
    username: "",
    email: "",
    telefone: "", // Campo de telefone
    ativo: false,
    foto_perfil: "",
    nivelPermissaoId: "", // Campo para armazenar o nível de permissão
  });

  const [imagem, setImagem] = useState(null); // Armazenar a imagem selecionada
  const [fotoPreview, setFotoPreview] = useState(""); // Armazenar a URL da imagem para pré-visualização
  const [niveisPermissao, setNiveisPermissao] = useState([]); // Estado para armazenar os níveis de permissão

  // Buscar dados do usuário e níveis de permissão ao carregar o componente
  useEffect(() => {
    const fetchUserAndPermissions = async () => {
      try {
        // Buscar dados do usuário
        const userResponse = await axios.get(`http://localhost:8080/api/users/${id}`);

        // Buscar níveis de permissão
        const niveisPermissaoResponse = await axios.get("http://localhost:8080/api/niveis/all");

        const fotoPerfilURL = "/default-avatar.png";

        let userFotoResponse = null;
        try {
          userFotoResponse = await axios.get(`http://localhost:8080/api/users/${id}/foto`);
        } catch (error) {
          console.log("Erro ao buscar foto do usuário, usando imagem padrão.");
        }

        const fotoComBase64 = userFotoResponse?.data
          ? `data:image/jpeg;base64,${userFotoResponse.data}`
          : fotoPerfilURL;

        console.log("Dados do usuário:", userResponse.data);

        setUser({
          id: id,
          nome: userResponse.data.nome,
          username: userResponse.data.username,
          email: userResponse.data.email,
          telefone: userResponse.data.telefone || "", // Definir telefone
          ativo: userResponse.data.ativo,
          foto_perfil: fotoComBase64,
          nivelPermissaoId: userResponse.data.nivelPermissaoId || "", // Definindo nível de permissão
        });

        setNiveisPermissao(niveisPermissaoResponse.data);
      } catch (error) {
        console.error("Erro ao buscar dados do usuário ou níveis de permissão:", error);
      }
    };

    fetchUserAndPermissions();
  }, [id]);

  const handleChange = (e) => {
    const { name, value, type, checked } = e.target;
    setUser((prevState) => ({
      ...prevState,
      [name]: type === "checkbox" ? checked : value,
    }));
  };

  const handleImageChange = (e) => {
    const file = e.target.files[0];
    if (file) {
      setImagem(file);

      // Gerar a URL da imagem para a pré-visualização
      const reader = new FileReader();
      reader.onloadend = () => {
        setFotoPreview(reader.result);
      };
      reader.readAsDataURL(file);
    }
  };

  const handleSubmit = async () => {
    try {
      const formData = new FormData();

      // Adicionando o JSON do usuário no campo "usuario"
      const usuarioJson = JSON.stringify({
        nome: user.nome,
        username: user.username,
        email: user.email,
        telefone: user.telefone, // Adicionar telefone ao JSON
        ativo: user.ativo,
        nivelPermissao: {
          id: user.nivelPermissaoId,
          permissao: niveisPermissao.find(nivel => nivel.id === user.nivelPermissaoId)?.permissao
        }
      });

      formData.append("usuario", usuarioJson);

      // Adicionando a imagem, caso exista
      if (imagem) {
        formData.append("foto_perfil", imagem); // Backend espera "foto_perfil"
      }

      console.log("Dados enviados (FormData):");
      for (let pair of formData.entries()) {
        console.log(`${pair[0]}: ${pair[1]}`);
      }

      // Enviando a requisição
      const response = await axios.put(
        `http://localhost:8080/api/users/${id}`,
        formData,
        {
          headers: {
            "Content-Type": "multipart/form-data",
          },
        }
      );

      console.log("Resposta do servidor:", response.data);
      alert("Usuário atualizado com sucesso!");
      navigate("/");
    } catch (error) {
      console.error("Erro ao atualizar usuário:", error.response?.data || error.message);
      alert("Erro ao atualizar usuário.");
    }
  };

  return (
    <Box sx={{ padding: 3 }}>
    <Typography variant="h4" gutterBottom>
      Editar Usuário
      <Box sx={{ display: "flex", justifyContent: "center", alignItems: "center", mb: 3 }}>
        <Avatar
          src={fotoPreview || user.foto_perfil}
          alt="Foto do perfil"
          sx={{ width: 100, height: 100, marginBottom: 2 }}
        />
      </Box>
  
      {/* Centralizando o botão */}
      <Box sx={{ display: "flex", justifyContent: "center", mb: 3 }}>
        <Button
          variant="contained"
          component="label"
          sx={{ fontSize: "12px", textTransform: "none", marginBottom: "10px" }}
        >
          Adicionar imagem
          <input
            type="file"
            onChange={handleImageChange}  // Usando handleImageChange
            hidden
          />
        </Button>
      </Box>
    </Typography>
  
    <form>
      <Box sx={{ display: "flex", flexDirection: "column", gap: 2 }}>
        <TextField
          label="Nome"
          name="nome"
          variant="outlined"
          fullWidth
          value={user.nome}
          onChange={handleChange}
        />
        <TextField
          label="Username"
          name="username"
          variant="outlined"
          fullWidth
          value={user.username}
          onChange={handleChange}
        />
        <TextField
          label="Email"
          name="email"
          variant="outlined"
          fullWidth
          value={user.email}
          onChange={handleChange}
        />
        <TextField
          label="Telefone"
          name="telefone"
          variant="outlined"
          fullWidth
          value={user.telefone}
          onChange={handleChange}
        />
        <FormControlLabel
          control={
            <Switch
              checked={user.ativo}
              name="ativo"
              onChange={handleChange}
            />
          }
          label="Ativo"
        />
  
        <FormControl fullWidth sx={{ mt: 2 }}>
          <InputLabel>Nível de Permissão</InputLabel>
          <Select
            name="nivelPermissaoId"
            value={user.nivelPermissaoId}
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
  
        <Box sx={{ display: "flex", justifyContent: "flex-end", gap: 2, mt: 3 }}>
          <Button
            variant="outlined"
            sx={{ minWidth: 100, textTransform: "none" }}
            onClick={() => navigate("/")}
          >
            Voltar
          </Button>
          <Button
            variant="contained"
            sx={{ minWidth: 100, textTransform: "none" }}
            onClick={handleSubmit}
          >
            Salvar
          </Button>
        </Box>
      </Box>
    </form>
  </Box>
  
  );
}

export default EditarUsuario;
