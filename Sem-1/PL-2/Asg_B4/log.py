import urllib
import os, sys

choice=int(input("Enter 0 to see menu=\t"))
while choice<6:
	print "LOG MENU \n"
	print "1. BOOT LOG \n"
	print "2. AUTH LOG \n"
	print "3. KERN LOG \n"
	print "4. SYSTEM LOG \n"
	print "5. Existing List of LOG Files\n"
	print "6. EXIT LOG \n"
	print "Select Log FIle Choice"
	choice=int(input("Enter the choice=\t"))
	if choice==1:
		datasource = urllib.urlopen("/var/log/boot.log")
		i=0
		while i<10:
			i=i+1
			line = datasource.readline()
			if line == "": break
			if (line.find("") > -1) :
		        	print line,

			line="Boot LOG data!"
			print line,

	elif choice==2:
		datasource = urllib.urlopen("/var/log/auth.log")
		i=0
		while i<10:
			i=i+1
			line = datasource.readline()
			if line == "": break
			if (line.find("") > -1) :
			        print line,

			line="Authentication LOG data!"
			print line,
	elif choice==3:
		datasource = urllib.urlopen("/var/log/kern.log")
		i=0
		while i<10:
			i=i+1
			line = datasource.readline()
			if line == "": break
			if (line.find("") > -1) :
			        print line,

			line="Kernel LOG data!"
			print line,
	elif choice==4:
		datasource = urllib.urlopen("/var/log/syslog")
		i=0
		while i<10:
			i=i+1
			line = datasource.readline()
			if line == "": break
			if (line.find("") > -1) :
			        print line,

			line="System LOG data!"
			print line,
	elif choice == 5:
		# Open a file
		path = "/var/log"
		dirs = os.listdir( path )

		# This would print all the files and directories
		for file in dirs:
		   print file
	elif choice == 6:
		break




