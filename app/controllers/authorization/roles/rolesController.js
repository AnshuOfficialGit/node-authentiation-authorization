const { Op } = require("sequelize");
const logger = require("../../../../config/logger");
const helpers = require("../../../helpers/helpers");
const sequelize = require("../../../models");
const appConfig = require("../../../../config/app");
const Resource = require("../../../resource/Resource");
/**
 * List of all Roles
 */
const list = async (req, res) => {
  try {
    const RoleModel = sequelize.models.Role;
    const search = req.body.search || "";
    const page = parseInt(req.body.page) || 1;
    const limit = parseInt(req.body.limit) || appConfig.pagination.limit;
    const offset = (page - 1) * limit;
    const order = [["id", req.body.order || "desc"]];
    const filterCondition = search
      ? {
          name: {
            [Op.like]: `%${search}%`,
          },
        }
      : {};
    const { rows: roles, count: total_items } = await RoleModel.findAndCountAll(
      {
        where: filterCondition,
        order: order,
        limit: parseInt(limit),
        offset: parseInt(offset),
      }
    );
    const total_pages = Math.ceil(total_items / limit);
    const response = {
      data: Resource.rolesList(req, roles),
      pagination: {
        total_items,
        total_pages,
        current_page: parseInt(page),
        items_per_page: parseInt(limit),
      },
    };
    return helpers.response(res, 200, true, "Role Lists!", response);
  } catch (err) {
    logger.error("Log error " + err.message);
    return helpers.response(res, 500, true, "Something went wrong!", {});
  }
};
/**
 * Create a new Role
 */
const store = async (req, res) => {
  const { name, description } = req.body;
  // try {
  const RoleModel = sequelize.models.Role;
  const check = await RoleModel.findOne({ where: { name } });
  if (check) {
    return helpers.response(res, 401, false, "Role name  already exists!", {});
  }
  const display_name = name;
  name.toLowerCase().replace(/ /g, "-");
  const role = await RoleModel.create({
    name,
    display_name,
    description,
  });
  return helpers.response(res, 200, true, "Role created successfully!", {});
  // } catch (err) {
  //   logger.error("Log error " + err.message);
  //   return helpers.response(
  //     res,
  //     500,
  //     true,
  //     "Something went wrong!" + err.message,
  //     {}
  //   );
  // }
};
/**
 * Single Role Details
 */
const show = async (req, res) => {
  try {
    const RoleModel = sequelize.models.Role;
    if (!req.params.id) {
      return helpers.response(res, 404, false, "Role Id is required", {});
    }
    const roles = await RoleModel.findOne({
      where: {
        id: req.params.id,
      },
    });
    const response = Resource.rolesList(req, roles);
    return helpers.response(res, 200, true, "Role Details!", response);
  } catch (err) {
    logger.error("Log error " + err.message);
    return helpers.response(res, 500, true, "Something went wrong!", {});
  }
};
/**
 * Update Role Details
 */
const update = async (req, res) => {
  const { role_id, name, description } = req.body;
  try {
    const RoleModel = sequelize.models.Role;
    const role = await RoleModel.findByPk(role_id);
    if (!role) {
      return helpers.response(res, 404, false, "Role not found", {});
    }
    const checkName = await RoleModel.findOne({
      where: {
        display_name: req.body.name,
        id: { [Op.not]: req.body.role_id },
      },
    });
    if (checkName) {
      return helpers.response(res, 200, false, "Role Name already exists!", {});
    }
    const display_name = name;
    await role.update({ display_name, description });
    return helpers.response(res, 200, true, "Role updated successfully!", {});
  } catch (err) {
    logger.error("Log error " + err.message);
    return helpers.response(
      res,
      500,
      false,
      "Something went wrong! " + err.message,
      {}
    );
  }
};
/**
 * Destroy the Roles
 */
const destroy = async (req, res) => {
  const { id } = req.params;
  try {
    const deleted_by = req.user.id;
    const RoleModel = sequelize.models.Role;
    const role = await RoleModel.findByPk(id);
    if (!role) {
      return helpers.response(res, 404, false, "Role not found", {});
    }
    await role.destroy();
    return helpers.response(res, 200, true, "Role deleted successfully!", {});
  } catch (err) {
    logger.error("Log error " + err.message);
    return helpers.response(
      res,
      500,
      false,
      "Something went wrong! " + err.message,
      {}
    );
  }
};
module.exports = {
  list,
  store,
  show,
  update,
  destroy,
};
