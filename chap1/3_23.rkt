;O(1) ,have to go with doubly linkedlist
(define (front-ptr deque) (car deque))
(define (rear-ptr deque) (cdr deque))
(define (set-front-ptr! deque item) 
  (set-car! deque item))
(define (set-rear-ptr! deque item) 
  (set-cdr! deque item))
(define (empty-deque? deque) 
  (null? (front-ptr deque)))
(define (make-deque) (cons '() '()))

(define (rear-insert-deque! deque item)
  (let ((new-pair (list item '() '())))
    (cond ((empty-deque? deque)
           (set-front-ptr! deque new-pair)
           (set-rear-ptr! deque new-pair)
           deque)
          (else (set-car! (cddr (rear-ptr deque))
                          new-pair)
                (set-car! (cdr new-pair) (rear-ptr deque))
                (set-rear-ptr! deque new-pair)
                deque))))

(define (rear-delete-deque! deque)
   (cond ((empty-deque? deque)
         (error "DELETE! called with 
                 an empty queue" deque))
        (else ;设置新的尾节点为prevnode
              (set-rear-ptr! deque (cadr (rear-ptr deque)))
              ;设置新的尾节点的next为nil
               (set-car! (cddr (rear-ptr deque)) '())
              deque)))

(define (print deque)
  (define (print-node node)
  (if (null? node)
    '()
    (begin (display (car node)) (print-node (caddr node)))))
    (print-node (car deque)))
  
(define (rev-print deque)
  (define (rev-print-node node)
  (if (null? node)
    '()
    (begin (display (car node)) (rev-print-node (cadr node)))))
    (rev-print-node (cdr deque)))

;头插，set new pair cdr => front & front => new pair

(define deq (make-deque))
(rear-insert-deque! deq 1)
(rear-insert-deque! deq 2)
(rear-insert-deque! deq 3)
(print deq)
(rear-delete-deque! deq)
(print deq)
