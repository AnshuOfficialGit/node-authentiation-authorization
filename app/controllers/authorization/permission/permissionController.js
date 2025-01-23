const { Op } = require("sequelize");
const logger = require("../../../../config/logger");
const helpers = require("../../../helpers/helpers");
const sequelize = require("../../../models");
const appConfig = require("../../../../config/app");
const Resource = require("../../../resource/Resource");
/**
 * List Permissions
 */
const list = async (req, res) => {
  try {
    const PermissionModel = sequelize.models.Permission;
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
    const { rows: roles, count: total_items } =
      await PermissionModel.findAndCountAll({
        where: filterCondition,
        order: order,
        limit: parseInt(limit),
        offset: parseInt(offset),
      });
    const total_pages = Math.ceil(total_items / limit);
    const response = {
      data: Resource.permissionList(req, roles),
      pagination: {
        total_items,
        total_pages,
        current_page: parseInt(page),
        items_per_page: parseInt(limit),
      },
    };
    return helpers.response(res, 200, true, "Permission Lists!", response);
  } catch (err) {
    logger.error("Log error " + err.message);
    return helpers.response(res, 500, true, "Something went wrong!", {});
  }
};
/**
 * Create Permissions
 */
const store = async (req, res) => {
  const { name, description } = req.body;
  try {
    const PermissionModel = sequelize.models.Permission;
    const display_name = name;
    const newName = name.toLowerCase().replace(/ /g, "-");
    const check = await PermissionModel.findOne({ where: { name: newName } });
    if (check) {
      return helpers.response(
        res,
        401,
        false,
        "Permission name  already exists!",
        {}
      );
    }
    const permission = await PermissionModel.create({
      name: newName,
      display_name,
      description,
    });
    return helpers.response(
      res,
      200,
      true,
      "Permission created successfully!",
      {}
    );
  } catch (err) {
    logger.error("Log error " + err.message);
    return helpers.response(res, 500, true, "Something went wrong!", {});
  }
};
/**
 * Signle  Permissions
 */
const show = async (req, res) => {
  try {
    if (!req.params.id) {
      return helpers.response(res, 404, false, "Permission Id is required", {});
    }
    const PermissionModel = sequelize.models.Permission;
    const permissions = await PermissionModel.findOne({
      where: {
        id: req.params.id,
      },
    });
    const response = Resource.permissionList(req, permissions);
    return helpers.response(res, 200, true, "Permission Details!", response);
  } catch (err) {
    logger.error("Log error " + err.message);
    return helpers.response(res, 500, true, "Something went wrong!", {});
  }
};
/**
 * Update Permissions
 */
const update = async (req, res) => {
  const { permission_id, name, description } = req.body;
  try {
    const id = permission_id;
    const PermissionModel = sequelize.models.Permission;
    const permission = await PermissionModel.findByPk(id);
    if (!permission) {
      return helpers.response(res, 404, false, "Permission not found", {});
    }
    const checkName = await PermissionModel.findOne({
      where: {
        display_name: req.body.name,
        id: { [Op.not]: permission_id },
      },
    });
    if (checkName) {
      return helpers.response(
        res,
        200,
        false,
        "Permission Name already exists!",
        {}
      );
    }
    const display_name = name;
    await permission.update({ display_name, description });
    return helpers.response(
      res,
      200,
      true,
      "Permission updated successfully!",
      {}
    );
  } catch (err) {
    logger.error("Log error " + err.message);
    return helpers.response(res, 500, false, "Something went wrong! ", {});
  }
};
/**
 * Destroy Permissions
 */
const destroy = async (req, res) => {
  const { id } = req.params;
  try {
    const PermissionModel = sequelize.models.Permission;
    const permission = await PermissionModel.findByPk(id);
    if (!permission) {
      return helpers.response(res, 404, false, "Permission not found", {});
    }
    await permission.destroy();
    return helpers.response(res, 200, true, "Permission deleted successfully!", {});
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
