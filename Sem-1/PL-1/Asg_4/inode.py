import os, sys

file=raw_input("Enter a file name\n")

fd = os.open( file , os.O_RDWR|os.O_CREAT)

info = os.fstat(fd)

#reurns tuplr
#print "File Info :", info

print "\nUID of the file :%d" % info.st_uid

print "GID of the file :%d" % info.st_gid

print "Inode of the file :%d" %info.st_ino

print "Number of Hardlinks :%d" %info.st_nlink

print "Device ID:%d" %info.st_rdev

print "Size of files is :%d" %info.st_size



os.close( fd)
