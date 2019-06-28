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
#	id	user_id	requested_time	lunch_type	request_date
 pair_week=[]
 group_week=[]
 pair_month=[]
 group_month=[]
 mail_list=[]
 
 cnt_week=0
 cnt_mnt=0

 my_database = db_connection.cursor()
 sql_statement = "SELECT * FROM User_Request where request_status is null;"
 sql_statement_ins = "INSERT INTO Meeting_History (meeting_id,request_id,request_date) values(%s,%s,%s);"
 sql_statement_upd_mt = "UPDATE Meeting_History SET meeting_status= %s where meeting_id= %s"
 sql_statement_upd_ur = "UPDATE User_Request SET request_status= %s where id= %s"
 sql_statement_mail = "SELECT aa.email FROM User aa, User_Request bb,Meeting_History cc where bb.user_id=aa.id and cc.request_id=bb.request_id  and cc.meeting_id=%s;"

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


 my_database.execute(sql_statement)
 output = my_database.fetchall()
 for x in output:
    if x[3] =='pair':
       if x[2] == 'week':
         pair_week.append(x[0])    
       else:
         pair_month.append(x[0])
   #     weekNumber = x[4].isocalendar()[1]
   #     print ('Week number:', weekNumber)
    else:
       if x[2] == 'week':
           group_week.append(x[0])    
       else:
           group_month.append(x[0])

 #print(len(pair_month)) 
 my_database.execute("SELECT coalesce(MAX(meeting_id),0)+1 FROM Meeting_History where meeting_status is not null")

 result = my_database.fetchall()
 for i in result:
    max_meeting_id=i[0]

 initial_id=max_meeting_id


 for val in pair_week:
     values = (max_meeting_id,val,date.today())
     my_database.execute(sql_statement_ins,values)
     db_connection.commit()
     cnt_week+=1  
     if cnt_week==2:
         data = ("DONE", max_meeting_id)
         my_database.execute(sql_statement_upd_mt,data)
         db_connection.commit()
         max_meeting_id+=1
         cnt_week=0        
         

 if initial_id!=max_meeting_id:
   max_meeting_id+=1

            
 for val in pair_month:
     values = (max_meeting_id,val,date.today())
     my_database.execute(sql_statement_ins,values)
     db_connection.commit()
     cnt_mnt+=1 
     if cnt_mnt==2:
         data = ("DONE", max_meeting_id)
         my_database.execute(sql_statement_upd_mt,data)
         db_connection.commit()
         max_meeting_id+=1
         cnt_mnt=0
         
 if initial_id!=max_meeting_id:
   max_meeting_id+=1

    
 for val in group_week:
     
     values = (max_meeting_id,val,date.today())
     my_database.execute(sql_statement_ins,values)
     db_connection.commit()
     cnt_week+=1  
     if cnt_week==4:
          data = ("DONE", max_meeting_id)
          my_database.execute(sql_statement_upd_mt,data)
          db_connection.commit()             
          max_meeting_id+=1
          cnt_week=0
          
   
 if initial_id!=max_meeting_id:
   max_meeting_id+=1

        
 for val in group_month:
         values = (max_meeting_id,val,date.today())
         my_database.execute(sql_statement_ins,values)
         db_connection.commit()
         cnt_mnt+=1  
         if cnt_mnt==4:
          data = ("DONE", max_meeting_id)
          my_database.execute(sql_statement_upd_mt,data)
          db_connection.commit() 
          max_meeting_id+=1
          cnt_mnt=0   

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