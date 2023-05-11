<Cabbage>
form size(160, 160), caption("OK-Wash"), pluginID("plug"), colour(50, 50, 50, 255)
rslider bounds(40, 40, 68, 70), channel("size"), range(0, 0.95, .2, 1, 0.001), text("OK-Wash"), ;I am bad at colour value so I just dont do it
;rslider bounds(102, 40, 68, 70), channel("butterhp"), range(1, 500, 10000, 1, 0.001), text("Cut-Off"), colour(2, 132, 0, 255), 
;rslider bounds(242, 40, 68, 70), channel("feedback"), range(0, 1, .5, 1, 0.001), text("FB"), colour(2, 132, 0, 255), 
;rslider bounds(172, 40, 68, 70), channel("delaytime"), range(0, 0.2, .5, 1, 0.001), text("DLT"), colour(2, 132, 0, 255), 
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 64
nchnls = 2
0dbfs=1
instr 1
;hpf
    kscaledsize chnget "size"
    kfreq = kscaledsize * 520 ;oh! a Chinese style love message... (Did not mean it)
    as1 inch 1
    as2 inch 2
    ainL butterhp as1,kfreq
    ainR butterhp as2,kfreq
    outs ainL, ainR
;reverb
    kFdBack chnget "size"
    kGain chnget "size" 
    ainL inch 1
    ainR inch 2
    aOutL, aOutR reverbsc ainL, ainR, kFdBack, 12000
    al butterhp aOutL, kfreq
    ar butterhp aOutR, kfreq
    outs al*kGain, ar*kGain
endin
;mAr$hA//'s note: Have not figured out the delay part, but this one is simple and delated around 50 lines of codes to make it run faster and get less usage of CPU.(I crashed Cabbage at May 9th 2023...)
;instr 2
;    adel init 0
;    idlt chnget "delaytime"
;    ifb chnget "feedback"
;    ao1 inch 1
;    ao2 inch 2
;    aOutL delay ao1 + (adel*ifb), idlt
;    aOutR delay ao2 + (adel*ifb), idlt
;    outs aOutL + ao1, aOutR + ao2

</CsInstruments>  
<CsScore>
f1 0 1024 10 1
i1 0 z
</CsScore>
</CsoundSynthesizer>