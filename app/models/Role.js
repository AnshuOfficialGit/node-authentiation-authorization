const { DataTypes } = require("sequelize");
module.exports = (sequelizeMain) => {
  return sequelizeMain.define(
    "Role",
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
        allowNull: false,
      },
    },
    {
      tableName: "roles",
      timestamps: true,
      createdAt: "created_at",
      updatedAt: "updated_at",
    }
  );
};
