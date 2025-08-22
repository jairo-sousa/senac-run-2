var cors = require("cors");
const path = require("path");
const express = require("express");

module.exports = (app) => {
  app.use(cors());

  app.use("/static", express.static(path.join(__dirname, "public")));

  app.set("view engine", "ejs");
  app.set("views", path.join(__dirname, "view"));
};
