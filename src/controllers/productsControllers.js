import { db } from "../database/databaseConnection.js";

export const getProductsHome = async (req, res) => {
    try {
        const list = await db.query(`
        SELECT prod.name, prod."mainPhoto", prod.value, prod.id, cat.name AS category
        FROM products AS prod
        JOIN "productCategory" AS "proCat" ON prod.id = "proCat"."productId"
        JOIN category AS cat ON "proCat"."categoryId" = cat.id 
        LIMIT 40;
        `);
        res.send(list.rows);
    } catch (error) {
        res.status(500).send(error.message);
    }
}

export const getSectorProducts = async (req, res) => {
    const{sectorPage}=req.params;
    try {
        const list = await db.query(`
        SELECT prod.name, prod."mainPhoto", prod.value, prod.id, cat.name AS category
        FROM products AS prod
        JOIN "productCategory" AS "proCat" ON prod.id = "proCat"."productId"
        JOIN category AS cat ON "proCat"."categoryId" = cat.id 
        WHERE cat.name = $1
        ;
        `,[sectorPage]);
        res.send(list.rows);
    } catch (error) {
        console.log(error.message);

        res.status(500).send(error.message);
    }
}

export const getThisProduct = async (req, res) => {
    const {id} = req.params;
    console.log(id, 'passei no get?');
    try {
        const list = await db.query(`
        SELECT products.id, products.name AS "product", products.description, 
        products."mainPhoto", products.value,
        users.name, users.email, users."phoneNumber" FROM products 
        JOIN users ON users.id = products."userId"
        WHERE products.id = $1
        LIMIT 1
        ;
        `, [id]);
        res.send(list.rows[0]);
    } catch (error) {
        res.status(500).send(error.message);
    }
}

export const getHeaderOptions = async (req, res) => {
    try {
        const list = await db.query(`
        SELECT category.id, category.name FROM sector2
        JOIN sector1 ON sector2."categoryId" = sector1."categoryId"
        JOIN category ON sector1."categoryId" = category.id
        ;
        `, );
        res.send(list.rows);
    } catch (error) {
        res.status(500).send(error.message);
    }
}

export const getMyAds = async (req, res) => {
    const{userId} = res.locals;
    console.log(res.locals)
    try {
        const list = await db.query(`
        SELECT prod.name, prod."mainPhoto", prod.value, prod.id, cat.name AS category
        FROM products AS prod
        JOIN "productCategory" AS "proCat" ON prod.id = "proCat"."productId"
        JOIN category AS cat ON "proCat"."categoryId" = cat.id
        WHERE prod."userId" = $1
        ;
        `,[userId]);
        res.send(list.rows);
    } catch (error) {
        res.status(500).send(error.message);
    }
}

// export const insertNewProduct = async (req, res) => {
//     const{userId} = res.locals;
//     console.log(res.locals)
//     try {
//         const response = await db.query(`
        
//         ;
//         `,[userId]);
//         res.send(response.rows);
//     } catch (error) {
//         res.status(500).send(error.message);
//     }
// }

export const getAllCategorys = async (req, res) => {
    try {
        const header = await db.query(`
        SELECT category.id, category.name FROM sector2
        JOIN sector1 ON sector2."categoryId" = sector1."categoryId"
        JOIN category ON sector1."categoryId" = category.id
        ;
        `, );
        const subHeader = await db.query(`
        SELECT category.id, category.name FROM sector1
        JOIN category ON sector1."categoryId" = category.id
        ;
        `, );
        const categorys = await db.query(`
        SELECT category.id, category.name FROM category
        ;
        `, );
        res.send({header:header.rows , subHeader:subHeader.rows, categorys:categorys.rows});
    } catch (error) {
        res.status(500).send(error.message);
    }
}
