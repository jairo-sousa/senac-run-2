const express = require("express");
const app = express();
const PORT = 3000;

const router = require("./router");
const config = require("./config");

// ROUTER
router(app);

// CONFIG
config(app);

app.listen(PORT, () => {
  console.log(`Servidor rodando em: http://localhost:${PORT}`);
});
