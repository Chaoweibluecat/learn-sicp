(define (tree-map map-func tree)
    (cond ((null? tree) '())
        ((not (pair? tree)) (map-func tree ))
        (else (map (lambda (x) (tree-map map-func x)) tree))))

(define (square-tree tree) (tree-map (lambda (x) (* x x)) tree))
(square-tree (list 1 (list 2 3 (list 4 5))))