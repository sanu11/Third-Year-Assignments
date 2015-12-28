import smtplib
import poplib
import imaplib
import email
import getpass

print "Enter password for sanikashah1110@gmail.com"
username='sanikashah1110@gmail.com'
password=getpass.getpass()
#send

#pop_conn = poplib.POP3_SSL('pop.gmail.com')
#pop_conn.user(username)
#pop_conn.pass_(password)

"""fro="sanikashah1110@gmail.com"
to="mayurdhurpate@gmail.com"
msg="Hello,sent through python..hehe!"
smtpserver = smtplib.SMTP("smtp.gmail.com", 587)
smtpserver.ehlo()
smtpserver.starttls()
smtpserver.ehlo()
#smtpserver.login(username,password )
#smtpserver.sendmail(fro,to,msg)
smtpserver.quit()
"""
#receive
M = imaplib.IMAP4_SSL('imap.gmail.com')

try:
    M.login(username,password)
except imaplib.IMAP4.error:
    print "LOGIN FAILED!!! "

#receiver=raw_input("Enter receivers mail address")	
M.select('INBOX')
result, data = M.search(None, '(TO "sanikashah1110@gmail.com" SUBJECT "Anku Marriage Videos - Invitation to collaborate")')
ids = data[0]
id_list = ids.split()
latest_email_id = id_list[-1] 
print latest_email_id
result, data = M.fetch(latest_email_id, "(RFC822)") 

raw_email = data[0][1] 

msg=email.message_from_string(raw_email)

print  "To:" ,msg['TO']
print "From:" ,msg['FROM']
print "Subject:", msg['SUBJECT']
print "Date:" ,msg['Date']

