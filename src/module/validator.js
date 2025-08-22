const z = require("zod");

const { cpf } = require("cpf-cnpj-validator");

const idSchema = z.string().pipe(z.coerce.number().nonnegative());
const cpfSchema = z.string().transform((value) => cpf.isValid(value));

const userSchema = z.object({
  name: z.string(),
  email: z.email(),
  cpf: cpfSchema,
  password: z.string(),
  profile_id: idSchema,
});

module.exports = {
  idSchema,
  userSchema,
};
