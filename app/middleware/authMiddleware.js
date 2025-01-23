const jwt = require("jsonwebtoken");
const helpers = require("../helpers/helpers");
const sequelize = require("../models");

require("dotenv").config();
exports.authenticate = (req, res, next) => {
  const token = req.headers.authorization?.split(" ")[1];
  if (!token) {
    return helpers.response(
      res,
      401,
      false,
      "Access denied : No token provided",
      {}
    );
  }
  try {
    const verified = jwt.verify(
      token,
      process.env.JWT_SECRET,
      async (err, api_key) => {
        if (err) {
          return helpers.response(res, 401, false, "Invalid Token!", {});
        } else {
          const User = sequelize.models.User;
          const userid = await User.findOne({
            where: { token: token },
          });
          if (userid) {
            req.user = { id: userid.id, email: userid.email };
            next();
          } else {
            return helpers.response(res, 401, false, "Invalid Token!", {});
          }
        }
      }
    );
  } catch (err) {
    return helpers.response(res, 401, false, "Invalid token", {});
  }
};
