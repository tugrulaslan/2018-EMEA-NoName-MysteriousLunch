from datetime import date
import mysql.connector
from mysql.connector import Error
import smtplib, ssl
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart

try:
 db_connection = mysql.connector.connect(
  host="sql7.freesqldatabase.com",
  user="sql7296840",
  passwd="pkjezHwyE4",
  database="sql7296840"
)

 my_database = db_connection.cursor()
 sql_statement = "SELECT aa.email FROM User aa, User_Request bb where bb.user_id=aa.id and bb.request_status is null;"
 
 sender_email = "MysteriousLunch@gmail.com"
 receiver_email = "tugrulaslan@gmail.com"
 password = "Mystery123"#input("Type your password and press enter:")

 message = MIMEMultipart("alternative")
 message["Subject"] = "Myterious Lunch"
 message["From"] = sender_email
 message["To"] = receiver_email

# Create the plain-text and HTML version of your message
 text = """\
    Hi,
     You have been chosen for mysterious lunch. Please contact with your lunchmate. :)
    Enjoy your meal!
"""
 html = """\
<html>
  <body>
    <p>Hi,<br>
        You have been chosen for mysterious lunch. Please contact with your lunchmate. :)
    Enjoy your meal!
    </p>
  </body>
</html>
"""

# Turn these into plain/html MIMEText objects
 part1 = MIMEText(text, "plain")
#part2 = MIMEText(html, "html")

# Add HTML/plain-text parts to MIMEMultipart message
# The email client will try to render the last part first
 message.attach(part1)
#message.attach(part2)

# Create secure connection with server and send email 
 context = ssl.create_default_context()
 with smtplib.SMTP_SSL("smtp.gmail.com", 465, context=context) as server:
  server.login(sender_email, password)
  server.sendmail(
  sender_email, receiver_email, message.as_string()
    )
    
 db_connection.close()
except Error as e :
    print ("Error while connecting to MySQL", e)
finally:
    #closing database connection.
    if(db_connection.is_connected()):
        db_connection.close()
        print("connection is closed")    