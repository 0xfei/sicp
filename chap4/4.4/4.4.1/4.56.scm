(and (supervisor ?name (Ben Bitdiddle))
     (address ?name ?addr))

(and (salary (Bitdiddle Ben) ?num-b)
     (salary ?name ?num-oth)
     (list-value < ?num-oth ?num-b))

(and (not (job ?name (computer . ?type)))
     (supervisor ?name ?boss))

