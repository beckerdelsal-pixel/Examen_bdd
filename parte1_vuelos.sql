--creacion de tabla
CREATE TABLE vuelos (
    codigo_id SERIAL PRIMARY KEY, -- Identificador único autoincremental
    codigo VARCHAR(10) NOT NULL UNIQUE, -- Código identificador del vuelo
    precio_boleto NUMERIC(10,2) NOT NULL CHECK (precio_boleto >= 0), -- Costo individual
    asientos_disponibles INTEGER NOT NULL CHECK (asientos_disponibles >= 0) -- Asientos vacíos
);

--creacion de inserts
INSERT INTO vuelos (codigo, precio_boleto, asientos_disponibles) VALUES 
('AA-123', 250.50, 4),
('LA-456', 120.00, 45),
('EQ-789', 85.00, 0),
('AV-101', 310.99, 12),
('CM-202', 450.00, 2),
('IB-303', 899.99, 120),
('AF-404', 950.50, 0),
('AM-505', 180.25, 60),
('AR-606', 210.00, 3),
('JA-707', 95.00, 85),
('G3-808', 140.00, 1),
('B6-909', 199.99, 50),
('NK-111', 75.50, 110),
('WN-222', 115.00, 0),
('DL-333', 280.00, 35),
('UA-444', 320.00, 15),
('LH-555', 1050.00, 8),
('QR-666', 1450.00, 24),
('EK-777', 1600.00, 0),
('WY-888', 620.00, 19);

--creacion de consultas
SELECT * FROM vuelos 
WHERE asientos_disponibles < 5;

UPDATE vuelos 
SET precio_boleto = precio_boleto * 1.15 
WHERE codigo_id = 2;

DELETE FROM vuelos 
WHERE asientos_disponibles = 0;

drop table vuelos

select * from vuelos

ALTER TABLE vuelos ADD COLUMN destino VARCHAR(100);

UPDATE vuelos SET destino = 'Quito' WHERE destino IS NULL;