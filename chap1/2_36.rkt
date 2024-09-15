(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op 
                      initial 
                      (cdr sequence)))))
;list of list 每次递归取出当前sub list的第一个元素，accumulate,构成当前位置的输出
;并使用cdr sublist,取出下一次递归的list<List>
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op init (map (lambda (sub-seq) (car sub-seq)) seqs))
            (accumulate-n op init (map (lambda (sub-seq) (cdr sub-seq)) seqs)))))

(accumulate-n + 0 (list (list 1 2 3) (list 4 5 6) (list 6 7 8)))