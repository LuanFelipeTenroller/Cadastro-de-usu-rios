import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import CadastroForm from './components/CadastroForm';
import TabelaUsuario from './components/TabelaUsuario';
import EditarUsuario from './components/EditarUsuario';

function App() {
  return (
    <Router>
      <Routes>
        <Route path="/cadastrar" element={<CadastroForm />} />
        <Route path="/" element={<TabelaUsuario />}/>
        <Route path="/editar/:id" element={<EditarUsuario/>}/>
      </Routes>
    </Router>
  );
}

export default App;

