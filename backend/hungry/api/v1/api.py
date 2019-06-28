import os
import json
from flask import jsonify
from flask import Flask
from flask import Blueprint
from flask import request
from flask import Response
from flask import current_app, g

from sqlalchemy import exists
from sqlalchemy.exc import IntegrityError

from hungry.api.common import LunchMatcher
from hungry.api.database import db_session
from hungry.api.mail import EmailSender
from hungry.api.transcoder import AlchemyEncoder, AlchemyDecoder
from hungry.api.models import User, Cuisine, Interest

api = Blueprint('API_v1', __name__)

@api.route("/")
def hello():
    return api.name

@api.route("/interests", methods=['GET'])
def interests():
    q = Interest.query.all()
    return json.dumps(q, cls=AlchemyEncoder)

@api.route("/cuisines", methods=['GET'])
def cuisines():
    cuisines = Cuisine.query.all()
    return json.dumps(cuisines, cls=AlchemyEncoder)

@api.route("/cuisine/<definition>", methods=['GET'])
def cuisine(definition):
    cuisine = Cuisine.query.filter(Cuisine.definition == definition).first()
    return json.dumps(cuisine, cls=AlchemyEncoder)

@api.route("/request", methods=['POST'])
def request_lunch():
    requesting_user = User.query.filter(User.username == 'kozlo').first()
    matched_user = LunchMatcher.match('rafeal')

    mail = EmailSender()
    mail.send([requesting_user.email, matched_user.email])

    return Response(response=json.dumps({'Status': 'Sent'}),
                    status=200,
                    mimetype='application/json'
                    )

@api.route("/users", methods=['GET', 'POST'])
def user():
    if request.method == 'POST':
        # Create user
        data = request.data
        dataDict = json.loads(data, cls=AlchemyDecoder)
        print(dataDict)
        user = User(**dataDict)
        db_session.add(user)
        try:
            db_session.commit()
        except IntegrityError as e:
            return Response(response=json.dumps({'Status': 'Failed: {}'.format(str(e))}),
                            status=400,
                            mimetype='application/json'
                            )
        return Response(response=json.dumps({'Status': 'Updated'}),
                        status=201,
                        mimetype='application/json'
                        )
    else:
        users = User.query.all()
        return json.dumps(users, cls=AlchemyEncoder)

@api.route("/users/<username>", methods=['GET', 'POST'])
def user_by_name(username):
    if request.method == 'POST':
        data = request.data
        dataDict = json.loads(data, cls=AlchemyDecoder)
        print(dataDict)
        #user = session.query(User).get(someid)
        #if db_session.query(exists().where(User.username == dataDict['username'])).scalar():
        #    print("EXISTS")

        #else:
        #    db_session.add(user)

        #db_session.commit()
        #AlchemyDecoder
        #        return str(user)
        ## Update existing user
        #data = request.data
        #dataDict = json.loads(data)
        #print(dataDict)
        #user = User(**dataDict)
        #db_session.add(user)
        #db_session.commit()
        #return str(user)
    else:
        # get 
        user = User.query.filter(User.username == username).first()
        return json.dumps(user, cls=AlchemyEncoder)