(rule (replaceable ?a ?b)
      (and (job ?a ?job-a)
           (job ?b ?job-b)
           (or (same ?job-a ?job-b)
               (can-do-job ?job-a ?job-b))
           (not (same ?a ?b))))

(replaceable ?a (D.Fect Cy))

(and (replaceable ?a ?b)
     (salary ?a ?s-a)
     (salary ?b ?s-b)
     (list-value > ?s-b ?s-a))

