CREATE TABLE documentos (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  ruta_archivo TEXT,
  num_chunks INTEGER,
  fecha_procesado TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_documentos_nombre 
ON documentos(nombre);

CREATE TABLE consultas_rag (
  id SERIAL PRIMARY KEY,
  pregunta TEXT NOT NULL,
  respuesta TEXT NOT NULL,
  documentos_usados TEXT[],
  timestamp TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_consultas_timestamp 
ON consultas_rag(timestamp DESC);

CREATE TABLE conversaciones_chatbot (
  id SERIAL PRIMARY KEY,
  mensaje_usuario TEXT,
  respuesta_bot TEXT,
  herramienta_usada VARCHAR(100),
  timestamp TIMESTAMP DEFAULT NOW()
);