const helpers = {};
const moment = require("moment");

/**
 * Response helper
 */
helpers.response = (
  res,
  code = "200",
  status = false,
  message = null,
  data = {}
) => {
  res.status(code).send({ status: status, message: message, data: data });
};
/**
 * Format the date and time
 */
helpers.formatDateTime = (data) => {
  return moment(data).format("DD-MM-YYYY HH:mm A");
};
/**
 * Format the date
 */
helpers.formatDate = (data) => {
  return moment(data).format("DD-MM-YYYY");
};
/**
 * Base URL helper
 */
helpers.baseURL = (req) => {
  const protocol = req.protocol;
  const host = req.get("host");
  const baseUrl = `${protocol}://${host}`;
  return baseUrl;
};
/**
 * Make the first Character in Upper Case.
 */
helpers.capitalizeFirstLetter = (str) => {
  if (!str) return "";
  return str.charAt(0).toUpperCase() + str.slice(1);
};

/**
 * Generate the Unique Code
 */
helpers.getCode = (name, id) => {
  console.log(name);
  const words = name.trim().split(/\s+/);
  const code = words.map((word) => word[0].toUpperCase()).join("");
  const name_code = code + "-" + id;
  return name_code;
};

helpers.updateOrCreate = async (model, condition, data) => {
  const record = await model.findOne({ where: condition });
  if (record) {
    return await record.update(data);
  } else {
    return await model.create({ ...condition, ...data });
  }
};
module.exports = helpers;
