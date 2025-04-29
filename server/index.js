import express from "express";
import cors from "cors";
import db from './database/db.js'

const app = express();
app.use(express.json());
app.use(cors());

app.post('/register', (req, res) => {
    const { user, correo, contraseña, skin } = req.body;

    // Primero verificar si el correo ya existe
    const checkEmailSql = `SELECT * FROM usuario WHERE correo = ?`;
    
    db.query(checkEmailSql, [correo], (err, results) => {
        if (err) {
            console.error(err);
            return res.status(500).send({ success: false, message: 'Error al verificar el correo' });
        }

        if (results.length > 0) {
            // El correo ya está registrado
            return res.status(400).send({ 
                success: false, 
                message: 'El correo electrónico ya está en uso' 
            });
        }

        // Si el correo no existe, proceder con el registro
        const insertSql = `
            INSERT INTO usuario (user, correo, contraseña, favoritos, equipo, skin)
            VALUES (?, ?, ?, ?, ?, ?)
        `;

        db.query(insertSql, [user, correo, contraseña, '', '', skin], (err, result) => {
            if (err) {
                console.error(err);
                return res.status(500).send({ success: false, message: 'Error al registrar' });
            }
            console.log("Registro exitoso");
            return res.status(201).send({ 
                success: true, 
                message: 'Usuario registrado exitosamente' 
            });
        });
    });
});



app.post('/login', (req, res) => {
    const { correo, contraseña } = req.body;

    const sql = `SELECT * FROM usuario WHERE correo = ? AND contraseña = ?`;

    db.query(sql, [correo, contraseña], (err, result) => {
        if (err) {
            console.error(err);
            return res.status(500).send({ success: false, message: 'Error en el servidor' });
        }

        if (result.length > 0) {
            // Usuario encontrado
            return res.status(200).send({ success: true, user: result[0].user, id: result[0].id });
        } else {
            // Usuario o contraseña incorrectos
            return res.status(200).send({ success: false, message: 'Correo o contraseña incorrectos' });
        }
    });
});



app.post('/user', (req, res) => {
    const { id } = req.body;

    let sql;
    let params = [];

    if (id) {
        sql = `SELECT * FROM usuario WHERE id = ?`;
        params = [id];
    } else {
        sql = `SELECT * FROM usuario`;
    }

    try {
        db.query(sql, params, (err, result) => {
            if (err) {
                console.error(err);
                return res.status(500).send("Error en la base de datos");
            }
            
            if (id) {
                if (result.length > 0) {
                    res.status(200).send(result[0]); 
                } else {
                    res.status(404).send({ message: "Usuario no encontrado" });
                }
            } else {
                res.status(200).send(result); 
            }
        });
    } catch (error) {
        console.error(error);
        res.status(500).send("Error en el servidor");
    }
});





// Ruta para obtener todos los pokémones o filtrar por favoritos
app.post('/pokemones', (req, res) => {
    const favoritos = req.body.favoritos; // Cadena como "001,005,026"

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
    p.poder
    FROM Pokemones p
    JOIN Tipos t1 ON p.tipo1 = t1.id
    LEFT JOIN Tipos t2 ON p.tipo2 = t2.id`;

    if (favoritos) {
        const favArray = favoritos.split(',');
        sql += ` WHERE p.numero_pokedex IN ('${favArray.join("','")}')`;
    }

    sql += " ORDER BY p.numero_pokedex";

    db.query(sql, (err, result) => {
        if (err) {
            console.error(err);
            return res.status(500).send('Error en la base de datos');
        }
        res.status(200).send(result);
    });
});

// Ruta para buscar pokémones por nombre
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
        p.poder
    FROM Pokemones p
    JOIN Tipos t1 ON p.tipo1 = t1.id
    LEFT JOIN Tipos t2 ON p.tipo2 = t2.id
    WHERE p.nombre LIKE ?`;

    const params = [`%${nombre}%`];

    if (favoritos) {
        const favArray = favoritos.split(',');
        sql += ` AND p.numero_pokedex IN ('${favArray.join("','")}')`;
    }

    sql += " ORDER BY p.numero_pokedex";

    db.query(sql, params, (err, result) => {
        if (err) {
            console.error(err);
            return res.status(500).send('Error en la base de datos');
        }
        res.status(200).send(result);
    });
});


