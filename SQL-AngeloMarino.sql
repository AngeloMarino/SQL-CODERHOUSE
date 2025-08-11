-- Creamoos la base de datos
create database if not exists coderhouse;
use coderhouse
-- Creamos tabla ALUMNOS
CREATE TABLE alumnos (
    id_alumno INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(90) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    dni INT UNIQUE NOT NULL,
    telefono VARCHAR(20) UNIQUE DEFAULT NULL,
    nacionalidad VARCHAR(30) DEFAULT 'Argentina'
);

-- Creamos tabla CURSOS
CREATE TABLE cursos (
    id_curso INT PRIMARY KEY AUTO_INCREMENT,
    nombre_curso VARCHAR(100) NOT NULL,
    descripcion TEXT,
    duracion INT, -- semanas
    costo DECIMAL(10,2)
);

-- Creamos tabla PROFESORES
CREATE TABLE profesores (
    id_profesor INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(90) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL
);

-- Creamos tabla INSCRIPCIONES
CREATE TABLE inscripciones (
    id_inscripcion INT PRIMARY KEY AUTO_INCREMENT,
    id_alumno INT NOT NULL,
    id_curso INT NOT NULL,
    fecha_inscripcion DATE NOT NULL,
    estado ENUM('activo','finalizado','cancelado') DEFAULT 'activo',
    FOREIGN KEY (id_alumno) REFERENCES alumnos(id_alumno),
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);

-- Creamos tabla PAGOS
CREATE TABLE pagos (
    id_pago INT PRIMARY KEY AUTO_INCREMENT,
    id_inscripcion INT NOT NULL,
    monto DECIMAL(10,2) NOT NULL,
    fecha_pago DATE NOT NULL,
    forma_pago ENUM('tarjeta','transferencia','efectivo') NOT NULL,
    FOREIGN KEY (id_inscripcion) REFERENCES inscripciones(id_inscripcion)
);

-- Creamos tabla EVALUACIONES
CREATE TABLE evaluaciones (
    id_evaluacion INT PRIMARY KEY AUTO_INCREMENT,
    id_inscripcion INT NOT NULL,
    tipo_evaluacion ENUM('examen','proyecto','tarea') NOT NULL,
    fecha DATE NOT NULL,
    FOREIGN KEY (id_inscripcion) REFERENCES inscripciones(id_inscripcion)
);

-- Insertamos valores para tabla alumnos
INSERT INTO alumnos (nombre, apellido, email, dni, telefono, nacionalidad) VALUES
('Agustin', 'Martinez', 'agustin.martinez@example.com', 41122334, '3511234567', 'Argentina'),
('Valeria', 'Suarez', 'valeria.suarez@example.com', 40234567, NULL, 'Chile'),
('Tomas', 'Rios', 'tomas.rios@example.com', 39567891, '3512345678', 'Peru'),
('Micaela', 'Dominguez', 'micaela.dominguez@example.com', 42789123, NULL, 'Paraguay'),
('Ezequiel', 'Paz', 'ezequiel.paz@example.com', 41928374, '3513456789', 'Uruguay'),
('Julieta', 'Figueroa', 'julieta.figueroa@example.com', 43789012, NULL, 'Argentina'),
('Nicolas', 'Herrera', 'nicolas.herrera@example.com', 40192837, '3514567890', 'Bolivia'),
('Florencia', 'Mendoza', 'florencia.mendoza@example.com', 39384756, NULL, 'Argentina'),
('Sebastian', 'Cruz', 'sebastian.cruz@example.com', 42567890, '3515678901', 'Chile'),
('Camilo', 'Navarro', 'camilo.navarro@example.com', 41837465, NULL, 'Peru');

-- Insertamos valores para tabla cursos
INSERT INTO cursos (nombre_curso, descripcion, duracion, costo) VALUES
('Python Básico', 'Introducción a Python desde cero', 8, 15000.00),
('SQL Intermedio', 'Consultas, joins y optimización', 6, 12000.00),
('JavaScript Frontend', 'Fundamentos y DOM', 10, 18000.00),
('Java POO', 'Programación Orientada a Objetos en Java', 12, 20000.00),
('Data Science', 'Análisis de datos con Python', 14, 25000.00),
('Machine Learning', 'Modelos supervisados y no supervisados', 16, 30000.00),
('Power BI', 'Visualización de datos y dashboards', 6, 14000.00),
('Excel Avanzado', 'Macros y automatizaciones', 5, 10000.00),
('Desarrollo Web', 'HTML, CSS y JavaScript', 12, 19000.00),
('Docker y DevOps', 'Contenedores y CI/CD', 8, 22000.00);

-- Insertamos valores para tabla profesores
INSERT INTO profesores (nombre, apellido, email) VALUES
('Carlos', 'Fernandez', 'carlos.fernandez@example.com'),
('Laura', 'Gomez', 'laura.gomez@example.com'),
('Martin', 'Perez', 'martin.perez@example.com'),
('Paula', 'Diaz', 'paula.diaz@example.com'),
('Jorge', 'Morales', 'jorge.morales@example.com'),
('Lucia', 'Campos', 'lucia.campos@example.com'),
('Andres', 'Sosa', 'andres.sosa@example.com'),
('Romina', 'Castro', 'romina.castro@example.com'),
('Federico', 'Mendez', 'federico.mendez@example.com'),
('Cecilia', 'Vega', 'cecilia.vega@example.com');

-- Insertamos valores para tabla inscripciones
INSERT INTO inscripciones (id_alumno, id_curso, fecha_inscripcion, estado) VALUES
(1, 1, '2025-01-10', 'activo'),
(2, 2, '2025-01-12', 'activo'),
(3, 3, '2025-01-15', 'finalizado'),
(4, 4, '2025-01-18', 'activo'),
(5, 5, '2025-01-20', 'cancelado'),
(6, 6, '2025-01-25', 'activo'),
(7, 7, '2025-01-28', 'activo'),
(8, 8, '2025-02-01', 'activo'),
(9, 9, '2025-02-05', 'finalizado'),
(10, 10, '2025-02-10', 'activo');

-- Insertamos valores para tabla pagos
INSERT INTO pagos (id_inscripcion, monto, fecha_pago, forma_pago) VALUES
(1, 15000.00, '2025-01-11', 'tarjeta'),
(2, 12000.00, '2025-01-13', 'transferencia'),
(3, 18000.00, '2025-01-16', 'efectivo'),
(4, 20000.00, '2025-01-19', 'tarjeta'),
(5, 25000.00, '2025-01-21', 'transferencia'),
(6, 30000.00, '2025-01-26', 'efectivo'),
(7, 14000.00, '2025-01-29', 'tarjeta'),
(8, 10000.00, '2025-02-02', 'transferencia'),
(9, 19000.00, '2025-02-06', 'efectivo'),
(10, 22000.00, '2025-02-11', 'tarjeta');

-- Insertamos valores para tabla evaluaciones
INSERT INTO evaluaciones (id_inscripcion, tipo_evaluacion, fecha) VALUES
(1, 'examen', '2025-02-20'),
(2, 'proyecto', '2025-02-22'),
(3, 'tarea', '2025-02-24'),
(4, 'examen', '2025-02-26'),
(5, 'proyecto', '2025-02-28'),
(6, 'tarea', '2025-03-02'),
(7, 'examen', '2025-03-04'),
(8, 'proyecto', '2025-03-06'),
(9, 'tarea', '2025-03-08'),
(10, 'examen', '2025-03-10');


