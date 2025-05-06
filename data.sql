INSERT INTO Paciente (nombre, fechaNac, sexo, direc, tel, correo) VALUES
('Carlos Fernández', '1983-04-15', 'Masculino', 'Avenida Reforma, Zona 9', '5991-2345', 'carlosf@mail.com'),
('María Gómez', '1972-11-02', 'Femenino', 'Boulevard Vista Hermosa, Zona 15', '5578-9012', 'mariag@mail.com'),
('Luis Pérez', '1990-07-21', 'Masculino', 'Colonia El Maestro, Zona 6', '5555-1122', 'luisp@mail.com'),
('Ana Morales', '1985-02-10', 'Femenino', 'Residenciales del Norte, Zona 17', '5566-7788', 'anam@mail.com'),
('Javier Rodríguez', '1978-09-30', 'Masculino', 'Zona 10, Edificio Las Brisas', '5999-3344', 'javierr@mail.com'),
('Sofía López', '1992-03-19', 'Femenino', 'Zona 11, Colonia Las Victorias', '5901-4433', 'sofial@mail.com'),
('Pedro Castillo', '1967-08-05', 'Masculino', 'Zona 5, Barrio El Gallito', '5912-6677', 'pedroc@mail.com'),
('Laura Jiménez', '1979-06-28', 'Femenino', 'Zona 2, Avenida Independencia', '5923-5544', 'lauraj@mail.com'),
('Andrés Ruiz', '1988-12-03', 'Masculino', 'Zona 13, Aurora II', '5944-7788', 'andresr@mail.com'),
('Valeria Herrera', '1991-05-17', 'Femenino', 'Zona 16, Condado Naranjo', '5955-3344', 'valeriah@mail.com'),
('Roberto Díaz', '1970-01-08', 'Masculino', 'Zona 3, San Antonio', '5966-2211', 'robertod@mail.com'),
('Daniela Palma', '1986-10-26', 'Femenino', 'Mixco, El Milagro', '5977-7788', 'danielap@mail.com'),
('Miguel Ibarra', '1982-02-14', 'Masculino', 'Villa Nueva, Zona Central', '5988-1122', 'migueli@mail.com'),
('Patricia Méndez', '1976-11-11', 'Femenino', 'Zona 6, Colonia El Sauce', '5999-6677', 'patriciam@mail.com'),
('Ernesto Ramírez', '1965-04-04', 'Masculino', 'Zona 14, Edificio Montano', '5933-2244', 'ernestor@mail.com'),
('Gabriela Solís', '1993-08-13', 'Femenino', 'Santa Catarina Pinula', '5910-3300', 'gabrielas@mail.com'),
('Oscar Morales', '1980-06-20', 'Masculino', 'Ciudad San Cristóbal, Zona 8', '5900-1234', 'oscarm@mail.com'),
('Lucía Cáceres', '1989-12-30', 'Femenino', 'Zona 7, Bethania', '5902-8877', 'luciac@mail.com'),
('Héctor Sandoval', '1974-03-18', 'Masculino', 'Zona 1, Centro Histórico', '5931-7890', 'hectors@mail.com'),
('Silvia Torres', '1987-09-07', 'Femenino', 'Zona 18, Los Álamos', '5903-4321', 'silviat@mail.com'),
('Juan García', '1969-05-22', 'Masculino', 'Zona 19, Colonia La Florida', '5940-9988', 'juang@mail.com'),
('Estefanía Ríos', '1984-11-15', 'Femenino', 'Zona 15, Vista Hermosa IV', '5960-2233', 'estefaniar@mail.com'),
('Manuel Campos', '1971-01-29', 'Masculino', 'Zona 4, Condado El Naranjo', '5920-3344', 'manuelc@mail.com'),
('Carmen Aguilar', '1990-07-12', 'Femenino', 'Zona 9, Edificio Florencia', '5970-2233', 'carmena@mail.com'),
('Fernando Véliz', '1977-06-01', 'Masculino', 'Zona 8, Trébol', '5980-1122', 'fernandov@mail.com'),
('Beatriz Martínez', '1981-03-08', 'Femenino', 'San Miguel Petapa', '5990-5566', 'beatriz@mail.com'),
('Ricardo Castañeda', '1966-10-06', 'Masculino', 'Zona 12, Montserrat', '5915-3344', 'ricardoc@mail.com'),
('Alejandra Pinto', '1991-02-02', 'Femenino', 'Zona 6, El Sauce II', '5925-8899', 'alejandrap@mail.com'),
('Mauricio López', '1983-07-04', 'Masculino', 'Zona 11, Roosevelt', '5935-9988', 'mauriciol@mail.com'),
('Flor Gómez', '1975-09-30', 'Femenino', 'Zona 10, Zona Pradera', '5945-2233', 'florg@mail.com');


