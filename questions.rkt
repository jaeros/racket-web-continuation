#lang web-server/insta
(require web-server/templates)

(define (start initial-request)
  (local [(define result (list (question-1) (question-2) (question-3) (question-4)))]
    (send/back (response/xexpr `(html (head (title "Your results"))
                                      (body (p "You answered " ,result ;TODO figure out how to print list
                                               )
                                            ))))))


(define (question-1)
  (local [(define req (send/suspend (lambda (k-url)
                                      (response/xexpr 
                                       `(html (head (title "Enter number"))
                                              (body
                                               (form ([action ,k-url])
                                                     "What is the best controller for shooters?"(br)
                                                     "Arcade Stick" (input ([type "radio"][value "Arcade Stick"][name "answer"])) (br)
                                                     "Gamepad" (input ([type "radio"][value "Gamepad"][name "answer"])) (br)
                                                     "Keyboard" (input ([type "radio"][value "Keyboard"][name "answer"])) (br)
                                                     (input ([type "submit"])))))))))
          (define bindings (request-bindings req))
          (define value (extract-binding/single 'answer bindings))]
    value ; return the value
  
    ))

(define (question-2)
  (local [(define req (send/suspend (lambda (k-url)
                                      (response/xexpr 
                                       `(html (head (title "Question 2"))
                                              (body
                                               (form ([action ,k-url])
                                                     "What is the best gate?"(br)
                                                     "Circular" (input ([type "radio"][value "Circular"][name "answer"])) (br)
                                                     "Octangonal" (input ([type "radio"][value "Octangonal"][name "answer"])) (br)
                                                     "Square" (input ([type "radio"][value "Square"][name "answer"])) (br)
                                                     (input ([type "submit"])))))))))
          (define bindings (request-bindings req))
          (define value (extract-binding/single 'answer bindings))]
    value ; return the value
    ))

(define (question-3)
  (local [(define req (send/suspend (lambda (k-url)
                                      (response/xexpr 
                                       `(html (head (title "Question 3"))
                                              (body
                                               (form ([action ,k-url])
                                                     "Do you prefer horizontal or vertical scrolling?"(br)
                                                     "Horizontal" (input ([type "radio"][value "Horizontal"][name "answer"])) (br)
                                                     "Vertical" (input ([type "radio"][value "Vertical"][name "answer"])) (br)
                                                     (input ([type "submit"])))))))))
          (define bindings (request-bindings req))
          (define value (extract-binding/single 'answer bindings))]
    value ; return the value
    ))

(define (question-4)
  (local [(define req (send/suspend (lambda (k-url)
                                      (response/xexpr 
                                       `(html (head (title "Question 4"))
                                              (body
                                               (form ([action ,k-url])
                                                     "What is the best horizontal shooter?"(br)
                                                     "Gradius V" (input ([type "radio"][value "GV"][name "answer"])) (br)
                                                     "Sexy Parodius" (input ([type "radio"][value "SP"][name "answer"])) (br)
                                                     "Border Down" (input ([type "radio"][value "BD"][name "answer"])) (br)
                                                     "Deathsmiles" (input ([type "radio"][value "D"][name "answer"])) (br)
                                                     (input ([type "submit"])))))))))
          (define bindings (request-bindings req))
          (define value (extract-binding/single 'answer bindings))]
    value ; return the value
    ))

(define (question-5)
  (local [(define req (send/suspend (lambda (k-url)
                                      (response/xexpr 
                                       `(html (head (title "Question 4"))
                                              (body
                                               (form ([action ,k-url])
                                                     "What is the best horizontal shooter?"(br)
                                                     "Gradius V" (input ([type "radio"][value "GV"][name "answer"])) (br)
                                                     "Sexy Parodius" (input ([type "radio"][value "SP"][name "answer"])) (br)
                                                     "Border Down" (input ([type "radio"][value "BD"][name "answer"])) (br)
                                                     "Deathsmiles" (input ([type "radio"][value "D"][name "answer"])) (br)
                                                     (input ([type "submit"])))))))))
          (define bindings (request-bindings req))
          (define value (extract-binding/single 'answer bindings))]
    value ; return the value
    ))
