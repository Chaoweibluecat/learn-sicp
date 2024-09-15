;reverse single list from 2_18
(define (reverse input)
(if (null? (cdr input))
    input
     (append (reverse (cdr input))  (list (car input)))))

(define (reverse-single input)
    (if (pair? input)
        (reverse input)
        input))

(define (deep-reverse input)
    (if (null? (cdr input))
        (reverse-single input)
        (append (deep-reverse (cdr input))  (list (reverse-single (car input))))))

(define x (list (list 1 2) (list 3 4)))
;(reverse (list 1 2 3))
(deep-reverse x)