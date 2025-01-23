module.exports = (sequelize) => {
  const { User, UserDetails, Role, Permission, RolePermission } =
    sequelize.models;

  User.hasOne(UserDetails, {
    foreignKey: "user_id",
    as: "UserDetails",
  });

  UserDetails.belongsTo(User, {
    foreignKey: "id",
    as: "User",
  });

  /**
   * Role and Permission Association
   */
  Role.belongsToMany(Permission, {
    through: RolePermission,
    foreignKey: "role_id",
    otherKey: "permission_id",
  });
  Permission.belongsToMany(Role, {
    through: RolePermission,
    foreignKey: "permission_id",
    otherKey: "role_id",
  });
  RolePermission.belongsTo(Role, {
    foreignKey: "role_id",
    as: "Role",
  });
  RolePermission.belongsTo(Permission, {
    foreignKey: "permission_id",
    as: "Permission",
  });
  /**
   * Role and Permission Association End
   */
};
