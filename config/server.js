const express = require("express");
const sequelize = require("../app/models");
const User = require("../app/models/User");
require("dotenv").config();
const appConfig = require("../config/app");
const route = require("../routes/route");

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(express.json());
app.use(route);

// Test database connection and sync models
(async () => {
  try {
    await sequelize.authenticate();
    console.log("Database connected!");
    await sequelize.sync();
    const User = sequelize.models.User;
    const adminExists = await User.findOne({
      where: { email: "superadmin@gmail.com" },
    });
    if (!adminExists) {
      const password = appConfig.super_password;

      await User.create({
        full_name: "Super Admin",
        email: "admin@gmail.com",
        password: password,
      });
    }
  } catch (error) {
    console.error("Unable to connect to the database:", error);
  }
})();

// Sample route
app.get("/", (req, res) => {
  res.send("Sequelize ORM with Associations!");
});

// Start server
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
