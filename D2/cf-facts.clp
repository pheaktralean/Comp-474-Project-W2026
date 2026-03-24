; --------------------------------------------------------------------
; ------------------ Uncertain Facts Templates -----------------------
; --------------------------------------------------------------------

(deftemplate fatigue-confidence
   (slot user-id)
   (slot value (type FLOAT)) ; 0.0 to 1.0

)

(deftemplate motivation-confidence
   (slot user-id)
   (slot value (type FLOAT)) ; 0.0 to 1.0
)

(deftemplate success-confidence
   (slot user-id)
   (slot value (type FLOAT)) ; 0.0 to 1.0
)

(deftemplate readiness-confidence
   (slot user-id)
   (slot value (type FLOAT)) ; 0.0 to 1.0
)

(deftemplate consistency-confidence
   (slot user-id)
   (slot value (type FLOAT)) ; 0.0 to 1.0
)

(deftemplate failure-confidence
   (slot user-id)
   (slot value (type FLOAT)) ; 0.0 to 1.0
)
