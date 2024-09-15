(define (fringe input)
;simple recusive way
;the current ele is null -> ext point
;the current ele is list -> fringe(car) + fringe(cdr)
;the current ele is primitive -> cons(car ,fringe(cdr))
(cond ((null? input) '())
 ((pair? (car input)) (append (fringe (car input)) (fringe (cdr input))))
  (else (cons (car input) (fringe (cdr input))))))
(define x (list (list 1 2) (list 3 4)))

(fringe (list 1 2 x 3 x))