(defrule start
  =>
  (printout t "Вам нужна машина для бездорожья? (yes/no): ")
  (assert (offroad (read))))

(defrule offroad-yes
  (offroad yes)
  =>
  (printout t "Вам нужен большой багажник для семьи? (yes/no): ")
  (assert (family (read))))

(defrule offroad-no
  (offroad no)
  =>
  (printout t "Вы любите быструю езду? (yes/no): ")
  (assert (sport (read))))

(defrule jeep
  (family yes)
  =>
  (printout t "предлагаю: Toyota Land Cruiser" crlf))

(defrule pickup
  (family no)
  =>
  (printout t "предлагаю: Ford F-150 Raptor" crlf))

(defrule sport-car
  (sport yes)
  =>
  (printout t "предлагаю: Porsche 911" crlf))

(defrule city-car
  (sport no)
  =>
  (printout t "предлагаю: Toyota Camry" crlf))
