#lang racket
(provide (all-defined-out))

(define (->rgb s) ;#rrggbb
  (list
   (string->number (substring s 1 3) 16)
   (string->number (substring s 3 5) 16)
   (string->number (substring s 5 7) 16)))

(define red      (list (->rgb "#ffebee") (->rgb "#b71c1c")))
(define green    (list (->rgb "#e8f5e9") (->rgb "#2e7d32")))
(define blue     (list (->rgb "#e3f2fd") (->rgb "#1565c0")))

(define cyan     (list (->rgb "#e0f7fa") (->rgb "#0077a7")))
(define magenta  (list (->rgb "#f3e5f5") (->rgb "#7b1fa2")))
(define yellow   (list (->rgb "#fffde7") (->rgb "#fbc02d")))

(define gray     (list (->rgb "#fafafa") (->rgb "#757575")))
(define bluegray (list (->rgb "#eceff1") (->rgb "#546e7a")))
(define brown    (list (->rgb "#efebe9") (->rgb "#795548")))
(define white    (list (->rgb "#ffffff") (->rgb "#000000")))
(define retro    (list (->rgb "#9fa8da") (->rgb "#3949ab")))
