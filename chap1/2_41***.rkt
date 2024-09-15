(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op 
                      initial 
                      (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate 
                       (cdr sequence))))
        (else  (filter predicate 
                       (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low 
            (enumerate-interval 
             (+ low 1) 
             high))))

 (define (ordered-triples-sum n s) 
   (filter (lambda (list) (= (accumulate + 0 list) s)) 
          (flatmap 
           (lambda (i) 
             (flatmap (lambda (j) 
                  (map (lambda (k) (list i j k)) 
                       (enumerate-interval 1 (- j 1)))) 
                  (enumerate-interval 1 (- i 1)))) 
             (enumerate-interval 1 n)))) 
; i :1-n 每个flatmap 成目标 i,j,k
;(此时lambda已经转化为2-40 uniquePairs的形式,但是内部返回的数据是包含i的)
; j :1-i-1,每个flatmap 成 (i,j,1)->(i,j,k)
; k: enum 1-j-1,每个map成一个i,j,k
(define (my-triple n)
  (flatmap (lambda (i) 
  (flatmap (lambda (j) 
  (map (lambda (k) (list i j k)) 
  (enumerate-interval 1 j-1)))
  (enumerate-interval 1 i-1))) 
  (enumerate-interval 1 n)))
;try 4
