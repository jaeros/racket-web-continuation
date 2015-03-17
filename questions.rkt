#lang web-server/insta
(require web-server/templates)

(define (start initial-request)
  (local [(define answers (question-1 (list)))]
    (send/back (response 
                200 #"OK"
                (current-seconds) TEXT/HTML-MIME-TYPE
                empty
                (lambda (op) (write-bytes (string->bytes/utf-8 (format-response answers)) op))))))

(define (format-response answers)
   (string-append 
    "<html>"
       "<head>"
          "<title>Your results</title>"
       "</head>"
       "<body>"
          "<p>You answered:</p>"
           (format-answers answers) 
       "</body>"
    "</html>"))

(define (format-answers answers)
  (foldl
   (lambda (answer result) 
     (string-append result (string-append "<p>" answer "</p>")))
   ""
   answers))


(define (question-1 answers)
  (local [(define req (send/suspend (lambda (k-url)
                                      (response/xexpr 
                                       `(html (head (title "Question 1"))
                                              (body
                                               (form ([action ,k-url])
                                                     "1. What is the best controller for shooters?"(br)
                                                     (input ([type "radio"][value "Arcade Stick"][name "answer"][checked "checked"])) (label "Arcade Stick") (br)
                                                     (input ([type "radio"][value "Gamepad"][name "answer"])) (label "Gamepad") (br)
                                                     (input ([type "radio"][value "Keyboard"][name "answer"])) (label "Keyboard")(br)
                                                     (input ([type "submit"])))))))))
          (define bindings (request-bindings req))
          (define value (extract-binding/single 'answer bindings))]
    (cond
      [(equal? "Arcade Stick" value) (question-2 (append  answers (list "1. What is the best controller for shooters?" value)))]
      [else (question-3 (append  answers (list "1. What is the best controller for shooters?" value)))])
    ))

(define (question-2 answers)
  (local [(define req (send/suspend (lambda (k-url)
                                      (response/xexpr 
                                       `(html (head (title "Question 2"))
                                              (body
                                               (form ([action ,k-url])
                                                     "2. What is the best gate?"(br)
                                                     (input ([type "radio"][value "Circular"][name "answer"][checked "checked"])) (label "Circular") (br)
                                                     (input ([type "radio"][value "Octangonal"][name "answer"])) (label "Octangonal") (br)
                                                     (input ([type "radio"][value "Square"][name "answer"])) (label "Square")(br)
                                                     (input ([type "submit"])))))))))
          (define bindings (request-bindings req))
          (define value (extract-binding/single 'answer bindings))]
    (cond
      [else (question-3 (append  answers (list "2. What is the best gate?" value)))])
    ))

(define (question-3 answers)
  (local [(define req (send/suspend (lambda (k-url)
                                      (response/xexpr 
                                       `(html (head (title "Question 3"))
                                              (body
                                               (form ([action ,k-url])
                                                     "3. Do you prefer horizontal or vertical scrolling?"(br)
                                                     (input ([type "radio"][value "Horizontal"][name "answer"][checked "checked"])) (label "Horizontal")(br)
                                                     (input ([type "radio"][value "Vertical"][name "answer"])) (label "Vertical") (br)
                                                     (input ([type "submit"])))))))))
          (define bindings (request-bindings req))
          (define value (extract-binding/single 'answer bindings))]
    (cond
      [(equal? "Horizontal" value) (question-4 (append  answers (list "3. Do you prefer horizontal or vertical scrolling?" value)))]
      [else (question-5 (append  answers (list "3. Do you prefer horizontal or vertical scrolling?" value)))])
    ))

(define (question-4 answers)
  (local [(define req (send/suspend (lambda (k-url)
                                      (response/xexpr 
                                       `(html (head (title "Question 4"))
                                              (body
                                               (form ([action ,k-url])
                                                     "4. What is the best horizontal shooter?"(br)
                                                     (input ([type "radio"][value "Gradius V"][name "answer"][checked "checked"]))(label "Gradius V") (br)
                                                     (input ([type "radio"][value "Sexy Parodius"][name "answer"]))(label "Sexy Parodius") (br)
                                                     (input ([type "radio"][value "Border Down"][name "answer"]))(label "Border Down") (br)
                                                     (input ([type "radio"][value "Deathsmiles"][name "answer"]))(label "Deathsmiles") (br)
                                                     (input ([type "radio"] [value "other"] [name "answer"])) (label "Other: ") (input ([name "other"])) (br)
                                                     (input ([type "submit"])))))))))
          (define bindings (request-bindings req))
          (define value 
            (if (equal? (extract-binding/single 'answer bindings) "other")
                (extract-binding/single 'other bindings)
                (extract-binding/single 'answer bindings)))]
    (cond
      [else (append  answers (list "4. What is the best horizontal shooter?" value))])
    ))

(define (question-5 answers)
  (local [(define req (send/suspend (lambda (k-url)
                                      (response/xexpr 
                                       `(html (head (title "Question 5"))
                                              (body
                                               (form ([action ,k-url])
                                                     "5. Which is the better developer?"(br)
                                                     (input ([type "radio"][value "Cave"][name "answer"][checked "checked"]))(label "Cave") (br)
                                                     (input ([type "radio"][value "Treasure"][name "answer"]))(label "Treasure") (br)
                                                     (input ([type "submit"])))))))))
          (define bindings (request-bindings req))
          (define value (extract-binding/single 'answer bindings))]
    (cond
      [(equal? "Cave" value) (question-6 (append  answers (list "5. Which is the better developer?" value)))]
      [else (question-7 (append  answers (list "5. Which is the better developer?" value)))])
    ))

(define (question-6 answers)
  (local [(define req (send/suspend (lambda (k-url)
                                      (response/xexpr 
                                       `(html (head (title "Question 6"))
                                              (body
                                               (form ([action ,k-url])
                                                     "6. What is cave's best release?"(br)
                                                     (input ([type "radio"][value "Dodonpachi"][name "answer"][checked "checked"]))(label "Dodonpachi") (br)
                                                     (input ([type "radio"][value "Ketsui kizuna jigoku tachi"][name "answer"]))(label "Ketsui kizuna jigoku tachi") (br)
                                                     (input ([type "radio"][value "Mushihimesama Futari 1.5"][name "answer"]))(label "Mushihimesama Futari 1.5") (br)
                                                     (input ([type "radio"] [value "other"] [name "answer"])) (label "Other: ") (input ([name "other"])) (br)
                                                     (input ([type "submit"])))))))))
          (define bindings (request-bindings req))
          (define value 
            (if (equal? (extract-binding/single 'answer bindings) "other")
                (extract-binding/single 'other bindings)
                (extract-binding/single 'answer bindings)))]
    (cond
      [else (append  answers (list "6. What is cave's best release?" value))])
    ))

(define (question-7 answers)
  (local [(define req (send/suspend (lambda (k-url)
                                      (response/xexpr 
                                       `(html (head (title "Question 7"))
                                              (body
                                               (form ([action ,k-url])
                                                     "7. What is Treasure's best release?"(br)
                                                     (input ([type "radio"][value "Radiant Silvergun"][name "answer"][checked "checked"])) (label "Radiant Silvergun") (br)
                                                     (input ([type "radio"][value "Sin and Punishment"][name "answer"]))(label "Sin and Punishment") (br)
                                                     (input ([type "radio"][value "SP"][name "Ikaruga"]))(label "Ikaruga") (br)
                                                     (input ([type "radio"][value "Sin and Punishment: Star Successor"][name "answer"]))(label "Sin and Punishment: Star Successor") (br)
                                                     (input ([name "other"])) (input ([type "radio"] [value "other"] [name "answer"])) (br)
                                                     (input ([type "submit"])))))))))
          (define bindings (request-bindings req))
          (define value 
            (if (equal? (extract-binding/single 'answer bindings) "other")
                (extract-binding/single 'other bindings)
                (extract-binding/single 'answer bindings)))]
    (cond
      [else (append answers (list "7. What is Treasure's best release?" value))])
    ))