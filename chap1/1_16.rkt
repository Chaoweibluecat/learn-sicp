;res = B^N*A
;N even => B^(2*N/2)*A
;N odd => B^(N-1)*(A*B)
;comparing to recusrve code, iterative version just move the operand on the stack to "A
(define (fast-exp-it N B A)
    (cond ((= N 0) A)
        ((= (remainder rest 2) 0 ) (fast-exp-it (/ rest 2) (* B B) A))
        (else (fast-exp-it (- rest 1) B (* B A)))))