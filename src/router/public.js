const { Router } = require("express");

const publicRouter = Router();

publicRouter.get("/", (req, res) => {
  res.send("Faça login!");
});

module.exports = publicRouter;
