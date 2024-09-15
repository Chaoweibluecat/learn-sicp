(define (filter predicate seq)
    (cond ((null? seq) '())
        ((predicate (car seq)) (cons (car seq) (filter predicate (cdr seq))))
        (else (filter predicate (cdr seq)))))

(define (accumulate op result seq)
    (cond ((null? seq) result)
        (else (accumulate op (op (car seq) result)(cdr seq)))))

(define (map1 func seq) (accumulate (lambda (x y) (append y (list (func x)))) '() seq))
(map1 (lambda (x) (* x x)) (list 1 2 3 4 5))

(define (append1 seq1 seq2)
    body)
(accumulate * 1 (list 1 2 3 4 5))
(filter odd? (list 1 2 3 4 5))