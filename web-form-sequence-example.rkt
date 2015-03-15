#lang web-server/insta

(define (start initial-request)
  (local [(define result (+ (get-number "Enter a number: ")
                            (get-number "Enter another number: ")))]
    (send/back (response/xexpr `(html (head (title "Your result"))
                                      (body (p "The sum is " ,(number->string result)
                                               )))))))

(define (get-number prompt)
  (local [(define req (send/suspend (lambda (k-url)
                                      (response/xexpr 
                                       `(html (head (title "Enter number"))
                                              (body
                                               (form ([action ,k-url])
                                                     ,prompt
                                                     (input ([name "number"]))
                                                     (input ([type "submit"])))))))))
          (define bindings (request-bindings req))
          (define value (extract-binding/single 'number bindings))]
    (string->number value) ; return the value as a number
    ))

