(define factorial
    (lambda (n) (if (= n 1)
      1
      (* n (factorial (- n 1))))))
;define factorial => eval lambda expression ,result in a procedure object that ref to global
;factorial 3 => apply procedure, creates new frame where n=3 => 3* fac2
;factorial 2 => apply procedure, creates new frame where n=2 => 2* fac1
;(rule 1,procedure apply时,创建的新环境的外围环境就是procedure对象指向的环境，这里就是global)
(define (factorial n)
  (fact-iter 1 1 n))

(define fact-iter
    (lambda (product counter max-count) 
    (if (> counter max-count)
      product
      (fact-iter (* counter product)
                 (+ counter 1)
                 max-count))))
;factorial 3; 
;lambda eval , create new frame where product = 1,counter = 1 max-count=n
;lambda eval , create new frame where product = 1,counter = 2 max-count=n
;lambda eval , create new frame where product = 2,counter = 3 max-count=n

;