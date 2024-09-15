(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op 
                      initial 
                      (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low 
            (enumerate-interval 
             (+ low 1) 
             high))))

;1.make-list 1-n
;2.each element a make list 1- a-1
;3.map 1-a-1 to (1,a)->(a-1,a)
(define (unique-pairs n)
    (flatmap (lambda (end) 
    (map (lambda (pair) (cons pair end))(enumerate-interval 1 (- end 1) ))) 
    (enumerate-interval 1 n)))

    (unique-pairs 3)