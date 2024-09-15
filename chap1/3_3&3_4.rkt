
; make-account返回一个procedure（dispatch）,接受两个参数（passwd和操作）,
;并返回另一个procedure,接受dispatch到的函数的入参
;注意这里返回call-the-cops或者返回lamdda表达式(lambda (x) "Incorrect password")
;都是返回一个接受入参（实际忽略）并返回报错的信息，这是为了解释器
;能正确执行((acc 'some-other-password 'deposit) 50)这样的语句
(define (make-account balance passwd)
(let ((err-passwd 0))
  (define (call-the-cops ignore) "The cops have been caled!")
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance 
                     (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch pswd op)
    (cond ((not (eq? pswd passwd))
     (begin 
     (set! err-passwd (+ err-passwd 1))
        (if (> err-passwd 2)
        call-the-cops
        (lambda (x) "Incorrect password"))))
          ((eq? op 'withdraw) withdraw)
          ((eq? op 'deposit) deposit)
          (else (error "Unknown request: 
                 MAKE-ACCOUNT" op))))
  dispatch))


(define acc 
  (make-account 100 'secret-password))

((acc 'secret-password 'withdraw) 40)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
