#!/usr/bin/python3

import email
import imaplib
from email.header import decode_header
import webbrowser
import os
from getpass import getpass

username = input("Username: ")
password = getpass()

with imaplib.IMAP4('localhost', 143) as imap:
    imap.login(username, password)
    imap.select('INBOX')
    typ, messages = imap.search(None, 'ALL')
    print(messages)

    for num in messages[0].split():
        _, data = imap.fetch(num , '(RFC822)')
        _, bytes_data = data[0]

        #convert the byte data to message
        email_message = email.message_from_bytes(bytes_data)
        print("\n===========================================")

        #access data
        print("Subject: ",email_message["subject"])
        print("To:", email_message["to"])
        print("From: ",email_message["from"])
        print("Date: ",email_message["date"])
        for part in email_message.walk():
            if part.get_content_type()=="text/plain" or part.get_content_type()=="text/html":
                message = part.get_payload(decode=True)
                print("Message: \n", message.decode())
                print("==========================================\n")
                break

