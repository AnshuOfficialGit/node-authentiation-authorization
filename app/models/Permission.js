const { DataTypes } = require("sequelize");
module.exports = (sequelizeMain) => {
  return sequelizeMain.define(
    "Permission",
    {
      name: {
        type: DataTypes.STRING,
        allowNull: false,
      },
      display_name: {
        type: DataTypes.STRING,
        allowNull: false,
      },
      description: {
        type: DataTypes.STRING,
        allowNull: true,
      },
    },
    {
      paranoid: true,
      tableName: "permissions",
      timestamps: true,
      createdAt: "created_at",
      updatedAt: "updated_at",
    }
  );
};
