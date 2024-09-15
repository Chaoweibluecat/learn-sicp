(define (f n)
    (if (< n 4)
        n
        (+ (f (- n 1)) (* 2 (- n 2)) (* 3 (- n 3)))))
(f 4)

