module Olim.Scales
       where
---------------------------------------------------------------------------------
-- auxilliary combinatoric functions
---------------------------------------------------------------------------------

dec = \n -> n - 1
tails = \xs -> [drop i xs| i <- [0..dec $ length xs]]
heads = \xs -> [take i xs| i <- [1..length xs]]
cyclic_permutations xs = [drop i xs ++ take i xs| i <- [0.. dec $ length xs]]

---------------------------------------------------------------------------------
-- constants from music theory
---------------------------------------------------------------------------------

diatonic_heptatonic_mode_names = ["Locrian", "Ionian", "Dorian", "Phrygian" ,"Lydian", "Mixolydian", "Aeolian"]
note_names = ["C", "C♯", "D", "D♯", "E", "F", "F♯", "G", "G♯", "A", "A♯", "B"]
---------------------------------------------------------------------------------
-- musical entities
---------------------------------------------------------------------------------
diatonic_heptatonic_modes = cyclic_permutations [1, 2, 2, 1, 2, 2, 2]
diatonic_heptatonic_modes_in_cumulative_intervals = map (\xs -> map sum $ heads xs) diatonic_heptatonic_modes

named_modes = zip diatonic_heptatonic_mode_names $ diatonic_heptatonic_modes_in_cumulative_intervals
mode_by_name = (\m -> (lookup m named_modes))
named_chromatic_progressions = map (\xs -> (head xs, xs)) $ cyclic_permutations note_names
chromatic_progression_by_root_note_name = \n -> lookup n named_chromatic_progressions 

-- scale note mode = [Maybe chromatic_progression_by_root_note_name note !! i | i <- mode_by_name mode]

all_scales = [ (note, mode) | note <-note_names, mode <- named_modes ]



-- mode_from_a_note_in_note_names note mode =
  -- take a pair (name, intervals) where fst pair matches mode,
  -- then take a cyclic permutation of notes where my note comes first
  -- then take a mask of that permutation given by intervals
  -- NB. here it may make more sense to have 0 in the beginning and not 12 in the end
  -- of the interval row.

  -- so now the question is, what is appropriate haskell syntax
  -- to handle a list of pairs as if it were a hashmap or a dict
  -- . NB it would be much more effective to have a binary tree (or a heap),
  -- instead of traversing the whole list of pairs
