const helpers = require("../helpers/helpers");
/**
 * Role Data
 */
module.exports.roleDetails = (req, role) => ({
  id: role.id || "",
  name: role.name || "",
  display_name: role.display_name || "",
  discription: role.description || "",
  created_at: helpers.formatDateTime(role.created_at),
});
/**
 * Permission Data
 */
module.exports.permissionDetails = (req, permission) => ({
  id: permission.id || "",
  name: permission.name || "",
  display_name: permission.display_name || "",
  discription: permission.description || "",
  created_at: helpers.formatDateTime(permission.created_at),
});
/**
 * Permission Data
 */
module.exports.roleWisePermissionDetails = (req, permission) => ({
  id: permission.id || "",
  name: permission.name || "",
  display_name: permission.display_name,
  description: permission.description,
  created_at: helpers.formatDateTime(permission.created_at),
});
/**
 * Role Wise Permission Data
 */
module.exports.roleWisePermissionDetails = (req, role) => ({
  id: role.id || "",
  name: role.name || "",
  description: role.description || "",
  permissions: role.Permissions
    ? role.Permissions.map((permission) => permissionDetails(req, permission))
    : [],
});
const permissionDetails = (req, permission) => ({
  id: permission.id || "",
  name: permission.name || "",
  display_name: permission.display_name || "",
  description: permission.description || "",
  // created_at: helpers.formatDateTime(permission.created_at),
});
