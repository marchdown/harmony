{-# LANGUAGE UnicodeSyntax #-}
module Olim.Randomness
       where
import System.Random
import Control.Monad (replicateM)

ten_random_chars = do
  g <- getStdGen
  print $ take 10 (randomRs ('a', 'z') g)

ten_random_floats = replicateM 10 (randomIO :: IO Float) >>= print
-- twelfe_random_interval_classes =  replicateM 12 (randomIO :: IO Int) >>= print
                                 

--main = do
--  g <- getStdGen
--  print $ take 10 (randomRs ('a', 'z') g)

twelfe_random_interval_classes = do
  g <- newStdGen -- use getStdGen for stable pseudorandom generator
  print $ fmap (\x-> x `mod` 12) $ take 12 (randoms g :: [Int])  

random_note = do
  g <- newStdGen
  putStrLn $ note_names !! ( (head (randoms g :: [Int])) `mod` 12) 

random_interval_class = do
  g <- newStdGen
  print $ ( head (randoms g :: [Int])) `mod` 12
--------------------------------------------------------------------------------
-- literal and numeric constants --
--------------------------------------------------------------------------------  
unicode_sharp_sign = '♯'
unicode_flat_sign = '♭'
note_names = ["C", "C♯", "D", "D♯", "E", "F", "F♯", "G", "G♯", "A", "A♯", "B"]
cent = 2.0**(1/1200)
tuning_fork_A = 440.0
middle_C = tuning_fork_A / cent**900
scientific_pitch_notation_C = 256
scientific_pitch_notation_A_above_middle_C = scientific_pitch_notation_C * cent**900

pitch_Hz_to_cents_relative_to_middle_C freq = log (freq / middle_C) / (log cent)


--------------------------------------------------------------------------------
-- coin tosses --
--------------------------------------------------------------------------------

