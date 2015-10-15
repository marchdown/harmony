module Lecture6 where
import Euterpea
import System.Random -- for algorithmic composition example
--The following two imports are to support timing-strict playback
import Euterpea.ExperimentalPlay 
import Control.DeepSeq

randInts :: Int -> [Int]
randInts seed = recInts (mkStdGen seed) where
    recInts g = let (i,g') = next g in i : recInts g'

randIntsRange :: (Int, Int) -> Int -> [Int]
randIntsRange (lower, upper) = 
    map (\i -> (i `mod` (upper-lower)) + lower) . randInts 

melGen :: Dur -> Int -> Music (Pitch, Volume)
melGen d s = removeZeros $ -- this applies to the entire let-in
    let pitches = map pitch $ randIntsRange (30,80) s
        vols = randIntsRange (40,100) (s+1)
    in  takeM d $ line $ map (note sn) $ zip pitches vols

somethingWeird = 
    let part1 = instrument Xylophone $ dim $ rit $ melGen 6 345
        part2 = instrument Marimba $ melGen 4 234
        part3 = instrument TubularBells $ cre $ acc $ melGen 8 789
    in  chord [part1, part2, part3] where
    rit = phrase [Tmp $ Ritardando 0.5]
    acc = phrase [Tmp $ Accelerando 0.5]
    dim = phrase [Dyn $ Diminuendo 0.5]
    cre = phrase [Dyn $ Crescendo 0.5]

playS :: (Performable a, NFData a) => Music a -> IO ()
playS = playC defParams{strict=True}
