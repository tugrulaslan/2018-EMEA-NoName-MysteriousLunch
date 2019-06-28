from datetime import date
import smtplib, ssl
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart


class EmailSender(object):
    sender = "MysteriousLunch@gmail.com"
    password = "Mystery123"#input("Type your password and press enter:")
    # Create the plain-text and HTML version of your message
    text = """\
Hi,
You have been chosen for mysterious lunch. Please contact with your lunchmate. :)
Enjoy your meal! """
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


    def send(self, recipients, carbon_copy=[], mimetext_type='plain'):
        message = MIMEMultipart("alternative")
        message["Subject"] = "Myterious Lunch"
        message["From"] = EmailSender.sender
        message["To"] = ','.join(recipients)
        if carbon_copy:
            message["Cc"] = ','.join(carbon_copy)

        # Turn these into plain/html MIMEText objects
        if mimetext_type == 'plain':
            part1 = MIMEText(EmailSender.text)
        else:
            pass
            #part2 = MIMEText(html, "html")

        # Add HTML/plain-text parts to MIMEMultipart message
        # The email client will try to render the last part first
        message.attach(part1)
        #message.attach(part2)

        # Create secure connection with server and send email 
        context = ssl.create_default_context()
        with smtplib.SMTP_SSL("smtp.gmail.com", 465, context=context) as server:
            server.login(EmailSender.sender, EmailSender.password)
            people = recipients + carbon_copy
            print(people)
            print(message)
            server.sendmail(
                EmailSender.sender, people, message.as_string()
                )