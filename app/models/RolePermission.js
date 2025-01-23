const { DataTypes } = require("sequelize");
module.exports = (sequelizeMain) => {
  return sequelizeMain.define(
    "RolePermission",
    {
      role_id: {
        type: DataTypes.INTEGER,
        references: {
          model: "roles",
          key: "id",
        },
      },
      permission_id: {
        type: DataTypes.INTEGER,
        references: {
          model: "permissions",
          key: "id",
        },
      },
    },
    {
      tableName: "role_permissions",
      timestamps: true,
      createdAt: "created_at",
      updatedAt: "updated_at",
    }
  );
};
