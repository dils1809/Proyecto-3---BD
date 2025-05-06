PROYECTO 3 – BASE DE DATOS CLÍNICA

Curso: CC3088 – Bases de Datos 1
Grupo: 3
Integrantes:
- Dilary Cruz
- Pablo Orellana

Descripción
-----------
Este proyecto consiste en el diseño e implementación de una base de datos para la gestión de una clínica médica. Incluye la creación del modelo entidad-relación, scripts SQL para la creación de tablas y triggers, inserción de datos de prueba, y una aplicación web desarrollada con Flask para interactuar con la base de datos.

Estructura del Proyecto
-----------------------
- Modelo-ER.png: Diagrama entidad-relación del sistema.
- Script.sql: Script SQL para la creación de la base de datos y sus tablas.
- data.sql: Inserción de datos de prueba en las tablas.
- triggers.sql: Definición de triggers para mantener la integridad y lógica del negocio.
- app.py: Aplicación web desarrollada con Flask.
- config.py: Configuración de la conexión a la base de datos.
- templates/: Plantillas HTML para la interfaz de usuario.
- requirements.txt: Lista de dependencias necesarias para ejecutar la aplicación.

Tecnologías Utilizadas
-----------------------
- Backend: Python 3, Flask
- Base de Datos: PostgreSQL
- Frontend: HTML, Bootstrap (si se utilizó)
- ORM: SQLAlchemy (si se utilizó)

Instalación y Ejecución
------------------------
1. Clonar el repositorio:
   git clone https://github.com/dils1809/Proyecto-3---BD.git
   cd Proyecto-3---BD

2. Crear y activar un entorno virtual:
   python -m venv venv
   source venv/bin/activate  # En Windows: venv\Scripts\activate

3. Instalar las dependencias:
   pip install -r requirements.txt

4. Configurar la base de datos:
   - Asegúrate de tener PostgreSQL instalado y en funcionamiento.
   - Crea una base de datos nueva para el proyecto.
   - Actualiza el archivo config.py con tus credenciales y el nombre de la base de datos.

5. Ejecutar los scripts SQL:
   - Ejecuta Script.sql para crear las tablas.
   - Ejecuta data.sql para insertar los datos de prueba.
   - Ejecuta triggers.sql para añadir los triggers necesarios.

6. Iniciar la aplicación:
   python app.py
   

Funcionalidades
----------------
- Registro y gestión de pacientes.
- Programación y seguimiento de citas médicas.
- Registro de historiales clínicos.
- Gestión de médicos y sus especialidades.
- Validaciones y restricciones implementadas mediante triggers y constraints en la base de datos.
