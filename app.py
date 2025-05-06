from flask import Flask, render_template, request
from flask_sqlalchemy import SQLAlchemy
from config import Config

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

        query = f"""
        SELECT m.nombre AS medico, e.nombre AS especialidad, COUNT(*) AS cantidad_consultas
        FROM cita c
        JOIN medico m ON c.idmedico = m.idmedico
        JOIN espec e ON m.idespec = e.idespec
        WHERE c.fecha BETWEEN '{fecha_inicio}' AND '{fecha_fin}'
        AND m.nombre ILIKE '%{medico}%'
        AND e.nombre ILIKE '%{especialidad}%'
        GROUP BY m.nombre, e.nombre
        ORDER BY cantidad_consultas DESC;
        """
        resultados = db.session.execute(query).fetchall()

    return render_template('reporte1.html', resultados=resultados)

if __name__ == '__main__':
    app.run(debug=True)
