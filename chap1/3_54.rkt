;O(1) ,have to go with doubly linkedlist
#lang sicp

(define (stream-ref s n)
  (if (= n 0)
      (stream-car s)
      (stream-ref (stream-cdr s) (- n 1))))

;3.50 res is stream, 
;car 为proc apply在streamlist各自stream的car组成的list的结果
;cdr 为递归的定义streamlist每个stream取cdr组成的list递归应用streammap

(define (stream-map proc . argstreams) 
   (if (stream-null? (car argstreams)) 
       the-empty-stream 
       (cons-stream 
         (apply proc (map stream-car argstreams)) 
         (apply stream-map  
                (cons proc (map stream-cdr argstreams)))))) 

(define (stream-for-each proc s)
  (if (stream-null? s)
      'done
      (begin 
        (proc (stream-car s))
        (stream-for-each proc 
                         (stream-cdr s)))))

(define (display-stream s)
  (stream-for-each display-line s))

(define (display-line x)
  (newline)
  (display x))

(define (stream-car stream) 
  (car stream))

(define (stream-cdr stream) 
  (force (cdr stream)))

(define (stream-enumerate-interval low high)
  (if (> low high)
      the-empty-stream
      (cons-stream
       low
       (stream-enumerate-interval (+ low 1)
                                  high))))


(define (add-streams s1 s2) 
  (stream-map + s1 s2))

(define (mul-streams s1 s2) 
  (stream-map * s1 s2))

(define ones (cons-stream 1 ones))

(define integers 
  (cons-stream 1 (add-streams ones integers)))
; 1 2 6 24 Fac(N+1) = Fac(N)
;car factorials = 1;
;cadr factorials = 2;
;cadr factorials = car factorials * car integers; so integers starts with 2 
(define factorials 
  (cons-stream 1 (mul-streams factorials (stream-cdr integers))))

(stream-ref factorials 0)
