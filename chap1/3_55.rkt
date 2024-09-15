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


(define ones (cons-stream 1 ones))
(define (add-streams s1 s2) 
  (stream-map + s1 s2))

(define integers 
  (cons-stream 1 (add-streams ones integers)))

; *有重复计算，新的流返回第一个元素和入参一致，cdr 是一个新流；
; 返回结果的递归关系为res(N+1) = res(N) + s[N+1];
; res第N+1个元素 = res第N个元素 + stream第N+1个元素
(define (partial-sum stream)
    (cons-stream (stream-car stream)
     (add-streams  (partial-sum stream) (stream-cdr stream))))

;更优雅的做法
;原有stream基础上,res1 = 第一个元素+0，res2=第二个元素+res1,res3=s3+res2
;把res看作是s和res-1两个流的和
 (define (partial-sums s) 
   (add-streams s (cons-stream 0 (partial-sums s)))) 
  
  
 (define (partial-sums s) 
   (define ps (add-streams s (cons-stream 0 ps))) 
   ps) 


(stream-ref (partial-sum integers) 10)