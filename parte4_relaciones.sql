CREATE TABLE proyectos (
    id SERIAL PRIMARY KEY, 
    nombre VARCHAR(100) NOT NULL, 
    dias_estimados INTEGER NOT NULL CHECK (dias_estimados > 0) 
);

CREATE TABLE tecnologias (
    id SERIAL PRIMARY KEY, 
    nombre VARCHAR(50) NOT NULL, 
    categoria VARCHAR(30) NOT NULL 
);

CREATE TABLE proyectos_tecnologias (
    id_proyecto INTEGER,
    id_tecnologia INTEGER,

    PRIMARY KEY (id_proyecto, id_tecnologia),
    CONSTRAINT fk_proyecto FOREIGN KEY (id_proyecto) 
        REFERENCES proyectos(id) ON DELETE CASCADE,

    CONSTRAINT fk_tecnologia FOREIGN KEY (id_tecnologia) 
        REFERENCES tecnologias(id) ON DELETE CASCADE
);
--tecnologias por proyecto
SELECT t.nombre, t.categoria
FROM tecnologias t
JOIN proyectos_tecnologias pt ON t.id = pt.id_tecnologia
JOIN proyectos p ON p.id = pt.id_proyecto
WHERE p.nombre = 'MindBoost';
--insert de prueba
INSERT INTO proyectos (nombre, dias_estimados) VALUES 
('MindBoost', 90),
('Crowdfunding System', 60),
('Detective Horror Game', 120);

--proyectos por tecnologia
SELECT p.nombre, p.dias_estimados
FROM proyectos p
JOIN proyectos_tecnologias pt ON p.id = pt.id_proyecto
WHERE pt.id_tecnologia = 2;
--insert de prueba
INSERT INTO tecnologias (nombre, categoria) VALUES 
('Java', 'Backend'),
('PostgreSQL', 'Base de Datos'),
('React', 'Frontend');

--reporte de uso tecnologico
SELECT t.nombre AS tecnologia, COUNT(pt.id_proyecto) AS total_proyectos
FROM tecnologias t
LEFT JOIN proyectos_tecnologias pt ON t.id = pt.id_tecnologia
GROUP BY t.id, t.nombre
ORDER BY total_proyectos DESC;
--insert de prueba
INSERT INTO proyectos_tecnologias (id_proyecto, id_tecnologia) VALUES 
(1, 1), 
(1, 2), 
(2, 2), 
(3, 1); 