import { Router } from "express";
import { getAllCategorys, getCategory, getHeaderOptions, 
        getMyAds, getProductsHome, getSectorProducts, 
        getSubHeaders, getThisProduct, insertNewProduct 
        } from "../controllers/productsControllers.js";
import { tokenValidation } from "../middlewares/tokenValidation.js";

export const productsRoutes = Router();

productsRoutes.get('/chooseCategory', getAllCategorys);
productsRoutes.get('/chooseCategory/:id', getSubHeaders);
productsRoutes.get('/category/:id', getCategory);

productsRoutes.get(`/headerOptions`, getHeaderOptions);

productsRoutes.post('/insertNewProduct', tokenValidation, insertNewProduct)
productsRoutes.get(`/home`,tokenValidation ,getProductsHome);
productsRoutes.get(`/myAds`,tokenValidation, getMyAds);
productsRoutes.get(`/:sectorPage`,tokenValidation ,getSectorProducts);
productsRoutes.get('/:category/:id', tokenValidation, getThisProduct);
