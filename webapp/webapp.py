from flask import Flask, Response, render_template, request


DEBUG = True
SECRET_KEY = '\xd5\xd5\xf4\xea\x9bV\x8d\xf7\x9c\x138Y\xbb\xbd[\xcd\xdewV\xbe#(\xb5\x99'
app = Flask(__name__)
app.config.from_object(__name__)


@app.route('/', methods=['GET', 'POST'])
def home():
    page = {'error': False}
    return render_template('home.html', page=page)


if __name__ == '__main__':
    app.run(host='0.0.0.0')
