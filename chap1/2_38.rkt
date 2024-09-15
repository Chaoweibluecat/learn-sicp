#lang racket
;fold right和fold left相同需要op操作满足交换率,迭代顺序左到右,递归顺序右到左;
;Op has to be associative for fold-left and fold-right to be equivalent

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op 
                      initial 
                      (cdr sequence)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

;(/ 1 (/ 2 (/ 3 1))) 最后一次递归出来initial，是作为被除数
(fold-right / 1 (list 1 2 3))
; (/ (/ (/ 1 1) 2) 3)
(fold-left / 1 (list 1 2 3))
(accumulate list '() (list 1 2 3))
(fold-fold-right  list '() (list 1 2 3))


