from ftplib import FTP
import os

flag = True
while(flag):
        os.system("ifconfig eth0 192.168.5.21")

        ftps = FTP('192.168.5.31')

        ftps.login()

        print "Select an option for transfering files:\n1.Machine to BBB\n2. BBB to machine"

        print "3.FTP to BBB\n4.BBB to FTP\n5.Exit"

        choice = int(input())

        if choice == 1:
                mcip = raw_input("Enter the ip of machine from where the file is to be received: ")

                user = raw_input("Enter the user from  whom the file is to be received: ")

                filename = raw_input("Enter path of the file to be received: ")

                destpath = raw_input("Enter the path where the file is to be stored: ")

                os.system("scp "+user+"@"+mcip+":"+filename+" "+destpath)

                print "File received successfully"

        elif choice == 2:
                mcip = raw_input("Enter the ip of machine to send files to: ")

                user = raw_input("Enter the user to whom the file is to be sent: ")

                destpath = raw_input("Enter where the file should be stored on receiving machine: ")

                filename = raw_input("Enter the path to the file to be sent: ")

                os.system("scp "+filename+" "+user+"@"+mcip+":"+destpath)

                print "File successfully sent"

        elif choice == 3:
         	ftps.retrlines('LIST')

                filename = raw_input("Enter the filename to be downloaded: ")

                ftps.retrlines('RETR '+filename, open(filename,"wb").write)

                print "File successfully downloaded"

        elif choice == 4:
                filename = raw_input("Enter the filename which is to be sent: ")
		print filename
                ftps.storlines("STOR " + os.path.basename(filename), open(filename))

                print "File successfully uploaded"



        else:
                flag = False
