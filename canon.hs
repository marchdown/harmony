import Euterpea
 
doReMiDo = c 4 qn :+: d 4 qn :+: e 4 qn :+: c 4 qn
miFaSo = e 4 qn :+: f 4 qn :+: g 4 hn
doSoDo = c 4 qn :+: g 3 qn :+: c 4 hn
firstPart = doReMiDo :+: doReMiDo :+: miFaSo :+: miFaSo
secondPart = timesM 2 soLaSoFaMiDo :+: doSoDo :+: doSoDo
soLaSoFaMiDo = g 4 en :+: a 4 en :+: g 4 en :+: f 4 en :+: e 4 qn :+: c 4 qn
faderJakob = firstPart :+: secondPart
 
firstVoice = timesM 2 faderJakob
secondVoice = (rest bn :+: timesM 2 faderJakob)
thirdVoice = timesM 2 (rest bn) :+: timesM 2 faderJakob
 
canon = instrument AcousticGrandPiano (transpose 0 firstVoice) :=:
        instrument AcousticBass (transpose (-12) secondVoice) :=:
        instrument Flute (transpose 24 thirdVoice)
