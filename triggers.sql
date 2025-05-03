-- Trigger 1: Evitar que se creen citas en domingo
CREATE OR REPLACE FUNCTION validarDiaCita()
RETURNS TRIGGER AS $$
BEGIN
    IF EXTRACT(DOW FROM NEW.fecha) = 0 THEN
        RAISE EXCEPTION 'No se pueden programar citas en domingo';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trgValidarDiaCita
BEFORE INSERT ON Cita
FOR EACH ROW
EXECUTE FUNCTION validarDiaCita()

-- Trigger 2: Para detectar automáticamente posibles alergias a la penicilina
CREATE OR REPLACE FUNCTION registrarAlergiaPenicilina()
RETURNS TRIGGER AS $$
BEGIN
    IF POSITION('penicilina' IN LOWER(NEW.motivo)) > 0 THEN
        INSERT INTO Alergias (idPaciente, alergia)
        VALUES (NEW.idPaciente, 'Penicilina')
        ON CONFLICT DO NOTHING;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trgRegistrarAlergia
AFTER INSERT ON Cita
FOR EACH ROW
EXECUTE FUNCTION registrarAlergiaPenicilina();

-- Trigger 3: Auditar inserciones en tabla Medica
CREATE TABLE IF NOT EXISTS LogMedica (
    idLog SERIAL PRIMARY KEY,
    idMedica INT,
    accion TEXT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION auditarMedica()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO LogMedica (idMedica, accion)
    VALUES (NEW.idMedica, TG_OP);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trgAuditarMedica
AFTER INSERT ON Medica
FOR EACH ROW
EXECUTE FUNCTION auditarMedica();