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

;make-joint returns a procedure acted just like make-account
;接受passwd和op，返回一个接受金额的procedure
;可以返回的这个procedure接受参数后就是用原生密码调用保存的原生account procedire
(define (make-joint account passwd newpwd)
    (lambda (input-pwswd op) 
    (if (not (eq? input-pwswd newpwd))
        (lambda (x) "Incorrect password")
        (account passwd op))) )

(define peter-acc (make-account 100 'open-sesame))

(define paul-acc
  (make-joint peter-acc 
              'open-sesame 
              'rosebud))
((paul-acc 'rosebud 'deposit) 50)

