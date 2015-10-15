octave = 2.0
n_steps = 12
semitone_ratio = 2
semitone = octave ** (1/n_steps)
tone = semitone ** semitone_ratio
quint = tone ** 4 / semitone
reference_la = 440
steps = [1..n_steps]

note_freqs = map (\step -> reference_la * semitone ** step) steps

main = print note_freqs
