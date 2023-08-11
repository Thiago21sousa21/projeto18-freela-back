import { Router } from "express";
import { getAllCategorys, getHeaderOptions, 
        getMyAds, getProductsHome, getSectorProducts, 
        getThisProduct 
} from "../controllers/productsControllers.js";
import { tokenValidation } from "../middlewares/tokenValidation.js";

export const productsRoutes = Router();

productsRoutes.get(`/home`,tokenValidation ,getProductsHome);
productsRoutes.get(`/headerOptions`, getHeaderOptions);
productsRoutes.get(`/myAds`,tokenValidation, getMyAds);
productsRoutes.get(`/:sectorPage`,tokenValidation ,getSectorProducts);
productsRoutes.get('/:category/:id', tokenValidation, getThisProduct);
productsRoutes.get('/chooseCategory', getAllCategorys);
