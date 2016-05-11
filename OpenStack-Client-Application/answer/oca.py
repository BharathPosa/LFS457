from flask import Flask
from flask import render_template, request, redirect, url_for
from novaclient import client as novac
from cinderclient import client as cinderc


app = Flask(__name__)


def get_creds():
    return {'username': 'admin',
            'auth_url': 'http://192.168.2.181:5000/v2.0',
            'api_key': 'vedams',
            'project_id': 'admin'}

@app.route('/')
def get_all_instances():
    creds = get_creds()
    nt = novac.Client(2, **creds)
    ins_list = nt.servers.list()
    return render_template('home.html', **locals())


@app.route('/volumes')
def get_all_volumes():
    creds = get_creds()
    ct = cinderc.Client(2, **creds)
    vol_list = ct.volumes.list()
    nt = novac.Client(2, **creds)
    ins_list = nt.servers.list()
    return render_template('volumes.html', **locals())


@app.route('/vol_create', methods=['GET', 'POST'])
def create_volume():
    if request.method == "POST":
        name = request.form.get('name', None)
        desc = request.form.get('desc', None)
        size = request.form.get('size', None)
        creds = get_creds()
        ct = cinderc.Client(2, **creds)
        server = ct.volumes.create(size, name=name, description=desc)
        return redirect(url_for('get_all_volumes'))
    return render_template('vol_create.html', **locals())


if __name__ == '__main__':
    app.run()
