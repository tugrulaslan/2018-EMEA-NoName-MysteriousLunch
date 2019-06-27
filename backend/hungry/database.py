from sqlalchemy import create_engine
from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import scoped_session, sessionmaker
from sqlalchemy.ext.declarative import declarative_base

mysql_connect_string="mysql+mysqlconnector://{user}:{password}@{host}:{port}/{dbname}"
connection = {
    'host': 'sql7.freesqldatabase.com',
    'port': '3306',
    'dbname': 'sql7296840',
    'user':'sql7296840',
    'password': 'pkjezHwyE4',
}


engine = create_engine(mysql_connect_string.format(**connection), echo=True)
db_session = scoped_session(sessionmaker(autocommit=False,
                                         autoflush=False,
                                         bind=engine))
Base = declarative_base()
Base.query = db_session.query_property()

def init_db():
    # import all modules here that might define models so that
    # they will be registered properly on the metadata.  Otherwise
    # you will have to import them first before calling init_db()
    import yourapplication.models
    Base.metadata.create_all(bind=engine)