(define (double n)
(+ n n))

(define (halve n)
(floor (/ n 2)))

(define (even n)
(= (remainder n 2) 0))

; just like fast pow; divide and conquer
(define (fast-times a b)
    (cond ((= b 0) 0)
        ((even b) (double (fast-times a (halve b))))
        (else (+ a (double (fast-times a (halve b)))))))

(fast-times 12 13
           )