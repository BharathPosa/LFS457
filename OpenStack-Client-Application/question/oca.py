from flask import Flask
from flask import render_template, request, redirect, url_for

app = Flask(__name__)


@app.route('/')
def get_all_instances():
    #TODO: Add your code changes here
    return render_template('home.html', **locals())


@app.route('/volumes')
def get_all_volumes():
    #TODO: Add your code changes here
    return render_template('volumes.html', **locals())


@app.route('/vol_create', methods=['GET', 'POST'])
def create_volume():
    if request.method == "POST":
        name = request.form.get('name', None)
        desc = request.form.get('desc', None)
        size = request.form.get('size', None)
        #TODO: Add your code changes here
        return redirect(url_for('get_all_volumes'))
    return render_template('vol_create.html', **locals())


if __name__ == '__main__':
    app.run()
