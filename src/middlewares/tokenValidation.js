import { db } from "../database/databaseConnection.js";

export async function tokenValidation (req, res, next ){
    const {authorization} = req.headers;

    const token = authorization?.replace("Bearer ", "");
    if(!token)return res.status(401).send( 'Usuário não logado!');

    try{
        const response = await db.query(`
            SELECT * FROM sessions WHERE token = $1
        `, [token]);
        if(response.rowCount === 0)return res.status(401).send('Usuárion não permitido!');
        res.locals.userId = response.rows[0].userId;
        next();
    }catch(error){
        res.status(500).send(error.message);
    }
}