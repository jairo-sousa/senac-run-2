const publicRouter = require("./public");
const userRouter = require("./user");

module.exports = (app) => {
  app.use(publicRouter);
  app.use(userRouter);
};
