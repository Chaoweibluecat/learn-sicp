; recursive way, 
;list is not really a list ，It's a Pair<t,Pair<>>; 
;to access a elemtnt,always access through car, exp. car(car(car a))
(define (same-parity . w) 
    (define (sp-helper input func)
        (if (null? input)
            '()
            (if (func (car input))
                (cons (car input) (sp-helper (cdr input) func))
                (sp-helper (cdr input) func))))
    (if (null? w)
         '()
            (let ((r (remainder (car w) 2)))
            ; can't compile in rust,cause closure outlives local variable
            (sp-helper w (lambda (x) (= (remainder x 2) r))))))

(same-parity 2 3 4 5 6 7)

; iterative way; bookKeep state for each iteration;(current state is definitive for the result(rest and res is all matters) )
(define (same-parity . w) 
    (define (parity-it rest func res)
        (if (null? rest)
            res
            (if (func (car rest))
                (parity-it (cdr rest) func (append res (list (car rest))) )
                (parity-it (cdr rest) func  res))))
    (if (null? w)
         '()
            (let ((r (remainder (car w) 2)))
            ; can't compile in rust,cause closure outlives local variable
            (parity-it w (lambda (x) (= (remainder x 2) r)) '()))))

(same-parity 2 3 4 5 6 7)
(scale-list (list 1 2 3 4) (lambda (x) x*x))