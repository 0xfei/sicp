(rule (outranked-by ?staff-person ?boss)
      (or (supervisor ?staff-person ?boss)
          (and (outranked-by ?middle-manager ?boss) ; never return
               (supervisor ?staff-person ?middle-manager))))


