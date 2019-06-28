from datetime import date
import smtplib, ssl
from jinja2 import Template
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
    <p>Hi {{ greetings | join(', ') }},<br><br>
    You have been chosen for mysterious lunch. Please contact with your lunchmate. :)<br><br>
    <b>Enjoy your meal!</b>
    </p>
  </body>
</html>
"""


    def send(self, recipients, carbon_copy=[], mimetext_type='html'):
        rcpt = [r.email for r in recipients]
        cc = [r.email for r in carbon_copy ]
        people = [ r.email for r in recipients + carbon_copy]

        message = MIMEMultipart("alternative")
        message["Subject"] = "Myterious Lunch"
        message["From"] = EmailSender.sender
        message["To"] = ','.join(rcpt)
        if carbon_copy:
            message["Cc"] = ','.join(cc)

        # Turn these into plain/html MIMEText objects
        if mimetext_type == 'plain':
            template = Template(EmailSender.text)
        else:
            template = Template(EmailSender.html)

        greetings = [ r.name for r in recipients + carbon_copy]
        payload = template.render(greetings=greetings)

        part = MIMEText(payload, mimetext_type)

        # Add HTML/plain-text parts to MIMEMultipart message
        # The email client will try to render the last part first
        message.attach(part)

        # Create secure connection with server and send email 
        context = ssl.create_default_context()
        with smtplib.SMTP_SSL("smtp.gmail.com", 465, context=context) as server:
            server.login(EmailSender.sender, EmailSender.password)
            print(people)
            print(message)
            server.sendmail(
                EmailSender.sender, people, message.as_string()
                )