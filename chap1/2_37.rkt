(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op 
                      initial 
                      (cdr sequence)))))
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op init (map (lambda (sub-seq) (car sub-seq)) seqs))
            (accumulate-n op init (map (lambda (sub-seq) (cdr sub-seq)) seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (row) (dot-product v row) m)))

(define (transpose mat)
  (accumulate-n (lambda (ele res) (cons ele res)) '() mat))

(transpose (list (list 1 2 3 4) (list 4 5 6 7)))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row) (matrix-*-vector cols row)) m)))
