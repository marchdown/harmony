module Olim
--       ( module Olim.Randomness
-- module Olim.MusicalEntities
-- module Olim.Scales
-- module Olim.SoundProduction

--       )
where
       
octave = 2.0
number_of_steps = 12
semitones_in_a_tone = 2
semitone = octave ** (1/number_of_steps)
tone = semitone ** semitones_in_a_tone
quint = tone ** 4 / semitone

reference_la = 440
bottom_do = reference_la / octave ** 3 * semitone ** 3
top_do = bottom_do * octave ** 5

steps = [1..number_of_steps]
cent = 2.0**(1/1200)
note_freqs = map (\step -> reference_la * semitone ** step) steps

main = print note_freqs

harmonic_ratios = take 13 $ zipWith (/) [2..] [1..]
ratio_to_cents r = (log r) / (log semitone) * 100

-- number_of_steps_progression n | = number_of_steps (n - 1)
