from sqlalchemy import Table, Column, Integer, String, ForeignKey
from sqlalchemy.orm import relationship

from hungry.api.database import Base

filtered_properties = ['query']

cuisine_association_table = Table('User_Cuisine', Base.metadata,
    Column('user_id', Integer, ForeignKey('User.id')),
    Column('cuisine_id', Integer, ForeignKey('Cuisine.id'))
)

interests_association_table = Table('User_Interest', Base.metadata,
    Column('user_id', Integer, ForeignKey('User.id')),
    Column('interest_id', Integer, ForeignKey('Interest.id'))
)

class Interest(Base):
    __tablename__ = 'Interest'
    id = Column(Integer, primary_key=True)
    definition = Column(String(255))
    users = relationship("User", secondary=interests_association_table)

    def __init__(self, **kwargs):
        for key, value in kwargs.items():
            if key in filtered_properties:
                next
            setattr(self, key, value)

    @property
    def serialize(self):
        return {'id': self.id, 'definition': self.definition}

    def __repr__(self):
        return '<%r %d: %r>' % (self.__class__.__name__, self.id, self.definition)

class Cuisine(Base):
    __tablename__ = 'Cuisine'
    id = Column(Integer, primary_key=True)
    definition = Column(String(100))

    def __init__(self, **kwargs):
        for key, value in kwargs.items():
            if key in filtered_properties:
                next
            setattr(self, key, value)

    @property
    def serialize(self):
        return {'id': self.id, 'definition': self.definition}

    def __repr__(self):
        return '<%r %d: %r>' % (self.__class__.__name__, self.id, self.definition)

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
    cuisines = relationship("Cuisine", secondary=cuisine_association_table)
    interests = relationship("Interest", secondary=interests_association_table)

    def update(self, **kwargs):
        for key, value in kwargs.items():
            setattr(self, key, value)

    def __init__(self, **kwargs):
        for key, value in kwargs.items():
            if key in filtered_properties:
                next
            setattr(self, key, value)

    def __repr__(self):
        return '<%r %d: %r>' % (self.__class__.__name__, self.id, self.username)
