import os
class BBB_Network:
	def BBB_M(self):
	  	dest_ip=raw_input("enter ip address of destination...:")
	  	user_name=raw_input("enter user name of destination...:")
	  	os.system("ls -l")
	  	src_file=raw_input("enter file to transfer from beagle bone ")
	  	dest_path=raw_input("enter destination path....")
	  	os.system("scp "+src_file+" "+user_name+"@"+dest_ip+":"+dest_path)
	
	def M_BBB(self):
		ip=raw_input("enter ip adress of machine from where you want to get file..:")
		user_login=raw_input("enter user login of the above machine...:")
		os.system("ssh "+user_login+"@"+ip+" ls -l /home/cnlab/3276/")
		file_name=raw_input("enter file name to copy..(with path)")
		os.system("scp "+user_login+"@"+ip+":"+file_name+" /root")
		print("file successfully copied..now exiting from remote login")
		os.system("exit")		



option=int(input("1.BBB to machine\n2.Machine to BBB"))
obj=BBB_Network()
if(option==1):
	obj.BBB_M()
else:
	obj.M_BBB()
