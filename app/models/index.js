const sequelize = require("../../config/database");
const UserModel = require("./User");
const UserDetailsModel = require("./UserDetails");
const RoleModel = require("./Role");
const PermissionModel = require("./Permission");
const RolePermissionModel = require("./RolePermission");
const defineAssociations = require("./association");

// Initialize models
UserModel(sequelize);
UserDetailsModel(sequelize);
RoleModel(sequelize);
PermissionModel(sequelize);
RolePermissionModel(sequelize);

// Define associations
defineAssociations(sequelize);

module.exports = sequelize;
