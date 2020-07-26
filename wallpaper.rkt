#lang racket
(require pict)
(require "config.rkt")

(define (draw-background o)
  (freeze
   (let ((width  (cdr (assoc 'width o)))
         (height (cdr (assoc 'height o)))
         (color  (car (cdr (assoc 'palette o)))))
     (colorize (filled-rectangle width height) color))))

(define (draw-box o)
  (freeze
   (let* ((size          (cdr (assoc 'box-size o)))
          (color         (car (cdr (cdr (assoc 'palette o)))))
          (shadow-amount (cdr (assoc 'shadow-darkness o)))
          (shadow-size   (cdr (assoc 'shadow-size o)))
          (box           (colorize (filled-rectangle size size #:draw-border? #f) color))
          (shadow        (cellophane box shadow-amount)))
     (inset (pin-under box 10 10 shadow) 0 0 shadow-size shadow-size))))

(define (draw-box-line o n)
  (freeze
   (let ((gap (- (cdr (assoc 'box-gap o)) (cdr (assoc 'shadow-size o)))))
     (apply ht-append gap (make-list n (draw-box o))))))

(define (draw-box-pattern o)
  (freeze
   (let ((gap (- (cdr (assoc 'box-gap o)) (cdr (assoc 'shadow-size o)))))
     (vr-append gap (draw-box-line o 3) (draw-box-line o 2) (draw-box-line o 1)))))

(define (draw-wallpaper o)
  (freeze
   (let* ((horizontal-margin (cdr (assoc 'horizontal-margin o)))
         (vertical-margin (cdr (assoc 'vertical-margin o)))
         (width (cdr (assoc 'width o)))
         (height (cdr (assoc 'height o)))
         (box-size (cdr (assoc 'box-size o)))
         (gap (cdr (assoc 'box-gap o))))
     (pin-over (draw-background o)
               (- width horizontal-margin (* 3 box-size) (* 3 gap))
               (+ gap vertical-margin)
               (draw-box-pattern o)))))

(define (main o)
  (send (pict->bitmap (draw-wallpaper o)) save-file (format "~a.png" (current-seconds)) 'png)
  (displayln "Wallpaper has been saved to wallpaper.png"))

(main options)