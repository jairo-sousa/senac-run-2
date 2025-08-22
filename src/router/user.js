const { Router } = require("express");
const { userSchema } = require("../module/validator");

const userRouter = Router();

userRouter.get("/view/user", (req, res) => {
  res.status(200).render("user");
});

userRouter.post("/user", async (req, res) => {
  try {
    const user = userSchema.parse(req.body);

    console.log(user);

    res.status(200).send("Usuário criado!");
  } catch (error) {
    console.log(error);
  }
});

module.exports = userRouter;
