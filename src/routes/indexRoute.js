import { Router } from "express";
import usersRoutes from "./usersRoutes.js";
import { productsRoutes } from "./productsRoutes.js";

export const indexRoute = Router();
indexRoute.use(usersRoutes);
indexRoute.use(productsRoutes);

