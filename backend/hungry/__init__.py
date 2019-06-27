import os
import json
from flask import Flask
from flask import request
from flask import current_app, g

from hungry.api.database import db_session
from hungry.api.v1 import api as api_v1

def create_app(test_config=None):
    # create and configure the app
    app = Flask(__name__, instance_relative_config=True)
    app.config.from_mapping(
        SECRET_KEY='dev',
        DATABASE=os.path.join(app.instance_path, 'flaskr.sqlite'),
    )

    app.register_blueprint(api_v1.api, url_prefix='/api/v1')

    if test_config is None:
        # load the instance config, if it exists, when not testing
        app.config.from_pyfile('config.py', silent=True)
    else:
        # load the test config if passed in
        app.config.from_mapping(test_config)

    # ensure the instance folder exists
    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

    @app.route("/")
    def hello():
        return "Hungry API"

    @app.teardown_appcontext
    def shutdown_session(exception=None):
        db_session.remove()
    
    return app    