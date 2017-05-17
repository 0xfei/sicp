(meeting ?meet-name (Friday . ?time))

(rule (meeting-time ?person ?day-and-time)
      (and (job ?person (?part . ?job))
           (or (meeting ?part ?day-and-time)
               (meeting whole-company ?day-and-time))))