INSERT INTO Espec (nombre) VALUES 
('Medicina General'),
('Pediatría'),
('Cardiología'),
('Ginecología'),
('Dermatología');

INSERT INTO Medico (nombre, idEspec) VALUES 
('Dra. Ana Juárez', 1),
('Dr. Carlos Méndez', 2),
('Dra. Sofía Chávez', 3),
('Dr. Roberto Lima', 4),
('Dra. Laura Escobar', 5),
('Dr. Jorge Ramírez', 1),
('Dra. Patricia Herrera', 2),
('Dr. Miguel Solórzano', 3),
('Dra. Elena Cruz', 4),
('Dr. Andrés Castillo', 5);

INSERT INTO Cita (idPaciente, idMedico, fecha, hora, motivo) VALUES
(1, 1, '2025-05-10', '08:00', 'Dolor de cabeza'),
(2, 2, '2025-05-11', '09:00', 'Control pediátrico'),
(3, 3, '2025-05-12', '10:00', 'Dolor en el pecho'),
(4, 4, '2025-05-13', '11:00', 'Chequeo ginecológico'),
(5, 5, '2025-05-14', '12:00', 'Erupción en la piel'),
(6, 6, '2025-05-15', '08:30', 'Revisión general'),
(7, 7, '2025-05-16', '09:30', 'Fiebre persistente'),
(8, 8, '2025-05-17', '10:30', 'Presión alta'),
(9, 9, '2025-05-18', '11:30', 'Control prenatal'),
(10, 10, '2025-05-19', '12:30', 'Irritación cutánea');

INSERT INTO Diag (idCita, descDiag) VALUES
(1, 'Migraña leve'),
(2, 'Crecimiento adecuado'),
(3, 'Angina estable'),
(4, 'Chequeo sin anomalías'),
(5, 'Dermatitis alérgica'),
(6, 'Buen estado general'),
(7, 'Infección viral'),
(8, 'Hipertensión controlada'),
(9, 'Embarazo normal'),
(10, 'Irritación leve por contacto');

INSERT INTO Trata (idDiag, descTrata, dias) VALUES
(1, 'Paracetamol cada 8 horas', 5),
(2, 'Vitaminas y control mensual', 30),
(3, 'Aspirina diaria', 15),
(4, 'Revisión anual recomendada', 1),
(5, 'Crema antihistamínica', 7),
(6, 'Descanso y buena alimentación', 3),
(7, 'Antivirales cada 12 horas', 5),
(8, 'Losartán diario', 30),
(9, 'Ácido fólico diario', 30),
(10, 'Pomada para piel', 5);

INSERT INTO Medica (idTrata, nombre, dosis) VALUES
(1, 'Paracetamol', '500mg'),
(2, 'Multivitamínico', '1 tableta'),
(3, 'Aspirina', '100mg'),
(4, 'Ninguno', 'No aplica'),
(5, 'Hidrocortisona', 'Aplicar 2 veces al día'),
(6, 'Ninguno', 'Solo reposo'),
(7, 'Aciclovir', '400mg'),
(8, 'Losartán', '50mg'),
(9, 'Ácido fólico', '1 tableta diaria'),
(10, 'Pomada Eucerin', 'Aplicar cada 8 horas');

INSERT INTO Turno (idMedico, dia, horaIni, horaFin) VALUES
(1, 'Lunes', '08:00', '12:00'),
(2, 'Martes', '09:00', '13:00'),
(3, 'Miércoles', '10:00', '14:00'),
(4, 'Jueves', '11:00', '15:00'),
(5, 'Viernes', '08:30', '12:30');

INSERT INTO Alergias (idPaciente, alergia) VALUES
(1, 'Penicilina'),
(2, 'Aspirina'),
(3, 'Mariscos'),
(4, 'Polvo'),
(5, 'Lácteos');

INSERT INTO logmedica (idlog, idmedica, accion, fecha) VALUES
(1, 1, 'administrado', '2024-05-01'),
(2, 1, 'administrado', '2024-05-05'),
(3, 1, 'administrado', '2024-06-10'),
(4, 1, 'administrado', '2024-07-15'),
(5, 1, 'administrado', '2024-08-01');
