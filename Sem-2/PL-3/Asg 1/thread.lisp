(defun add(a b)
(+ a b )
)

(defun sub(a b)
(- a b )
)

<<<<<<< HEAD
(defvar i 0)
(defun mul(a b)
(defvar ans 0)
(defvar temp 0)
(defvar temp2 0)
(loop
(setf temp (logand a 1))
;;check if last bit is 1 or 0 if 1 then add b to ans alse dont do anything
(setf temp2 (ash b i))
(if (= temp  1)(sb-thread:make-thread(lambda() (setf ans (+ ans temp2)))))
(setf a (ash a -1))
(setf i (+ i 1))
=======
(defun mul(a b )
(setf ans 0)
(setf i -1)
(loop
(setf i (+ i 1))
;;check if last bit is 1 or 0 if 1 then add b to ans alse dont do anything
(if (= (logand a 1) 1)(sb-thread:make-thread(lambda() (setf ans (+ ans (ash b i)))(write ans)(write-line ""))))
(setf a (ash a -1))
>>>>>>> 79b1123811df241fea21952fa094ca7f22140d40
(when (= a 0)(return ans))
) 
)

(defun div(a b)
(/ a b )
)

(write-line "")
(write-line "Enter Values :")
(defvar a(read))
(defvar b(read))

(write-line "")
(sb-thread:make-thread(lambda()(princ "Addition is : ")(write(add a b))(write-line "")(write-line "")))
(sb-thread:make-thread(lambda()(princ "Subtraction is : ")(write(sub a b))(write-line "")(write-line "")))
(sb-thread:make-thread(lambda()(princ "Multiplication is : ")(write(mul a b))(write-line "")(write-line "")))
(sb-thread:make-thread(lambda()(princ "Division is : ")(write(div a b))(write-line "")(write-line "")))
 
 
