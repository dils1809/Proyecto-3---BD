from flask import Flask, render_template, request
from sqlalchemy import text
from flask_sqlalchemy import SQLAlchemy
from config import Config
from flask import Flask, render_template, request, send_file
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import text
import pandas as pd
import matplotlib.pyplot as plt
import io
from reportlab.pdfgen import canvas
import os

app = Flask(__name__)
app.config.from_object(Config)
db = SQLAlchemy(app)

@app.route('/')
def home():
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

        query = f"""
        SELECT m.nombre AS medico, e.nombre AS especialidad, COUNT(*) AS cantidad_consultas
        FROM cita c
        JOIN medico m ON c.idmedico = m.idmedico
        JOIN espec e ON m.idespec = e.idespec
        JOIN paciente p ON c.idpaciente = p.idpaciente
        WHERE c.fecha BETWEEN '{fecha_inicio}' AND '{fecha_fin}'
        AND m.nombre ILIKE '%{medico}%'
        AND e.nombre ILIKE '%{especialidad}%'
        AND p.sexo ILIKE '%{sexo}%'
        GROUP BY m.nombre, e.nombre
        ORDER BY cantidad_consultas DESC
        """
        resultados = db.session.execute(text(query)).fetchall()

    return render_template('reporte1.html', resultados=resultados)

@app.route('/reporte1/excel', methods=['POST'])
def exportar_excel():
    fecha_inicio = request.form['fecha_inicio']
    fecha_fin = request.form['fecha_fin']
    medico = request.form['medico']
    especialidad = request.form['especialidad']
    sexo = request.form['sexo']

    query = f"""
    SELECT m.nombre AS medico, e.nombre AS especialidad, COUNT(*) AS cantidad_consultas
    FROM cita c
    JOIN medico m ON c.idmedico = m.idmedico
    JOIN espec e ON m.idespec = e.idespec
    JOIN paciente p ON c.idpaciente = p.idpaciente
    WHERE c.fecha BETWEEN '{fecha_inicio}' AND '{fecha_fin}'
    AND m.nombre ILIKE '%{medico}%'
    AND e.nombre ILIKE '%{especialidad}%'
    AND p.sexo ILIKE '%{sexo}%'
    GROUP BY m.nombre, e.nombre
    ORDER BY cantidad_consultas DESC
    """

    df = pd.read_sql(text(query), db.session.bind)
    output = io.BytesIO()
    df.to_excel(output, index=False)
    output.seek(0)
    return send_file(output, download_name="reporte_consultas.xlsx", as_attachment=True)




if __name__ == '__main__':
    app.run(debug=True)
