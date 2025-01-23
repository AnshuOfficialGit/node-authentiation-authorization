const { DataTypes } = require("sequelize");

module.exports = (sequelizeInstance) => {
  return sequelizeInstance.define(
    "User",
    {
      unique_id: {
        type: DataTypes.STRING,
        allowNull: true,
      },
      full_name: {
        type: DataTypes.STRING,
        allowNull: true,
      },
      email: {
        type: DataTypes.STRING,
        allowNull: false,
      },
      password: {
        type: DataTypes.STRING,
        allowNull: false,
      },
      token: {
        type: DataTypes.TEXT,
        allowNull: true,
        defaultValue: null,
      },
      role_id: {
        type: DataTypes.INTEGER,
        references: {
          model: "roles",
          key: "id",
        },
      },
      status: {
        type: DataTypes.ENUM("active", "inactive"),
        allowNull: false,
        defaultValue: "active",
      },
      created_by: {
        type: DataTypes.STRING,
        allowNull: true,
        defaultValue: null,
      },
      updated_by: {
        type: DataTypes.STRING,
        allowNull: true,
        defaultValue: null,
      },
      deleted_by: {
        type: DataTypes.STRING,
        allowNull: true,
        defaultValue: null,
      },
      deleted_at: {
        type: DataTypes.DATE,
        allowNull: true,
        defaultValue: null,
      },
    },
    {
      tableName: "users",
      paranoid: true,
      timestamps: true,
      createdAt: "created_at",
      updatedAt: "updated_at",
      deletedAt: "deleted_at",
    }
  );
};
