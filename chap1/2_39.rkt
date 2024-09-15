(define nil '())
(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op 
                      initial 
                      (cdr sequence)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

;recusive order,call order is right to left, same as target order,so append at target res
(define (reverse1 sequence)
  (fold-right 
   (lambda (x y) (append y (list x))) nil sequence))

(define (reverse2 sequence)
  (fold-left 
   (lambda (x y) (cons y x)) nil sequence))
(reverse1 (list 1 2 3))
(reverse2 (list 1 2 3))


