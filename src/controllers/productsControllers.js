import dayjs from "dayjs";
import { db } from "../database/databaseConnection.js";

export const getProductsHome = async (req, res) => {
    try {
        const list = await db.query(`
            SELECT
                p.id,
                p.name,
                p.value,
                c.name AS category,
                (SELECT url FROM photos ph WHERE ph."productId" = p.id ORDER BY ph.id LIMIT 1) AS "photo"
            FROM
                products p
            JOIN
                "productCategory" pc ON p.id = pc."productId"
            JOIN
                category c ON pc."categoryId" = c.id
            ORDER BY
                p.id;
        `);
        res.send(list.rows);
    } catch (error) {
        res.status(500).send(error.message);
    }
}

export const getSectorProducts = async (req, res) => {
    const { sectorPage } = req.params;
    try {
        const list = await db.query(`
            SELECT
                p.id ,
                p.name ,
                p.value ,
                c.name  category,
                s2.name AS sector2_name,
                ph.url AS photo
            FROM
                products p
            JOIN
                "productCategory" pc ON p.id = pc."productId"
            JOIN
                category c ON pc."categoryId" = c.id
            JOIN
                "categorySector1" cs1 ON c.id = cs1."categoryId"
            JOIN
                sector1 s1 ON cs1.sector1id = s1.id
            JOIN
                sector1sector2 s1s2 ON s1.id = s1s2.sector1id
            JOIN
                sector2 s2 ON s1s2.sector2id = s2.id
            LEFT JOIN LATERAL (
                SELECT url
                FROM photos
                WHERE "productId" = p.id
                ORDER BY id
                LIMIT 1
            ) ph ON true
            WHERE
                s2.name = $1;
    
        `, [sectorPage]);
        res.send(list.rows);
    } catch (error) {
        console.log(error.message);

        res.status(500).send(error.message);
    }
}

export const getThisProduct = async (req, res) => {
    const { id } = req.params;
    try {
        const list = await db.query(`
            SELECT 
                products.id, 
                products.name AS "product", 
                products.description, 
                products.value,
                users.name, 
                users.email, 
                users."phoneNumber",
                ARRAY_AGG(photos.url) AS "photos"
            FROM products 
            JOIN users ON users.id = products."userId"
            LEFT JOIN photos ON products.id = photos."productId"
            WHERE products.id = $1
            GROUP BY products.id, users.name, users.email, users."phoneNumber"
            LIMIT 1;
        ;
        `, [id]);
        res.send(list.rows[0]);
    } catch (error) {
        console.log(error.message)
        res.status(500).send(error.message);
    }
}

export const getHeaderOptions = async (req, res) => {
    try {
        const list = await db.query(`
        SELECT * FROM sector2;
        `,);
        res.send(list.rows);
    } catch (error) {
        console.log(error.message);
        res.status(500).send(error.message);
    }
}

export const getMyAds = async (req, res) => {
    const { userId } = res.locals;
    try {
        const list = await db.query(`
            SELECT
                p.id ,
                p.name ,
                p.value ,
                c.name category,
                s2.name AS sector2_name,
                ph.url photo
            FROM
                products p
            JOIN
                "productCategory" pc ON p.id = pc."productId"
            JOIN
                category c ON pc."categoryId" = c.id
            JOIN
                "categorySector1" cs1 ON c.id = cs1."categoryId"
            JOIN
                sector1 s1 ON cs1.sector1id = s1.id
            JOIN
                sector1sector2 s1s2 ON s1.id = s1s2.sector1id
            JOIN
                sector2 s2 ON s1s2.sector2id = s2.id
            LEFT JOIN LATERAL (
                SELECT url
                FROM photos
                WHERE "productId" = p.id
                ORDER BY id
                LIMIT 1
            ) ph ON true
            WHERE
                p."userId" = $1;

        `, [userId]);
        res.send(list.rows);
    } catch (error) {
        console.log(error.message)
        res.status(500).send(error.message);
    }
}

export const getSector1 = async (req, res) => {
    const { id } = req.params;
    try {
        const response = await db.query(`
            SELECT
                sector1.id,
                sector1.name
            FROM sector1
            JOIN sector1sector2
                ON sector1.id = sector1sector2.sector1id
            JOIN sector2
                ON sector2.id = sector1sector2.sector2id
            WHERE sector2.id = $1;
        `, [id]);
        res.send(response.rows);
    } catch (error) {
        res.status(500).send(error.message);
    }
}

export const getCategory = async (req, res) => {
    const { id } = req.params;
    try {
        const response = await db.query(`
        SELECT category.id, category.name
            FROM category
            JOIN "categorySector1"
                ON category.id = "categorySector1"."categoryId"
            JOIN sector1
                ON "categorySector1".sector1id = sector1.id
            WHERE sector1.id = $1;
        `, [id]);
        res.send(response.rows);
    } catch (error) {
        res.status(500).send(error.message);
    }
}

export const getSector2 = async (req, res) => {
    try {
        const sector2 = await db.query(`
        SELECT * FROM sector2;
        `,);
        res.send(sector2.rows);
    } catch (error) {
        res.status(500).send(error.message);
    }
}

export const insertNewProduct = async (req, res) => {
    console.log(req.body);
    const { form, photos } = req.body;
    const { name, description, value, sector2, sector1, category } = form;
    const { userId } = res.locals;
    const timeNow = dayjs();
    try {
        const productInsert = await db.query(`
            INSERT INTO products (name, description, value, "userId", status, "createdAt") VALUES ($1, $2, $3, $4, $5, $6)
        `, [name, description, value, userId, true, timeNow]);


        const id = await db.query(`
            SELECT id FROM products
            WHERE "userId" = $1 AND "createdAt" = $2;
        `, [userId, timeNow]);
        if (id.rowCount === 0) return (console.log('produto não encontrado'))

        const categoryInsert = await db.query(`
            INSERT INTO "productCategory" ("productId", "categoryId") VALUES ($1, $2)
        `, [id.rows[0].id, category]);

        for (const photoUrl of photos) {
            await db.query(`
                INSERT INTO photos ("productId", url) VALUES ($1, $2)
            `, [id.rows[0].id, photoUrl]);
        }

        res.send('ok');
    } catch (error) {
        console.log(error.message)
        res.status(500).send(error.message);
    }
}
