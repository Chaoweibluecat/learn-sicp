(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (* (car things) (car things))
                    answer))))
  (iter items '()))
(square-list (list 1 2 3 4))
; iter (2 3), (1,nil) => iter (3), (2,1) => iter (), (3,2,1) => return answer
; should append to tail,rather than insert front
; the list 'things' keeps popping head off,     


;change cons order, doesn't work either;
;first element shouldn't be list (list is essentially Pair<T,Pair<T,Pair<..,nil>>)
;the first ele should be the elment list tends to contain;
;otherwise results in something like Pair<Pair<..,nil>,T); thats not a list
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square 
                     (car things))))))
  (iter items nil))
