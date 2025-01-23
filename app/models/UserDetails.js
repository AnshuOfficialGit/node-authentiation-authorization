const { DataTypes } = require("sequelize");
module.exports = (sequelizeMain) => {
  return sequelizeMain.define(
    "UserDetails",
    {
      user_id: {
        type: DataTypes.INTEGER,
        references: {
          model: "users",
          key: "id",
        },
      },
      date_of_birth: {
        type: DataTypes.STRING,
        allowNull: true,
      },
      phone: {
        type: DataTypes.STRING,
        allowNull: true,
      },
      gender: {
        type: DataTypes.STRING,
        allowNull: true,
      },
      
      designation: {
        type: DataTypes.STRING,
        allowNull: true,
      },
      joining_date: {
        type: DataTypes.STRING,
        allowNull: true,
      },
      
      permanent_address: {
        type: DataTypes.TEXT,
        allowNull: true,
      },
      current_address: {
        type: DataTypes.TEXT,
        allowNull: true,
      },
      emergency_contact_name: {
        type: DataTypes.STRING,
        allowNull: true,
      },
      emergency_contact_number: {
        type: DataTypes.STRING,
        allowNull: true,
      },
      relation: {
        type: DataTypes.STRING,
        allowNull: true,
      },
      remarks: {
        type: DataTypes.TEXT,
        allowNull: true,
      },
      profile_picture: {
        type: DataTypes.STRING,
        allowNull: true,
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
      tableName: "user_details",
      paranoid: true,
      timestamps: true,
      createdAt: "created_at",
      updatedAt: "updated_at",
      deletedAt: "deleted_at",
    }
  );
};
