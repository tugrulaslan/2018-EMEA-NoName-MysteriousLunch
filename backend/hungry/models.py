from sqlalchemy import Column, Integer, String
from hungry.database import Base

class Cuisine(Base):
    __tablename__ = 'Cuisine'
    id = Column(Integer, primary_key=True)
    definition = Column(String(100))

    def __init__(self, definition=None):
        self.definition = definition

    def __repr__(self):
        return '[Cuisine %d: %r>' % (self.id, self.definition)

class User(Base):
    __tablename__ = 'User'
    id = Column(Integer, primary_key=True)
    email = Column(String(255))
    username = Column(String(255), unique=True)
    name = Column(String(100))
    surname = Column(String(100))
    bio = Column(String(100))
    frequency = Column(String(100))
    rating = Column(Integer)

    def __init__(self, **kwargs):
        for key, value in kwargs.items():
            if key in ['query']:
                next
            setattr(self, key, value)

    def __repr__(self):
        return '[User %d: %r]' % (self.id, self.username)