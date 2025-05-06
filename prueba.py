from sqlalchemy import create_engine, text

# Reemplaza estos valores con los tuyos
usuario = 'postgres'
contrasena = 'Pablorellana2005'
host = 'localhost'
puerto = '5432'
base_datos = 'clinica_db'  # Cambia por el nombre real de tu base

# URI de conexión
uri = f'postgresql://{usuario}:{contrasena}@{host}:{puerto}/{base_datos}'

try:
    # Conexión
    engine = create_engine(uri)
    with engine.connect() as conn:
        dbname = conn.execute(text("SELECT current_database();")).fetchone()[0]
        tablas = conn.execute(text("SELECT table_name FROM information_schema.tables WHERE table_schema='public';")).fetchall()

    print(f"✅ Conectado correctamente a la base de datos: {dbname}")
    print("📦 Tablas encontradas:")
    for tabla in tablas:
        print(f" - {tabla[0]}")

except Exception as e:
    print("❌ Error al conectar a la base de datos:")
    print(e)
