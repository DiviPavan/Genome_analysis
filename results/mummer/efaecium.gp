set terminal png tiny size 800,800
set output "/home/padi4950/uppmax/efaecium_E745/results/mummer/efaecium.png"
set xtics rotate ( \
 "NZ_CP038996.1" 1.0, \
 "NZ_CP038997.1" 2796178.0, \
 "" 2919198 \
)
set ytics ( \
 "tig00000001" 1.0, \
 "tig00000002" 2763566.0, \
 "tig00000003" 2979565.0, \
 "tig00000004" 3008437.0, \
 "tig00000005" 3023170.0, \
 "tig00000006" 3063182.0, \
 "tig00000007" 3078196.0, \
 "tig00000008" 3094239.0, \
 "tig00000009" 3119074.0, \
 "" 3135564 \
)
set size 1,1
set grid
unset key
set border 0
set tics scale 0
set xlabel "REF"
set ylabel "QRY"
set format "%.0f"
set mouse format "%.0f"
set mouse mouseformat "[%.0f, %.0f]"
set xrange [1:2919198]
set yrange [1:3135564]
set style line 1  lt 1 lw 3 pt 6 ps 1
set style line 2  lt 3 lw 3 pt 6 ps 1
set style line 3  lt 2 lw 3 pt 6 ps 1
plot \
 "/home/padi4950/uppmax/efaecium_E745/results/mummer/efaecium.fplot" title "FWD" w lp ls 1, \
 "/home/padi4950/uppmax/efaecium_E745/results/mummer/efaecium.rplot" title "REV" w lp ls 2
