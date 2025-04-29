import React, { useState } from 'react';
import '../login.css';
import axios from 'axios';

const RegisterForm = ({ onShowLogin }) => {
    const [selectedGender, setSelectedGender] = useState('male');
    const [formData, setFormData] = useState({
        user: '',
        correo: '',
        contraseña: '',
        skin: '7' // Valor por defecto (avatar genérico)
    });
    const [error, setError] = useState('');

    const validateEmail = (email) => {
        const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return re.test(email);
    };

    const selectGender = (gender) => {
        setSelectedGender(gender);
        // Resetear la selección de avatar al cambiar género
        setFormData(prev => ({ ...prev, skin: gender === 'male' ? '1' : gender === 'female' ? '4' : '7' }));
    };

    const selectAvatar = (value) => {
        setFormData(prev => ({ ...prev, skin: value }));
    };

    const handleChange = (e) => {
        setFormData({
            ...formData,
            [e.target.name]: e.target.value
        });
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        setError('');

        // Validaciones
        if (!formData.user || !formData.correo || !formData.contraseña) {
            setError('Por favor complete todos los campos');
            return;
        }

        if (!validateEmail(formData.correo)) {
            setError('Por favor ingrese un correo electrónico válido');
            return;
        }

        if (formData.contraseña.length < 6) {
            setError('La contraseña debe tener al menos 6 caracteres');
            return;
        }

        try {
            const response = await axios.post('http://localhost:3001/register', formData);
            
            if (response.data.success) {
                alert('¡Registro exitoso! Ahora puedes iniciar sesión');
                onShowLogin();
            }
        } catch (error) {
            if (error.response) {
                setError(error.response.data.message || 'Error al registrar');
            } else {
                setError('Error de conexión. Por favor intente nuevamente');
            }
            console.error('Error:', error);
        }
    };

    return (
        <div className="form-card animate__animated animate__fadeIn" id="register-card">
            <div className="form-image-section">
                <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/International_Pok%C3%A9mon_logo.svg/2560px-International_Pok%C3%A9mon_logo.svg.png"
                    alt="Pokémon Logo" className="pokemon-logo" />
                <h2>¡Conviértete en Entrenador!</h2>
                <p>Regístrate para comenzar tu aventura Pokémon</p>
            </div>

            <div className="form-content">
                <h2 className="form-title">Crear Cuenta</h2>
                <p className="form-subtitle">Completa el formulario para unirte a nuestra comunidad</p>

                {error && <div className="alert alert-danger">{error}</div>}

                <form id="register-form" onSubmit={handleSubmit}>
                    <div className="form-group">
                        <label htmlFor="register-username" className="form-label">Nombre de usuario</label>
                        <input 
                            type="text" 
                            name="user" 
                            value={formData.user}
                            onChange={handleChange}
                            className="form-control" 
                            id="register-username" 
                            placeholder="AshKetchum" 
                            required 
                        />
                    </div>

                    <div className="form-group">
                        <label htmlFor="register-email" className="form-label">Correo electrónico</label>
                        <input 
                            type="email" 
                            name="correo" 
                            value={formData.correo}
                            onChange={handleChange}
                            className="form-control" 
                            id="register-email" 
                            placeholder="tucorreo@ejemplo.com" 
                            required 
                        />
                    </div>

                    <div className="form-group">
                        <label htmlFor="register-password" className="form-label">Contraseña</label>
                        <input 
                            type="password" 
                            name="contraseña" 
                            value={formData.contraseña}
                            onChange={handleChange}
                            className="form-control" 
                            id="register-password" 
                            placeholder="••••••••" 
                            minLength="6"
                            required 
                        />
                    </div>

                    <div className="form-group">
                        <label className="form-label">Género</label>
                        <div className="gender-selection">
                            <div 
                                className={`gender-option ${selectedGender === 'male' ? 'selected' : ''}`} 
                                onClick={() => selectGender('male')}
                            >
                                <input type="radio" name="gender" value="male" checked={selectedGender === 'male'} hidden />
                                <label>Hombre</label>
                            </div>
                            <div 
                                className={`gender-option ${selectedGender === 'female' ? 'selected' : ''}`} 
                                onClick={() => selectGender('female')}
                            >
                                <input type="radio" name="gender" value="female" hidden />
                                <label>Mujer</label>
                            </div>
                            <div 
                                className={`gender-option ${selectedGender === 'undefined' ? 'selected' : ''}`} 
                                onClick={() => selectGender('undefined')}
                            >
                                <input type="radio" name="gender" value="undefined" hidden />
                                <label>Otro</label>
                            </div>
                        </div>
                    </div>

                    {/* Male Avatars */}
                    <div className="avatar-section" style={{ display: selectedGender === 'male' ? 'block' : 'none' }}>
                        <div className="avatar-title">Elige tu avatar</div>
                        <div className="avatar-grid">
                            {[1, 2, 3].map(num => (
                                <div 
                                    key={`male${num}`}
                                    className={`avatar-option ${formData.skin === String(num) ? 'selected' : ''}`}
                                    onClick={() => selectAvatar(String(num))}
                                >
                                    <img 
                                        src={`./assets/personaje${num}.png`}
                                        alt={`Avatar Masculino ${num}`}
                                    />
                                    <input 
                                        type="radio" 
                                        name="avatar" 
                                        value={`male${num}`} 
                                        checked={formData.skin === String(num)}
                                        hidden 
                                    />
                                </div>
                            ))}
                        </div>
                    </div>

                    {/* Female Avatars */}
                    <div className="avatar-section" style={{ display: selectedGender === 'female' ? 'block' : 'none' }}>
                        <div className="avatar-title">Elige tu avatar</div>
                        <div className="avatar-grid">
                            {[4, 5, 6].map(num => (
                                <div 
                                    key={`female${num}`}
                                    className={`avatar-option ${formData.skin === String(num) ? 'selected' : ''}`}
                                    onClick={() => selectAvatar(String(num))}
                                >
                                    <img 
                                        src={`./assets/personaje${num}.png`}
                                        alt={`Avatar Femenino ${num}`}
                                    />
                                    <input 
                                        type="radio" 
                                        name="avatar" 
                                        value={`female${num}`} 
                                        checked={formData.skin === String(num)}
                                        hidden 
                                    />
                                </div>
                            ))}
                        </div>
                    </div>

                    {/* Default Avatar */}
                    <div className="avatar-section" style={{ display: selectedGender === 'undefined' ? 'block' : 'none' }}>
                        <div className="avatar-title">Tu avatar</div>
                        <div 
                            className={`default-avatar ${formData.skin === '7' ? 'selected' : ''}`}
                            onClick={() => selectAvatar('7')}
                        >
                            <img src="./assets/personaje7.png" alt="Avatar Genérico" />
                            <input type="hidden" name="avatar" value="7" />
                        </div>
                    </div>

                    <div className="form-group mt-4">
                        <button type="submit" className="btn-pokemon">
                            Registrarse
                        </button>
                    </div>

                    <div className="form-footer mt-2">
                        ¿Ya tienes una cuenta? <span className="toggle-form" onClick={onShowLogin}>Inicia sesión aquí</span>
                    </div>
                </form>
            </div>
        </div>
    );
};

export default RegisterForm;