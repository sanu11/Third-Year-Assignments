(defun add(a b)
(+ a b )
)

(defun sub(a b)
(- a b )
)

(defun mul(a b)
(setf ans 0)
(setf i -1)
(loop
(setf i (+ i 1))
;;check if last bit is 1 or 0 if 1 then add b to ans alse dont do anything
(sb-thread:make-thread(lambda() ( setf c (ash a ( - i)) ) (if (= (logand c 1) 1) ((setf ans (+ ans (ash b i))) (write ans)(write-line "")))))
(when (= a 0)(return ans))
) 
)

(defun div(a b)
(/ a b )
)

(write-line "")
(write-line "Enter Values :")
(setf a(read))
(setf b(read))

(write-line "")
(sb-thread:make-thread(lambda()(princ "Addition is : ")(write(add a b))(write-line "")(write-line "")))
(sb-thread:make-thread(lambda()(princ "Subtraction is : ")(write(sub a b))(write-line "")(write-line "")))
(sb-thread:make-thread(lambda()(princ "Multiplication is : ")(write(mul a b))(write-line "")(write-line "")))
(sb-thread:make-thread(lambda()(princ "Division is : ")(write(div a b))(write-line "")(write-line "")))