(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))
(define loop (cons 'a 'b))
(set-cdr! loop loop)
; ends in infinite loop
(count-pairs loop)