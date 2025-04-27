import express from "express";
import cors from "cors";
import db from './database/db.js'

const app = express();
app.use(express.json());
app.use(cors());

app.post('/pokemones', (req, res) => {

    const favoritos= req.body.favoritos;

    let sql = `SELECT 
    p.img,
    p.nombre,
    p.numero_pokedex,
    
    t1.nombre AS tipo1_nombre,
    t1.color AS tipo1_color,
    
    t2.nombre AS tipo2_nombre,
    t2.color AS tipo2_color,
    
    p.peso,
    p.altura,
    p.poder,
    p.favorito

    FROM Pokemones p
    JOIN Tipos t1 ON p.tipo1 = t1.id
    LEFT JOIN Tipos t2 ON p.tipo2 = t2.id`;

    if (favoritos) {
        sql += " WHERE p.favorito=1";
    }

    try {
        db.query(sql, (err, result) => {
            if (err) {
                console.log(err);
            } else {
                res.status(201).send(result)
            }
        })
    } catch (error) {
        console.log(error);
    }

})



app.post('/pokemonesPorNombre', (req, res) => {
    const { nombre, favoritos } = req.body;

    let sql = `SELECT 
        p.img,
        p.nombre,
        p.numero_pokedex,
        t1.nombre AS tipo1_nombre,
        t1.color AS tipo1_color,
        t2.nombre AS tipo2_nombre,
        t2.color AS tipo2_color,
        p.peso,
        p.altura,
        p.poder,
        p.favorito
    FROM Pokemones p
    JOIN Tipos t1 ON p.tipo1 = t1.id
    LEFT JOIN Tipos t2 ON p.tipo2 = t2.id
    WHERE p.nombre LIKE ?`;

    if (favoritos) {
        sql += " AND p.favorito=1";
    }

    try {
        db.query(sql, [`%${nombre}%`], (err, result) => {
            if (err) {
                console.log(err);
                res.status(500).send('Error en la base de datos');
            } else {
                res.status(200).send(result);
            }
        });
    } catch (error) {
        console.log(error);
        res.status(500).send('Error en el servidor');
    }
});


app.post('/pokemonModal', (req, res) => {
    const { numero_pokedex } = req.body;

    const sql = `
        SELECT 
    p.*,
    t1.nombre AS tipo1_nombre,
    t1.color AS tipo1_color,
    t2.nombre AS tipo2_nombre,
    t2.color AS tipo2_color,
    evo1.numero_pokedex AS evo1_numero,  -- Número de Pokédex de la primera evolución
    evo1.nombre AS evo1_nombre,
    evo1.img AS evo1_img,
    evo2.numero_pokedex AS evo2_numero,  -- Número de Pokédex de la segunda evolución
    evo2.nombre AS evo2_nombre,
    evo2.img AS evo2_img
FROM Pokemones p
JOIN Tipos t1 ON p.tipo1 = t1.id
LEFT JOIN Tipos t2 ON p.tipo2 = t2.id
LEFT JOIN Pokemones evo1 ON p.num_evo1 = evo1.numero_pokedex
LEFT JOIN Pokemones evo2 ON p.num_evo2 = evo2.numero_pokedex
WHERE p.numero_pokedex = ?;
    `;

    db.query(sql, [numero_pokedex], (err, result) => {
        if (err) {
            console.error(err);
            return res.status(500).send('Error en la base de datos');
        }

        if (result.length === 0) {
            return res.status(404).send('Pokémon no encontrado');
        }

        res.status(200).send(result[0]);
    });
});




// Endpoint para actualizar favorito
app.post('/actualizar-favorito', (req, res) => {
    const { pokemonId, esFavorito } = req.body;
    
    const sql = 'UPDATE Pokemones SET favorito = ? WHERE numero_pokedex = ?';
    
    db.query(sql, [esFavorito ? 1 : 0, pokemonId], (err, result) => {
        if (err) {
            console.log(err);
            res.status(500).send('Error al actualizar favorito');
        } else {
            res.status(200).send({ success: true });
        }
    });
});


app.post('/pokemonFiltro', (req, res) => {

    const favoritos= req.body.favoritos;
    const tipo= req.body.tipo;

    let sql = `SELECT 
    p.img,
    p.nombre,
    p.numero_pokedex,
    
    t1.nombre AS tipo1_nombre,
    t1.color AS tipo1_color,
    
    t2.nombre AS tipo2_nombre,
    t2.color AS tipo2_color,
    
    p.peso,
    p.altura,
    p.poder,
    p.favorito

    FROM Pokemones p
    JOIN Tipos t1 ON p.tipo1 = t1.id
    LEFT JOIN Tipos t2 ON p.tipo2 = t2.id`;

    if (tipo) {
       if (tipo!==19) {
        sql += " WHERE (p.tipo1=? OR p.tipo2=?)";
       }
    }

    if (favoritos) {
        sql += " AND p.favorito =1";
    }

    try {
        db.query(sql, [tipo, tipo], (err, result) => {
            if (err) {
                console.log(err);
            } else {
                res.status(201).send(result)
            }
        })
    } catch (error) {
        console.log(error);
    }

})



app.listen(3001, () => {
    console.log("Servidor escuchando en el puerto 3001");
});