# HITO 3: Automatización Inteligente con n8n + Ollama + PostgreSQL + Qdrant

Este proyecto consiste en la implementación de dos sistemas avanzados de IA orquestados mediante workflows visuales, integrando modelos de lenguaje locales, bases de datos vectoriales y relacionales.

---

## 🚀 Descripción del Proyecto

El sistema se divide en dos grandes bloques funcionales que demuestran la versatilidad de los agentes autónomos:

### 1. Sistema RAG Educativo (Proyecto A)

Un sistema de **Generación Aumentada por Recuperación** que permite "chatear" con documentos técnicos.

- **Ingesta:** Procesa archivos (PDF/TXT), los fragmenta y genera embeddings con Ollama para almacenarlos en **Qdrant**.
- **Consulta:** Recupera el contexto más relevante para responder preguntas de forma precisa, evitando alucinaciones del modelo.

### 2. Chatbot Multiherramienta (Proyecto B)

Un asistente capaz de razonar y decidir qué herramienta externa necesita utilizar para responder al usuario.

- **Inteligencia:** Ollama analiza la intención del mensaje.
- **Herramientas:** Conexión en tiempo real con APIs de Clima (OpenMeteo), Geografía (REST Countries), Conocimiento (Wikipedia) y Entretenimiento (JokeAPI).

---

## 🛠️ Stack Tecnológico

| Componente          | Tecnología              | Función                                            |
| ------------------- | ----------------------- | -------------------------------------------------- |
| **Orquestador**     | n8n                     | Diseño de workflows y lógica de negocio.           |
| **Modelos IA**      | Ollama (Mistral/Llama2) | Generación de texto y embeddings locales.          |
| **Vector DB**       | Qdrant                  | Almacenamiento y búsqueda semántica de documentos. |
| **SQL DB**          | PostgreSQL              | Persistencia de metadatos e historial de chats.    |
| **Infraestructura** | Docker Compose          | Orquestación de contenedores y servicios.          |

---

## 📂 Estructura del Repositorio

```bash
hito3-automatizacion/
├── 📂 docker/              # Configuración de contenedores
│   ├── docker-compose.yml
│   └── .env.example        # Plantilla de variables de entorno
├── 📂 n8n/                 # Workflows exportados en JSON
│   └── 📂 workflows/
│       ├── Proyecto1.json
│       └── Proyecto2.json
├── 📂 postgres/            # Scripts de inicialización SQL
│   └── init.sql
├── 📂 tests/               # Pruebas de API (REST Client)
│   └── pruebas.http
├── 📂 docs/                # Documentación y capturas
│   └── DEMO.md
└── README.md

```

---

Tu idea es correcta: si el modelo de Ollama ya no es necesario en el README, conviene eliminar ese paso y añadir claramente cómo **ejecutar el `init.sql` para crear las tablas**. También he ajustado un poco la redacción para que sea más coherente y fácil de seguir.

Aquí tienes una versión limpia y consistente:

## ⚙️ Instalación y Despliegue

Sigue estos pasos para replicar el entorno localmente.

1. **Clonar el repositorio**

```bash
git clone https://github.com/tu-usuario/hito3-automatizacion.git
cd hito3-automatizacion
```

2. **Configurar variables de entorno**

Copia el archivo de ejemplo y edítalo si necesitas cambiar puertos o credenciales.

```bash
cp docker/.env.example docker/.env
```

3. **Levantar los servicios con Docker**

```bash
docker compose up -d
```

Esto iniciará los siguientes servicios:

- PostgreSQL (base de datos)
- Qdrant (base de datos vectorial)
- Ollama (modelo LLM local)
- n8n (motor de automatización)

4. **Inicializar la base de datos**

Para crear las tablas necesarias, ejecuta el script `init.sql` dentro del contenedor de PostgreSQL:

```bash
docker exec -i hito3-postgres psql -U $POSTGRES_USER -d $POSTGRES_DB < postgres/init.sql
```

Este comando ejecutará el script SQL que inicializa la estructura de la base de datos.

5. **Importar los workflows en n8n**

Accede a:

```
http://localhost:5678
```

Crea tu cuenta de administrador e importa los archivos `.json` ubicados en:

```
n8n/workflows/
```

---

## 📊 Base de Datos

El sistema utiliza **PostgreSQL** para mantener la trazabilidad. Las tablas principales son:

- **`documentos`**: Almacena el registro de archivos procesados y su conteo de chunks.
- **`consultas_rag`**: Historial de preguntas, respuestas y fuentes utilizadas.
- **`conversaciones_chatbot`**: Registro de decisiones del agente y logs de conversación.

---

## 🎥 Demostración

Puedes ver el funcionamiento detallado de ambos proyectos, la arquitectura y los workflows en el siguiente enlace:

👉 **https://drive.google.com/file/d/1NBDlqM_Y-aHvF3AXFNCAt-GGVicImX7V/view?usp=sharing**

---
