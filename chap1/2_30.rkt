;null->null
;primitive-> square
;list->recusively square-tree child element
(define (square-tree tree)
    (cond ((null? tree) '())
        ((not (pair? tree)) (* tree tree))
        (else (map (lambda (x) (square-tree x)) tree))))

(square-tree (list 1 (list 2 3 (list 4 5))))