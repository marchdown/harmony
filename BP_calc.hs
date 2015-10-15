bp_intervals = [3/1, 5/3, 7/5, 9/7, 11/9, 13/11]
pythagorean_intervals = [3/4, 4/5, 5/6]
semitone = 2**(1/12)
cent = 2**(1/1200)

ratio_to_cents = map (\x -> (log x)/(log cent)) 
