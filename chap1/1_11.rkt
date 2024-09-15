;for each itration, only prev 3 number affects result;memorize them
(define (f i a b c t)
    (if (= i t)
        c
        (f (+ 1 i) b c (+ (* 3 a ) (* 2 b) c) t)))

(define (ff t)
    (f 3 1 2 3 t))        