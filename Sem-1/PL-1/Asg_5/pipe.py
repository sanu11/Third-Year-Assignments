import os, time

def child(pipeout):
    zzz = 0
    while 1:
        time.sleep(1)
	print "In child process %d" %os.getpid()
	st=raw_input("Enter a String\n")          
        print "%d Sending String through pipe A..." %os.getpid()                
        os.write(pipeout, st)      # send to parent
         
	break;                  
def parent(  ):
    pipein, pipeout = os.pipe(  )                # make 2-ended pipe
    if os.fork(  ) == 0:                         # copy this process
        child(pipeout)                           # in copy, run child
    else:                                        
        while 1:
	    print "In Parent process %d" %os.getpid()
            line = os.read(pipein, 32)          
	    print 'Parent %d received "%s" through pipe A' % (os.getpid(  ), line)
	    st2=line[::-1]
	    print 'Reversed String by parent %d is %s' %(os.getpid(),st2)
	    break;

parent(  )
