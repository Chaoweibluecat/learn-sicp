(list-ref (list 1 2 3) 3)
(append (list 1 2 3) (list 4 5 6))
; nested, not flat
(cons (list (1 2 3)) 4)
(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))