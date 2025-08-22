const { Router } = require("express");

const userRouter = Router();

userRouter.get("/view/user", (req, res) => {
  res.status(200).render("user");
});

module.exports = userRouter;
