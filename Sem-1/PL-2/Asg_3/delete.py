import os
import subprocess

os.system("df -T")
path=raw_input("Enter the path whose data is to be recovered")
print "Wait for the image to be created.. This may take longer..."
os.system("sudo dd if="+ path + " of=image.img bs=512")
os.system("fls -d image.img")
name=raw_input("Enter the file_name to be recovered")
x=subprocess.check_output("fls -r image.img | grep "+name,shell=True)
print x
y=x.split()
z=''.join(y[2])
inode=str(z.split(":")[0])
print inode
os.system("icat -r image.img "+inode)


