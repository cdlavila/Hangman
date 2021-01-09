;***************************JUEGO DE AHORCADO****************************
;************Presentado por: Carlos Daniel Londoño Avila*****************
;*****************************Programación I*****************************
;------------------------------------------------------------------------------

(require (lib "graphics.ss" "graphics" ) )
(open-graphics)

;Creamos una ventana para el juego.
(define ventana (open-viewport "Ahorcado" 500 650))

;Insertamos una imagen de inicio para el juego.
(define (pantalla1)
((draw-pixmap ventana) "ahorcado.png" (make-posn 0.0 0.0))
(sleep 2)
(clear-viewport ventana)
((draw-pixmap ventana) "menú.png" (make-posn 0.0 0.0)))

;----------AQUI DEFINIMOS TODAS LAS PALABRAS DEL JUEGO------------
(define mivector (vector "koala"
                         "cerdo"
                         "perro"
                         "gato"
                         "conejo"
                         "leon"
                         "puma"
                         "caballo"
                         "tiburon"
                         "raton"
                         "aguila"
                         "burro"
                         "jirafa"
                         "mico"
                         "elefante"
                         "loro"
                         "pajaro"
                         "paloma"
                         "oso"
                         "tigre"
                         "serpiente"
                         "cocodrilo"
                         "gorila"
                         "leopardo"
                         "jaguar"
                         "vaca"
                         "pez"
                         "buo"
                         "sapo"
                         "araña"
                         "grillo"
                         "pato"
                         "gallina"))
(define aleatorio (random 33))
                      
;--------------------ESTA FUNCIÓN LEE EL CLICK EN EL MENÚ-----------------------

(define (hacer-click-menu click cad1 cad2 cad3)
  (leer_click_menu (get-mouse-click ventana) cad1 cad2 cad3)
  )
(define (leer_click_menu posicion cad1 cad2 cad3)
  (menu (mouse-click-posn posicion) cad1 cad2 cad3)
  )
