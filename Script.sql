CREATE TABLE Paciente (
  idPaciente SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  fechaNac DATE NOT NULL,
  sexo VARCHAR(10) NOT NULL,
  direc TEXT,
  tel VARCHAR(20),
  correo VARCHAR(100)
);

CREATE TABLE Espec (
  idEspec SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Medico (
  idMedico SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  idEspec INT REFERENCES Espec(idEspec) NOT NULL
);

CREATE TABLE Cita (
  idCita SERIAL PRIMARY KEY,
  idPaciente INT REFERENCES Paciente(idPaciente),
  idMedico INT REFERENCES Medico(idMedico),
  fecha DATE NOT NULL,
  hora TIME NOT NULL,
  motivo TEXT NOT NULL
);

CREATE TABLE Diag (
  idDiag SERIAL PRIMARY KEY,
  idCita INT REFERENCES Cita(idCita),
  descDiag TEXT NOT NULL
);

CREATE TABLE Trata (
  idTrata SERIAL PRIMARY KEY,
  idDiag INT REFERENCES Diag(idDiag),
  descTrata TEXT NOT NULL,
  dias INT CHECK (dias > 0)
);

CREATE TABLE Medica (
  idMedica SERIAL PRIMARY KEY,
  idTrata INT REFERENCES Trata(idTrata),
  nombre VARCHAR(100) NOT NULL,
  dosis VARCHAR(100) NOT NULL
);

CREATE TABLE Alergias (
  idPaciente INT REFERENCES Paciente(idPaciente),
  alergia TEXT NOT NULL,
  PRIMARY KEY (idPaciente, alergia)
);

CREATE TABLE Turno (
  idTurno SERIAL PRIMARY KEY,
  idMedico INT REFERENCES Medico(idMedico),
  dia VARCHAR(10),
  horaIni TIME,
  horaFin TIME
);