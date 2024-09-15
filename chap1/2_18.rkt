; 链表反转？1->2->3 reverse => cons(子序列reverse , 1)
(define (reverse input)
; last element, return the single element list for caller to append more
(if (null? (cdr input))
    input
     (append (reverse (cdr input))  (list (car input)))))
   
(reverse (list 1 2 3))
(+ 1 1)
(list-ref (list 1 2 3) 3)