const express = require('express');
const app = express();
const cors = require('cors');
const db = require('./conexao');
app.use(cors());
app.use(express.json());

app.listen(3000, () => {
    console.log('Servidor rodando na porta 3000');
});