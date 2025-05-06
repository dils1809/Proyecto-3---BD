from flask import Flask, render_template, request, send_file
from flask_sqlalchemy import SQLAlchemy
from config import Config
from sqlalchemy import text
import pandas as pd
import matplotlib.pyplot as plt
from reportlab.pdfgen import canvas
import io

app = Flask(__name__)
app.config.from_object(Config)
db = SQLAlchemy(app)

def construir_query(fecha_inicio, fecha_fin, medico, especialidad, sexo, edad_min, edad_max):
    edad_min = edad_min or 0
    edad_max = edad_max or 150

    return f"""
    SELECT m.nombre AS medico, e.nombre AS especialidad, COUNT(*) AS cantidad_consultas
    FROM cita c
    JOIN medico m ON c.idmedico = m.idmedico
    JOIN espec e ON m.idespec = e.idespec
    JOIN paciente p ON c.idpaciente = p.idpaciente
    WHERE c.fecha BETWEEN '{fecha_inicio}' AND '{fecha_fin}'
    AND m.nombre ILIKE '%{medico}%'
    AND e.nombre ILIKE '%{especialidad}%'
    AND p.sexo ILIKE '%{sexo}%'
    AND EXTRACT(YEAR FROM AGE(CURRENT_DATE, p.fechanac)) BETWEEN {edad_min} AND {edad_max}
    GROUP BY m.nombre, e.nombre
    ORDER BY cantidad_consultas DESC
    """

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/reporte1', methods=['GET', 'POST'])
def reporte1():
    resultados = []
    if request.method == 'POST':
        fecha_inicio = request.form['fecha_inicio']
        fecha_fin = request.form['fecha_fin']
        medico = request.form['medico']
        especialidad = request.form['especialidad']
        sexo = request.form['sexo']
        edad_min = request.form.get('edad_min')
        edad_max = request.form.get('edad_max')

        query = construir_query(fecha_inicio, fecha_fin, medico, especialidad, sexo, edad_min, edad_max)
        resultados = db.session.execute(text(query)).fetchall()

    return render_template('reporte1.html', resultados=resultados)

@app.route('/reporte1/excel', methods=['POST'])
def exportar_excel():
    fecha_inicio = request.form['fecha_inicio']
    fecha_fin = request.form['fecha_fin']
    medico = request.form['medico']
    especialidad = request.form['especialidad']
    sexo = request.form['sexo']
    edad_min = request.form.get('edad_min')
    edad_max = request.form.get('edad_max')

    query = construir_query(fecha_inicio, fecha_fin, medico, especialidad, sexo, edad_min, edad_max)
    conn = db.engine.connect()
    df = pd.read_sql(query, conn)
    conn.close()

    output = io.BytesIO()
    df.to_excel(output, index=False)
    output.seek(0)
    return send_file(output, download_name="reporte_consultas.xlsx", as_attachment=True)

@app.route('/reporte1/pdf', methods=['POST'])
def exportar_pdf():
    fecha_inicio = request.form['fecha_inicio']
    fecha_fin = request.form['fecha_fin']
    medico = request.form['medico']
    especialidad = request.form['especialidad']
    sexo = request.form['sexo']
    edad_min = request.form.get('edad_min')
    edad_max = request.form.get('edad_max')

    query = construir_query(fecha_inicio, fecha_fin, medico, especialidad, sexo, edad_min, edad_max)
    conn = db.engine.connect()
    resultados = conn.execute(text(query)).fetchall()

    output = io.BytesIO()
    p = canvas.Canvas(output)
    p.setFont("Helvetica-Bold", 14)
    p.drawString(100, 800, "Reporte de Consultas por Médico")
    p.setFont("Helvetica", 10)
    y = 760

    if resultados:
        for row in resultados:
            p.drawString(80, y, f"{row.medico} - {row.especialidad} - {row.cantidad_consultas}")
            y -= 20
            if y < 50:
                p.showPage()
                y = 800
    else:
        p.drawString(100, y, "No se encontraron resultados.")

    p.save()
    output.seek(0)
    return send_file(output, download_name="reporte_consultas.pdf", as_attachment=True)

@app.route('/reporte1/grafica', methods=['POST'])
def reporte_grafica():
    fecha_inicio = request.form['fecha_inicio']
    fecha_fin = request.form['fecha_fin']
    medico = request.form['medico']
    especialidad = request.form['especialidad']
    sexo = request.form['sexo']
    edad_min = request.form.get('edad_min')
    edad_max = request.form.get('edad_max')

    # Usamos solo médico y cantidad para la gráfica
    edad_min = edad_min or 0
    edad_max = edad_max or 150

    query = f"""
    SELECT m.nombre AS medico, COUNT(*) AS cantidad_consultas
    FROM cita c
    JOIN medico m ON c.idmedico = m.idmedico
    JOIN espec e ON m.idespec = e.idespec
    JOIN paciente p ON c.idpaciente = p.idpaciente
    WHERE c.fecha BETWEEN '{fecha_inicio}' AND '{fecha_fin}'
    AND m.nombre ILIKE '%{medico}%'
    AND e.nombre ILIKE '%{especialidad}%'
    AND p.sexo ILIKE '%{sexo}%'
    AND EXTRACT(YEAR FROM AGE(CURRENT_DATE, p.fechanac)) BETWEEN {edad_min} AND {edad_max}
    GROUP BY m.nombre
    ORDER BY cantidad_consultas DESC
    """

    conn = db.engine.connect()
    df = pd.read_sql(query, conn)
    conn.close()

    plt.figure(figsize=(10, 6))
    plt.bar(df['medico'], df['cantidad_consultas'])
    plt.title('Consultas por Médico')
    plt.xlabel('Médico')
    plt.ylabel('Cantidad de Consultas')
    plt.xticks(rotation=45)
    plt.tight_layout()

    img = io.BytesIO()
    plt.savefig(img, format='png')
    img.seek(0)
    return send_file(img, mimetype='image/png')

if __name__ == "__main__":
    app.run(debug=True)
