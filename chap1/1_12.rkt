; the j th number of colomn i 
(define (tri i j)
    (if (or (= j 0 ) (= i j))
        1
        (+ (tri (- i 1) (- j 1)) (tri (- i 1) j))))