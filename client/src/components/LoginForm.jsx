import React, { useState } from 'react';
import '../login.css';
import axios from 'axios';

const LoginForm = ({ onShowRegister, setRegistrado, setIdUser }) => {
    const [formData, setFormData] = useState({
        correo: '',
        contraseña: ''
    });

    const handleChange = (e) => {
        setFormData({
            ...formData,
            [e.target.name]: e.target.value
        });
    };

    const handleSubmit = async (e) => {
        e.preventDefault();

        // Validación básica
        if (!formData.correo || !formData.contraseña) {
            alert('Por favor, completa todos los campos.');
            return;
        }

        try {
            const response = await axios.post('http://localhost:3001/login', formData);

            if (response.data.success) {
                alert(`¡Bienvenido ${response.data.user}!`);
                setIdUser(response.data.id);
                setRegistrado(true);
                localStorage.setItem('userId', response.data.id); 
            } else {
                alert('Credenciales incorrectas');
            }
            
            
        } catch (error) {
            console.error(error);
            alert('Error al iniciar sesión');
        }
    };

    return (
        <div className="form-card animate__animated animate__fadeIn" id="login-card">
            <div className="form-image-section">
                <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/International_Pok%C3%A9mon_logo.svg/2560px-International_Pok%C3%A9mon_logo.svg.png"
                    alt="Pokémon Logo" className="pokemon-logo" />

                <h2>¡Bienvenido de vuelta, Entrenador!</h2>
                <p>Inicia sesión para continuar tu aventura Pokémon</p>
            </div>
            <div className="form-content">
                <h2 className="form-title">Iniciar Sesión</h2>
                <p className="form-subtitle">Ingresa tus credenciales para acceder a tu cuenta</p>

                <form id="login-form" onSubmit={handleSubmit}>
                    <div className="form-group">
                        <label htmlFor="login-email" className="form-label">Correo electrónico</label>
                        <input 
                            type="email" 
                            className="form-control" 
                            id="login-email" 
                            name="correo"
                            value={formData.correo}
                            onChange={handleChange}
                            placeholder="tucorreo@ejemplo.com"
                            required 
                        />
                    </div>

                    <div className="form-group">
                        <label htmlFor="login-password" className="form-label">Contraseña</label>
                        <input 
                            type="password" 
                            className="form-control" 
                            id="login-password" 
                            name="contraseña"
                            value={formData.contraseña}
                            onChange={handleChange}
                            placeholder="••••••••"
                            required 
                        />
                    </div>

                    <div className="form-group">
                        <button type="submit" className="btn-pokemon mt-4">Ingresar</button>
                    </div>

                    <div className="form-footer mt-2">
                        ¿No tienes una cuenta? <span className="toggle-form" onClick={onShowRegister}>Regístrate aquí</span>
                    </div>
                </form>
            </div>
        </div>
    );
};

export default LoginForm;
