(defun add (a b)
(+ a b)
) 

(defun sub (a b)
(- a b)
) 

(defun mul (a b)
(setf ans 0)
(setf i 0)

(loop

(if (= (logand a 1) 1)

(setf ans ( + ans (ash b i) ))

) ;if close

(setf a (ash a -1))
(setf i (+ i 1))

(when (= a 0)(return ans))

);loop close
);end fun

(defun div (a b)
(/ a b)
) 

;this runs well 

(write-line "")
(write-line "Enter Values :")
(defvar a 0)
(defvar b 0)

(setq a(read))
(setq b(read))

; (write a)
; (write b)

(write-line "")
(sb-thread:make-thread(lambda()(princ "Addition is : ")(write(add a b))(write-line "")(write-line "")))
(sb-thread:make-thread(lambda()(princ "Subtraction is : ")(write(sub a b))(write-line "")(write-line "")))
(sb-thread:make-thread(lambda()(princ "Multiplication is : ")(write(mul a b))(write-line "")(write-line "")))
(sb-thread:make-thread(lambda()(princ "Division is : ")(write(div a b))(write-line "")(write-line "")))