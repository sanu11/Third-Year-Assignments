
(defun add(a b)
(princ "Addition is :")
(write(+ a b ))
(write-line "")
(write-line "")
)

(defun sub(a b)
(princ "Subtraction is :")
(write(- a b ))
(write-line "")
(write-line "")

)

(defun mul(a b)
(princ "Multiplication is :")
(write(* a b ))
(write-line "")
(write-line "")
)

(defun div(a b)
(princ "Division is :")
(write(/ a b ))
(write-line "")
(write-line "")
)

(defvar a 0)
(defvar b 0)
(defvar c 0)
(loop
(write-line "Enter Values :")
(setf a(read))
(setf b(read))
(write-line "")
(write-line "1.Addition")
(write-line "2.Subtraction")
(write-line "3.Multiplication")
(write-line "4.Division")
(write-line "5.Exit")
(write-line "")
(write-line "Enter Choice :")
(setf c(read)) 	
(cond 
((= c 1)(add a b))
((= c 2)(sub a b))
((= c 3)(mul a b))
((= c 4)(div a b))
((= c 5)(return c))
)
)
