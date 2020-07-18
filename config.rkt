#lang racket
(provide options)
(require (prefix-in palette- "palette.rkt"))


; This area is user-adjustable.
; Width and height determine the size of the wallpaper.
; The margins let you push the pattern down and/or right. Use if it gets in the way of a dock
; Box size and gap adjusts the appearance of the pattern
; Shadow size and darkness adjust the appearance of the box-shadow under the pattern
; Palettes let you pick the colours to use.
;  Palettes are predefined in palette.rkt.
;  To use a predefined palette, append "palette-" to it's name. For example: "palette-darkblue"
;  To make a custom one, change the line like so:
;  (palette (r g b) (r g b)
;  Where the first rgb set is the background and the second is the foreground.
(define options
  `((width . 1920)               ; Width of the wallpaper,                in pixels
    (height . 1080)              ; Height of the wallpaper,               in pixels
    (horizontal-margin . 0)      ; Extra padding from the right,          in pixels
    (vertical-margin . 0)        ; Extra padding from the top,            in pixels
    (box-size . 80)              ; Size of the box in the pattern,        in pixels
    (box-gap . 20)               ; Size of the gap between the boxes,     in pixels
    (shadow-size . 15)           ; Size of the shadow cast by the boxes,  in pixels
    (shadow-darkness . 0.5)      ; Darkness of the shadow,                from 0 to 1
    (palette . ,palette-magenta))) ; Colour palette