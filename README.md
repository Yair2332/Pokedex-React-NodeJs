# Pokédex React + Node.js

Una Pokédex desarrollada con React (frontend) y Node.js con Express (backend), usando MySQL para almacenar los datos. Permite explorar información básica de Pokémon obtenida desde una API propia conectada a una base de datos relacional.

## 🧩 Tecnologías utilizadas

- **Frontend**: React
- **Backend**: Node.js + Express
- **Base de datos**: MySQL
- **Comunicación cliente-servidor**: API REST
- **Lenguajes**: JavaScript, HTML, CSS

## 📁 Estructura del proyecto

```
Pokedex-React-NodeJs/
├── client/               # Aplicación React (frontend)
├── server/               # Servidor Node.js con Express (backend)
│   └── database/
│       └── db.js         # Configuración de conexión a MySQL
├── pokedex_db.sql        # Script para crear y poblar la base de datos
└── .gitignore
```

## 🚀 Instalación y ejecución

### 1. Clonar el repositorio

```bash
git clone https://github.com/Yair2332/Pokedex-React-NodeJs.git
cd Pokedex-React-NodeJs
```

### 2. Configurar la base de datos

- Asegúrate de tener MySQL instalado y en funcionamiento.
- Crea una base de datos nueva (por ejemplo, `pokedex_db`).
- Importa el archivo `pokedex_db.sql`:

```bash
mysql -u tu_usuario -p pokedex_db < pokedex_db.sql
```

- Luego edita el archivo `server/database/db.js` para colocar tus datos de conexión:

```js
const db = mysql.createConnection({
  host: 'localhost',
  user: 'TU_USUARIO',
  password: 'TU_CONTRASEÑA',
  database: 'pokedex_db'
});
```

### 3. Iniciar el backend

```bash
cd server
npm install
npm start
```

- El servidor se ejecutará en `http://localhost:3001`.

### 4. Iniciar el frontend

En una nueva terminal:

```bash
cd client
npm install
npm start
```

- La aplicación React se abrirá en `http://localhost:3000`.

## 🧪 Funcionalidades

- Visualización de Pokémon desde la base de datos.
- Consulta de detalles de cada Pokémon.
- Backend con Node.js y Express conectado a MySQL.
- Comunicación entre cliente y servidor vía API REST.

## 📄 Licencia

Este proyecto está bajo la licencia MIT.
