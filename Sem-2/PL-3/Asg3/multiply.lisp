(defun mul (a b)
(setf ans 0)
(setf i  -1 )
(setf d a)
(setf j 0)

;;to count number of bits in a 

(loop
(setf d (ash d -1))
(setf j (+ j 1))
;(write d)(write j)write-line "")
(when (= d 0)(return))
)

(loop
(sb-thread:make-thread (lambda()	
(setf i (+ i 1))
(setf c (ash a ( - i)) )
(if (= (logand c 1) 1) (setf ans (+ ans (ash b i))))
(setf j ( - j 1))
))
(when (= j 0)(return ans))
) ;loop close
);end fun


(write-line "")
(write-line "Enter Values :")
(defvar a 0)
(defvar b 0)

(setq a(read))
(setq b(read))


(write (mul a b))
