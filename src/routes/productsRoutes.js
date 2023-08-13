import { Router } from "express";
import {  getCategory, getHeaderOptions, 
        getMyAds, getProductsHome, getSector1, getSector2, getSectorProducts, 
         getThisProduct, insertNewProduct 
        } from "../controllers/productsControllers.js";
import { tokenValidation } from "../middlewares/tokenValidation.js";

export const productsRoutes = Router();

productsRoutes.get('/chooseCategory', getSector2);
productsRoutes.get('/chooseCategory/:id', getSector1);
productsRoutes.get('/category/:id', getCategory);

productsRoutes.get(`/headerOptions`, getHeaderOptions);

productsRoutes.post('/insertNewProduct', tokenValidation, insertNewProduct)
productsRoutes.get(`/home`,tokenValidation ,getProductsHome);
productsRoutes.get(`/myAds`,tokenValidation, getMyAds);
productsRoutes.get(`/:sectorPage`,tokenValidation ,getSectorProducts);
productsRoutes.get('/:category/:id', tokenValidation, getThisProduct);