app.post('/pokemonFiltro', (req, res) => {
    const { favoritos, tipo } = req.body;


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
        p.poder
    FROM Pokemones p
    JOIN Tipos t1 ON p.tipo1 = t1.id
    LEFT JOIN Tipos t2 ON p.tipo2 = t2.id`;

    const whereClauses = [];
    const params = [];

    // --- FAVORITOS ---
    let favArray = [];
    if (favoritos && favoritos !== 'false' && favoritos.trim() !== '') {
        favArray = favoritos.split(',');
        whereClauses.push(`p.numero_pokedex IN (${favArray.map(() => '?').join(',')})`);
        params.push(...favArray);
    }

    // --- TIPO ---
    if (tipo && tipo !== 19) { // 19 = "Todos"
        whereClauses.push("(p.tipo1 = ? OR p.tipo2 = ?)");
        params.push(tipo, tipo);
    }

    if (whereClauses.length > 0) {
        sql += " WHERE " + whereClauses.join(" AND ");
    }

    sql += " ORDER BY p.numero_pokedex";

    db.query(sql, params, (err, result) => {
        if (err) {
            console.error(err);
            return res.status(500).send('Error en la base de datos');
        }
  
        res.status(200).send(result);
    });
});




app.post('/userEquipo', (req, res) => {
    const id = req.body.id;

    let sql = `SELECT equipo FROM usuario WHERE id=?`;

    try {
        db.query(sql, [id], (err, result) => {
            if (err) {
                console.log(err);
                return res.status(500).send('Error en la consulta');
            } else {
                const equipoString = result[0].equipo;
                // ejemplo: "001,025,004,007,150"
                const equipoArray = equipoString.split(',');

                // Ahora hacemos la segunda consulta
                const placeholders = equipoArray.map(() => '?').join(',');
                const sql2 = `SELECT numero_pokedex, altura FROM pokemones WHERE numero_pokedex IN (${placeholders}) ORDER BY altura DESC`;

                db.query(sql2, equipoArray, (err2, result2) => {
                    if (err2) {
                        return res.status(500).send('Error obteniendo datos de los pokemones');
                    } else {
                        res.status(200).send(result2); // Te devuelve [{id: '001', altura: X}, ...]
                    }
                });
            }
        });
    } catch (error) {
        console.log(error);
        res.status(500).send('Error interno');
    }
});





app.post('/actuEquipo', (req, res) => {
    const { id, equipo } = req.body;

    let sql = `UPDATE usuario SET equipo = ? WHERE id = ?`;

    db.query(sql, [equipo, id], (err, result) => {
        if (err) {
            console.log(err);
            return res.status(500).json({ error: 'Error en la consulta' });
        }
        
        if (result.affectedRows === 0) {
            return res.status(404).json({ error: 'Usuario no encontrado' });
        }
        
        res.status(200).json({ message: 'Equipo actualizado correctamente' });
    });
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
    const { userId, nuevosFavoritos } = req.body;

    console.log(userId);
    console.log(nuevosFavoritos);
    

    // Validar que userId existe
    if (!userId) {
        return res.status(400).send('ID de usuario requerido');
    }
    
    // Actualizar en la base de datos
    const sql = 'UPDATE usuario SET favoritos = ? WHERE id = ?';
    db.query(sql, [nuevosFavoritos, userId], (err, result) => {
        if (err) {
            console.error(err);
            return res.status(500).send('Error al actualizar favoritos');
        }
        res.status(200).send('Favoritos actualizados correctamente');
    });
});


app.listen(3001, () => {
    console.log("Servidor escuchando en el puerto 3001");
});