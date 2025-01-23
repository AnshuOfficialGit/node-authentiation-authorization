const logger = require("../../../config/logger");
const helpers = require("../../helpers/helpers");
const sequelize = require("../../models");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
/**
 * Login a user
 */
const login = async (req, res) => {
  const { email, password } = req.body;
  try {
    const UserModel = sequelize.models.User;
    const user = await UserModel.findOne({ where: { email } });
    if (!user || !(await bcrypt.compare(password, user.password))) {
      return helpers.response(res, 401, false, "Invalid credentials!", {});
    }
    const token = jwt.sign({ id: user.id }, process.env.JWT_SECRET);
    UserModel.update({ token: token }, { where: { id: user.id } });
    return helpers.response(res, 200, true, "Logged In Successfully!", {
      name: user.name,
      email: user.email,
      token: token,
    });
  } catch (err) {
    logger.error("Log error " + err.message);
    return helpers.response(
      res,
      500,
      true,
      "Something went wrong!",
      err.message
    );
  }
};
module.exports = {
  login,
};