(define (menu posicion cad1 cad2 cad3)
  (begin
    (enviar (posn-x posicion) (posn-y posicion) cad1 (make-string (string-length cad1) #\- ) (make-string (string-length cad1) #\ ))
    )
  )
(define (enviar posn-x posn-y cad1 cad2 cad3)
      (if (and (>= posn-x 170) (<= posn-x 313) 
               (>= posn-y 173) (<= posn-y 248)
             )
             (begin
              ((clear-viewport ventana))
              (pantalla cad1 cad2 cad3)   
              (hacer-click-letra 7 cad1 cad2 cad3)
             )
          (if (and (>= posn-x 173) (<= posn-x 313) 
                   (>= posn-y 283) (<= posn-y 354)
                 )
              (begin
                ((clear-viewport ventana))
                ((draw-pixmap ventana) "ayuda.png" (make-posn 0.0 0.0))
                (hacer-click-ayuda 0)
               )
              (if (and (>= posn-x 170) (<= posn-x 313) 
                       (>= posn-y 392) (<= posn-y 461)
                    )
                  (begin
                    ((clear-viewport ventana))
                    ((draw-pixmap ventana) "creditos.png" (make-posn 0.0 0.0))
                    (hacer-click-creditos 0)
                    )
                  (if (and (>= posn-x 170) (<= posn-x 313) 
                           (>= posn-y 496) (<= posn-y 568)
                        )
                      (close-viewport ventana)
                      (hacer-click-menu 0 cad1 cad2 cad3)
                      )
                  )
              )
          )
  )
;------------ESTA FUNCIÓN LEE EL CLICK EN LA VENTANA DE AYUDA-------------

(define (enviar2 posn-x posn-y)
      (if (and (>= posn-x 163) (<= posn-x 325) 
               (>= posn-y 554) (<= posn-y 628)
             )
          (begin
            (clear-viewport ventana)
            ((draw-pixmap ventana) "menú.png" (make-posn 0.0 0.0))
            (hacer-click-menu 0(vector-ref mivector aleatorio) "" "")
            )
          (hacer-click-ayuda 0)
       )
  )
(define (ayuda posicion)
  (begin
    (enviar2 (posn-x posicion) (posn-y posicion))
    )
  )
(define (leer_click_ayuda posicion)
  (ayuda (mouse-click-posn posicion))
  )
(define (hacer-click-ayuda click)
  (leer_click_ayuda (get-mouse-click ventana))
  )
;------------ESTA FUNCIÓN LEE EL CLICK EN LA VENTANA DE CREDITOS-------------

(define (enviar3 posn-x posn-y)
      (if (and (>= posn-x 165) (<= posn-x 326) 
               (>= posn-y 517) (<= posn-y 600)
             )
          (begin
            (clear-viewport ventana)
            ((draw-pixmap ventana) "menú.png" (make-posn 0.0 0.0))
            (hacer-click-menu 0 (vector-ref mivector aleatorio) "" "")
           )
          (hacer-click-creditos 0)
       )
  )
(define (creditos posicion)
  (begin
    (enviar3 (posn-x posicion) (posn-y posicion))
    )
  )
(define (leer_click_creditos posicion)
  (creditos (mouse-click-posn posicion))
  )
(define (hacer-click-creditos click)
  (leer_click_creditos (get-mouse-click ventana))
  )

;***********AQUI HACEMOS TODOS LOS GRAFICOS DE LA VENTANA DE JUEGO********
(define (pantalla cad1 cad2 cad3)
( (draw-pixmap ventana) "fondo.jpg" (make-posn 0.0 0.0))
( (draw-solid-rectangle ventana ) (make-posn 200 100 ) 8 150 "white" )
( (draw-solid-rectangle ventana ) (make-posn 208 100 ) 50 8  "white" )
( (draw-solid-rectangle ventana ) (make-posn 258 100 ) 8 20  "white" )
( (draw-solid-rectangle ventana ) (make-posn 125 250 ) 150 8 "white" )
  
  ;************************primera linea de teclado***********************
  
  ( (draw-rectangle ventana ) (make-posn 50 350 ) 40  40 "white" )
  ( (draw-rectangle ventana ) (make-posn 90 350 ) 40 40  "white" )
  ( (draw-rectangle ventana ) (make-posn 130 350 ) 40 40 "white" )
  ( (draw-rectangle ventana ) (make-posn 170 350 ) 40 40 "white" )
  ( (draw-rectangle ventana ) (make-posn 210 350 ) 40 40 "white" )
  ( (draw-rectangle ventana ) (make-posn 250 350 ) 40 40 "white" )
  ( (draw-rectangle ventana ) (make-posn 290 350 ) 40 40 "white" )
  ( (draw-rectangle ventana ) (make-posn 330 350 ) 40 40 "white" )
  ( (draw-rectangle ventana ) (make-posn 370 350 ) 40 40 "white" )
  ( (draw-rectangle ventana ) (make-posn 410 350 ) 40 40 "white" )
  
  ;**********************seguna linea de teclado**************************
  
  ( (draw-rectangle ventana ) (make-posn 50 390 ) 40  40 "white" )
  ( (draw-rectangle ventana ) (make-posn 90 390 ) 40  40 "white" )
  ( (draw-rectangle ventana ) (make-posn 130 390 ) 40  40 "white" )
  ( (draw-rectangle ventana ) (make-posn 170 390 ) 40  40 "white" )
  ( (draw-rectangle ventana ) (make-posn 210 390 ) 40  40 "white" )
  ( (draw-rectangle ventana ) (make-posn 250 390 ) 40  40 "white" )
  ( (draw-rectangle ventana ) (make-posn 290 390 ) 40  40 "white" )
  ( (draw-rectangle ventana ) (make-posn 330 390 ) 40  40 "white" )
  ( (draw-rectangle ventana ) (make-posn 370 390 ) 40  40 "white" )
  ( (draw-rectangle ventana ) (make-posn 410 390 ) 40  40 "white" )

  ;*********************tercera linea de teclado*************************

  ((draw-rectangle ventana ) (make-posn 50 430 ) 40 40 "white" )
  ((draw-rectangle ventana ) (make-posn 90 430 ) 40 40 "white" )
  ((draw-rectangle ventana ) (make-posn 130 430 ) 40 40 "white" )
  ((draw-rectangle ventana ) (make-posn 170 430 ) 40 40 "white" )
  ((draw-rectangle ventana ) (make-posn 210 430 ) 40 40 "white" )
  ((draw-rectangle ventana ) (make-posn 250 430 ) 40 40 "white" )
  ((draw-rectangle ventana ) (make-posn 290 430 ) 40 40 "white" )
  ((draw-rectangle ventana ) (make-posn 330 430 ) 40 40 "white" )
  ((draw-rectangle ventana ) (make-posn 370 430 ) 40 40 "white" )
  ((draw-rectangle ventana ) (make-posn 410 430 ) 40 40 "white" )

  ;************************Letras del teclado *****************************
  
    ;//primera linea de LETRAS del teclado\\
  
  ((draw-string ventana ) (make-posn 63 375) "Q" "white")
  ((draw-string ventana ) (make-posn 103 375) "W" "white")
  ((draw-string ventana ) (make-posn 143 375) "E" "white")
  ((draw-string ventana ) (make-posn 183 375) "R" "white")
  ((draw-string ventana ) (make-posn 223 375) "T" "white")
  ((draw-string ventana ) (make-posn 263 375) "Y" "white")
  ((draw-string ventana ) (make-posn 303 375) "U" "white")
  ((draw-string ventana ) (make-posn 343 375) "I" "white")
  ((draw-string ventana ) (make-posn 383 375) "O" "white")
  ((draw-string ventana ) (make-posn 423 375) "P" "white")

  ;//segunda linea de LETRAS de teclado\\

  ((draw-string ventana ) (make-posn 63 415) "A" "white")
  ((draw-string ventana ) (make-posn 103 415) "S" "white")
  ((draw-string ventana ) (make-posn 143 415) "D" "white")
  ((draw-string ventana ) (make-posn 183 415) "F" "white")
  ((draw-string ventana ) (make-posn 223 415) "G" "white")
  ((draw-string ventana ) (make-posn 263 415) "H" "white")
  ((draw-string ventana ) (make-posn 303 415) "J" "white")
  ((draw-string ventana ) (make-posn 343 415) "K" "white")
  ((draw-string ventana ) (make-posn 383 415) "L" "white")
  ((draw-string ventana ) (make-posn 423 415) "Ñ" "white")

 ;//tercera linea de LETRAS de teclado 

  ((draw-string ventana ) (make-posn 103 455) "Z" "white")
  ((draw-string ventana ) (make-posn 143 455) "X" "white")
  ((draw-string ventana ) (make-posn 183 455) "C" "white")
  ((draw-string ventana ) (make-posn 223 455) "V" "white")
  ((draw-string ventana ) (make-posn 263 455) "B" "white")
  ((draw-string ventana ) (make-posn 303 455) "N" "white")
  ((draw-string ventana ) (make-posn 343 455) "M" "white")

  ((draw-string ventana) (make-posn 390 20) (make-string 7 #\V) "white")
  ((draw-string ventana) (make-posn 200 300) cad2 "white")
  ((draw-string ventana) (make-posn 205 305) cad3 "white")
  ((draw-pixmap ventana) "salirdeljuego.png" (make-posn 50 505))
  ((draw-pixmap ventana) "volver.png" (make-posn 270 505))
  ((draw-pixmap ventana) "jugardenuevo.png" (make-posn 160 570))
)

;----------AQUI VAMOS DESCONTANDO LAS VIDAS CADA QUE EL JUGADOR SE EQUIVOQUE------------

(define (recorrerpalabra letra vidas cad1 cad2 cad3 tam pos existe)
  (if (equal? cad1 cad3)
      (begin
        ((draw-pixmap ventana) "rectangulo.png" (make-posn 199 280));este rectangulo debi ponerlo para tapar las cadenas que me seguian
        ((draw-string ventana) (make-posn 200 295) cad3 "white")    ;apareciendo en pantalla, lo inserte por consejo de profesor, en todos
        ((draw-string ventana) (make-posn 10 15) cad1 "white")      ;los "if" desde aqui, hacia abajo.
        ((draw-string ventana) (make-posn 180 330) "GANASTE" "white")
        (hacer-click-letra 0 cad1 cad2 cad3)
       )
      (if (< pos tam)
        (if (char=? (string-ref cad1 pos) letra)
            (begin
              (string-set! cad3 pos letra)
              (recorrerpalabra letra vidas cad1 cad2 cad3 tam (+ pos 1) (+ existe 1))
             )
            (recorrerpalabra letra vidas cad1 cad2 cad3 tam (+ pos 1) existe)
          )
        (if (> existe 0)
            (begin
              ((draw-pixmap ventana) "rectangulo.png" (make-posn 199 280)) 
              ((draw-string ventana) (make-posn 200 295) cad3 "white")
              ((clear-string ventana) (make-posn 390 20) (make-string vidas #\V))
              ((draw-pixmap ventana) "rectangulo.png" (make-posn 390 9))
              ((draw-string ventana) (make-posn 390 20) (make-string vidas #\V) "white")
              (hacer-click-letra vidas cad1 cad2 cad3)
              )
              (if (= vidas 7)
                  (begin
                  ((draw-pixmap ventana) "cabeza.png" (make-posn 240 119))
                  ((draw-pixmap ventana) "rectangulo.png" (make-posn 199 280))
                  ((draw-string ventana) (make-posn 200 295) cad3 "white")
                  ((clear-string ventana) (make-posn 390 20) (make-string vidas #\V))
                  ((draw-pixmap ventana) "rectangulo.png" (make-posn 390 9))
                  ((draw-string ventana) (make-posn 390 20) (make-string (- vidas 1) #\V) "white")
                  (hacer-click-letra (- vidas 1) cad1 cad2 cad3)
                )
               (if (= vidas 6)
                  (begin
                  ((draw-pixmap ventana) "tronco.png" (make-posn 252 162))
                  ((draw-pixmap ventana) "rectangulo.png" (make-posn 199 280))
                  ((draw-string ventana) (make-posn 200 295) cad3 "white")
                  ((clear-string ventana) (make-posn 390 20) (make-string vidas #\V))
                  ((draw-pixmap ventana) "rectangulo.png" (make-posn 390 9))
                  ((draw-string ventana) (make-posn 390 20) (make-string (- vidas 1) #\V)"white")
                  (hacer-click-letra (- vidas 1) cad1 cad2 cad3)
               )
               (if (= vidas 5)
                  (begin
                   ((draw-pixmap ventana) "pierna1.png" (make-posn 245 202))
                  ((draw-pixmap ventana) "rectangulo.png" (make-posn 199 280))
                  ((draw-string ventana) (make-posn 200 295) cad3 "white")
                  ((clear-string ventana) (make-posn 390 20) (make-string vidas #\V))
                  ((draw-pixmap ventana) "rectangulo.png" (make-posn 390 9))
                  ((draw-string ventana) (make-posn 390 20) (make-string (- vidas 1) #\V) "white")
                  (hacer-click-letra (- vidas 1) cad1 cad2 cad3)
               )
               (if (= vidas 4)
                  (begin
                  ((draw-pixmap ventana) "pierna2.png" (make-posn 264 202))
                  ((draw-pixmap ventana) "rectangulo.png" (make-posn 199 280))
                  ((draw-string ventana) (make-posn 200 295) cad3 "white")
                  ((clear-string ventana) (make-posn 390 20) (make-string vidas #\V))
                  ((draw-pixmap ventana) "rectangulo.png" (make-posn 390 9))
                  ((draw-string ventana) (make-posn 390 20) (make-string (- vidas 1) #\V)"white")
                  (hacer-click-letra (- vidas 1) cad1 cad2 cad3)
               )
               (if (= vidas 3)
                  (begin
                   ((draw-pixmap ventana) "mano1.png" (make-posn 235 175))
                  ((draw-pixmap ventana) "rectangulo.png" (make-posn 199 280))
                  ((draw-string ventana) (make-posn 200 295) cad3 "white")
                  ((clear-string ventana) (make-posn 390 20) (make-string vidas #\V))
                  ((draw-pixmap ventana) "rectangulo.png" (make-posn 390 9))
                  ((draw-string ventana) (make-posn 390 20) (make-string (- vidas 1) #\V) "white")
                  (hacer-click-letra (- vidas 1) cad1 cad2 cad3)
               )
               (if (= vidas 2)
                 (begin
                  ((draw-pixmap ventana) "mano2.png" (make-posn 270 175))
                  ((draw-pixmap ventana) "rectangulo.png" (make-posn 199 280))
                  ((draw-string ventana) (make-posn 200 295) cad3 "white")
                  ((clear-string ventana) (make-posn 390 20) (make-string vidas #\V))
                  ((draw-pixmap ventana) "rectangulo.png" (make-posn 390 9))
                  ((draw-string ventana) (make-posn 390 20) (make-string (- vidas 1) #\V) "white")
                  (hacer-click-letra (- vidas 1) cad1 cad2 cad3)
                )
               (if (= vidas 1)
                 (begin
                  ((draw-pixmap ventana) "rectangulo.png" (make-posn 199 280))
                  ((draw-string ventana) (make-posn 200 295) cad3 "white")
                  ((clear-string ventana) (make-posn 380 20) (make-string vidas #\V))
                  ((draw-pixmap ventana) "rectangulo.png" (make-posn 360 9))
                  (validarletra letra (- vidas 1) cad1 cad2 cad3 tam)
                 )
               (display ""))))))))))))
                    
;----------FUNCION QUE EVALUA SI YA SE LE ACABARON LAS VIDAS AL JUGADOR----------------
(define (validarletra letra vidas cad1 cad2 cad3 tam )
       (if (>= vidas 1)
         (recorrerpalabra letra vidas cad1 cad2 cad3 tam 0 0)
         (begin
         ((draw-pixmap ventana) "rectangulo.png" (make-posn 199 280))
         ((draw-pixmap ventana) "muerto.png" (make-posn 214 119))
         ((draw-string ventana) (make-posn 10 15) cad1 "white")
         ((draw-string ventana) (make-posn 180 330) "GAME OVER" "white")
         (hacer-click-letra 0 cad1 cad2 cad3)
       )
     )
  )
;------FUNCION QUE EVALUA, UNA POR UNA EN QUE LETRA SE DIO CLICK------

(define (hacer-click-letra vidas cad1 cad2 cad3)
  (leer_letra (get-mouse-click ventana) vidas cad1 cad2 cad3)
  )
(define (leer_letra c1 vidas cad1 cad2 cad3)
  (desicionL (mouse-click-posn c1) vidas cad1 cad2 cad3)
  )
(define (desicionL c1 vidas cad1 cad2 cad3)
  (begin
    (hacer (posn-x c1) (posn-y c1) vidas cad1 cad2 cad3)
    )
  )
(define (hacer posn-x posn-y vidas cad1 cad2 cad3)
      (if (and (>= posn-x 50) (<= posn-x  90) 
               (>= posn-y 350) (<= posn-y  390)
             )
            (validarletra #\q vidas cad1 cad2 cad3 (string-length cad1))
           (if (and (>= posn-x 90) (<= posn-x  130) 
                    (>= posn-y 350) (<= posn-y  390)
                )
                (validarletra #\w vidas cad1 cad2 cad3 (string-length cad1))
                (if (and (>= posn-x 130) (<= posn-x  170) 
                         (>= posn-y 350) (<= posn-y  390)
                       )
                      (validarletra #\e vidas cad1 cad2 cad3 (string-length cad1))
                      (if (and (>= posn-x 170) (<= posn-x  210) 
                               (>= posn-y 350) (<= posn-y  390)
                            )
                           (validarletra #\r vidas cad1 cad2 cad3 (string-length cad1))
                           (if (and (>= posn-x 210) (<= posn-x  250) 
                                    (>= posn-y 350) (<= posn-y  390)
                                 )
                                (validarletra #\t vidas cad1 cad2 cad3 (string-length cad1))
                                (if (and (>= posn-x 250) (<= posn-x  290) 
                                         (>= posn-y 350) (<= posn-y  390)
                                      )
                                     (validarletra #\y vidas cad1 cad2 cad3 (string-length cad1))
                                     (if (and (>= posn-x 290) (<= posn-x  330) 
                                              (>= posn-y 350) (<= posn-y  390)
                                           )
                                          (validarletra #\u vidas cad1 cad2 cad3 (string-length cad1))
                                          (if (and (>= posn-x 330) (<= posn-x  370) 
                                                   (>= posn-y 350) (<= posn-y  390)
                                               )
                                               (validarletra #\i vidas cad1 cad2 cad3 (string-length cad1))
                                               (if (and (>= posn-x 370) (<= posn-x  410) 
                                                        (>= posn-y 350) (<= posn-y  390)
                                                    )
                                                   (validarletra #\o vidas cad1 cad2 cad3 (string-length cad1))
                                                   (if (and (>= posn-x 410) (<= posn-x  450) 
                                                            (>= posn-y 350) (<= posn-y  390)
                                                         )
                                                        (validarletra #\p vidas cad1 cad2 cad3 (string-length cad1))
                                                        (if (and (>= posn-x 50) (<= posn-x  90) 
                                                                 (>= posn-y 390) (<= posn-y  430)
                                                              )
                                                             (validarletra #\a vidas cad1 cad2 cad3 (string-length cad1))
                                                             (if (and (>= posn-x 90) (<= posn-x  130) 
                                                                      (>= posn-y 390) (<= posn-y  430)
                                                                   )
                                                                  (validarletra #\s vidas cad1 cad2 cad3 (string-length cad1))
                                                                  (if (and (>= posn-x 130) (<= posn-x  170) 
                                                                           (>= posn-y 390) (<= posn-y  430)
                                                                         )
                                                                        (validarletra #\d vidas cad1 cad2 cad3 (string-length cad1))
                                                                        (if (and (>= posn-x 170) (<= posn-x  210) 
                                                                                 (>= posn-y 390) (<= posn-y  430)
                                                                              )
                                                                             (validarletra #\f vidas cad1 cad2 cad3 (string-length cad1))
                                                                             (if (and (>= posn-x 210) (<= posn-x  250) 
                                                                                      (>= posn-y 390) (<= posn-y  430)
                                                                                   )
                                                                                  (validarletra #\g vidas cad1 cad2 cad3 (string-length cad1))
                                                                                  (if (and (>= posn-x 250) (<= posn-x  290) 
                                                                                           (>= posn-y 390) (<= posn-y  430)
                                                                                        )
                                                                                       (validarletra #\h vidas cad1 cad2 cad3 (string-length cad1))
                                                                                       (if (and (>= posn-x 290) (<= posn-x  330) 
                                                                                                (>= posn-y 390) (<= posn-y  430)
                                                                                              )
                                                                                             (validarletra #\j vidas cad1 cad2 cad3 (string-length cad1))
                                                                                             (if (and (>= posn-x 330) (<= posn-x  370) 
                                                                                                      (>= posn-y 390) (<= posn-y  430)
                                                                                                   )
                                                                                                  (validarletra #\k vidas cad1 cad2 cad3 (string-length cad1))
                                                                                                  (if (and (>= posn-x 370) (<= posn-x  410) 
                                                                                                           (>= posn-y 390) (<= posn-y  430)
                                                                                                        )
                                                                                                       (validarletra #\l vidas cad1 cad2 cad3 (string-length cad1))
                                                                                                       (if (and (>= posn-x 410) (<= posn-x  450) 
                                                                                                                (>= posn-y 390) (<= posn-y  430)
                                                                                                             )
                                                                                                            (validarletra #\ñ vidas cad1 cad2 cad3 (string-length cad1))
                                                                                                            (if (and (>= posn-x 90) (<= posn-x  130) 
                                                                                                                     (>= posn-y 430) (<= posn-y  470)
                                                                                                                  )
                                                                                                                 (validarletra #\z vidas cad1 cad2 cad3 (string-length cad1))
                                                                                                                 (if (and (>= posn-x 130) (<= posn-x  170) 
                                                                                                                          (>= posn-y 430) (<= posn-y  470)
                                                                                                                       )
                                                                                                                      (validarletra #\x vidas cad1 cad2 cad3 (string-length cad1))
                                                                                                                      (if (and (>= posn-x 170) (<= posn-x  210) 
                                                                                                                               (>= posn-y 430) (<= posn-y  470)
                                                                                                                            )
                                                                                                                           (validarletra #\c vidas cad1 cad2 cad3 (string-length cad1))
                                                                                                                           (if (and (>= posn-x 210) (<= posn-x  250) 
                                                                                                                                    (>= posn-y 430) (<= posn-y  470)
                                                                                                                                 )
                                                                                                                                (validarletra #\v vidas cad1 cad2 cad3 (string-length cad1))
                                                                                                                                (if (and (>= posn-x 250) (<= posn-x  290) 
                                                                                                                                         (>= posn-y 430) (<= posn-y  470)
                                                                                                                                      )
                                                                                                                                     (validarletra #\b vidas cad1 cad2 cad3 (string-length cad1))
                                                                                                                                      (if (and (>= posn-x 290) (<= posn-x  330) 
                                                                                                                                               (>= posn-y 430) (<= posn-y  470)
                                                                                                                                           )
                                                                                                                                           (validarletra #\n vidas cad1 cad2 cad3 (string-length cad1))
                                                                                                                                           (if (and (>= posn-x 330) (<= posn-x  370) 
                                                                                                                                                    (>= posn-y 430) (<= posn-y  470)
                                                                                                                                                 )
                                                                                                                                                (validarletra #\m vidas cad1 cad2 cad3 (string-length cad1))
                                                                                                                                                (if (and (>= posn-x 50) (<= posn-x 220) 
                                                                                                                                                         (>= posn-y 505) (<= posn-y 555)
                                                                                                                                                      )
                                                                                                                                                     (close-viewport ventana)
                                                                                                                                                     (if (and (>= posn-x 270) (<= posn-x 440) 
                                                                                                                                                              (>= posn-y 505) (<= posn-y 555)
                                                                                                                                                           )
                                                                                                                                                          (begin
                                                                                                                                                            (clear-viewport ventana)
                                                                                                                                                            ((draw-pixmap ventana) "menú.png" (make-posn 0.0 0.0))
                                                                                                                                                            (hacer-click-menu 0 (vector-ref mivector (random 33)) "" "")
                                                                                                                                                           )
                                                                                                                                                          (if (and (>= posn-x 160) (<= posn-x 330) 
                                                                                                                                                                   (>= posn-y 570) (<= posn-y 620)
                                                                                                                                                                )
                                                                                                                                                              (begin
                                                                                                                                                                (clear-viewport ventana)
                                                                                                                                                                (jugar-de-nuevo (vector-ref mivector (random 33)) cad2 cad3)
                                                                                                                                                                )
                                                                                                                                                               (hacer-click-letra vidas cad1 cad2 cad3)
                                                                                                                                                            ) 
                                                                                                                                                      )
                                                                                                                                                 )
                                                                                                                                            )
                                                                                                                                       )
                                                                                                                                 )
                                                                                                                            )
                                                                                                                       )
                                                                                                                  )
                                                                                                             )
                                                                                                        )
                                                                                                   )
                                                                                              )
                                                                                        )
                                                                                   )
                                                                              )
                                                                         )
                                                                   )
                                                              )
                                                            
                                                        )
                                                   )
                                               )
                                          )
                                     )
                                )
                           )
                      )
                )
         )
    )
 )
;--------ESTA FUNCIÓN SE HIZO PARA QUE EL USUARIO PUEDA VOLVER A JUGAR DE NUEVO------------------------------------------------------------------------------------------------------------------------------

(define (jugar-de-nuevo cad1 cad2 cad3)
    (jugar cad1 (make-string (string-length cad1) #\- ) (make-string (string-length cad1) #\ ))
  )
(define (jugar cad1 cad2 cad3)
  (begin
    (pantalla cad1 cad2 cad3)
    (hacer-click-letra 7 cad1 cad2 cad3)
    )
  )
;-------------------------------------------------------------------------------
;llamado
(pantalla1)
(hacer-click-menu 0 (vector-ref mivector aleatorio) "" "")



