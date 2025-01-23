/**
 * This is the main routes file for the application
 */
const express = require("express");
const router = express.Router();
require("express-group-routes");
const roleController = require("../app/controllers/authorization/roles/rolesController");
const permissionController = require("../app/controllers/authorization/permission/permissionController");
const assignmentController = require("../app/controllers/authorization/assignment/assignmentController");
const authController = require('../app/controllers/authentication/authController');
const { authenticate } = require("../app/middleware/authMiddleware");
const {
  validateLogin,
  validateCreateRole,
  validateUpdateRole,
  validateCreatePermission,
  validateUpdatePermission,
  validateCreateAssignPermission,
  validateUpdateAssignPermission,
  validate,
} = require("../app/request/validator");

/**
 * Authentication Routes
 */
router.post("/auth/login", validateLogin, validate, authController.login);

/**
 * Role Routes
 */
router.group("/roles", (router) => {
  router.get("/", authenticate,roleController.list);
  router.post(
    "/create",
    authenticate,
    validateCreateRole,
    validate,
    roleController.store
  );
  router.get("/:id", authenticate, roleController.show);
  router.post(
    "/update",
    authenticate,
    validateUpdateRole,
    validate,
    roleController.update
  );
  router.get("/destory/:id", authenticate, roleController.destroy);
});
/**
 * Permission Routes
 */
router.group("/permission", (router) => {
  router.get("/",authenticate, permissionController.list);
  router.post(
    "/create",
    authenticate,
    validateCreatePermission,
    validate,
    permissionController.store
  );
  router.get("/:id", permissionController.show);
  router.post(
    "/update",
    authenticate,
    validateUpdatePermission,
    validate,
    permissionController.update
  );
  router.get("/destory/:id",authenticate, permissionController.destroy);
});

/**
 * Permission Assignment Routes
 */
router.group("/assignment", (router) => {
  router.get("/", authenticate,assignmentController.list);
  router.post(
    "/create",
    authenticate,
    validateCreateAssignPermission,
    validate,
    assignmentController.store
  );
  router.post(
    "/update",
    authenticate,
    validateUpdateAssignPermission,
    validate,
    assignmentController.update
  );
});

module.exports = router;
