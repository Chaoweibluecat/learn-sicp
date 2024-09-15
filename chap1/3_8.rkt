(define state 0)
(define (f input)
    (let ((temp state))
        (begin (set! state input) temp)))
(+ (f 1) (f 0))
(+ (f 0) (f 1))

