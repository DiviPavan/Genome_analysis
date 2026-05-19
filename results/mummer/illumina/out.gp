set terminal png tiny size 800,800
set output "out.png"
set xtics rotate ( \
 "NZ_CP038996.1" 1.0, \
 "NZ_CP038997.1" 2796178.0, \
 "" 2919198 \
)
set ytics ( \
 "NODE_1_length_653079_cov_14.338988" 1.0, \
 "NODE_2_length_645318_cov_14.763519" 653079.0, \
 "NODE_3_length_390024_cov_18.570711" 1298396.0, \
 "NODE_4_length_293280_cov_13.722837" 1688419.0, \
 "NODE_5_length_253971_cov_18.039619" 1981698.0, \
 "NODE_6_length_199480_cov_14.741554" 2235668.0, \
 "NODE_7_length_187026_cov_36.071982" 2435147.0, \
 "NODE_8_length_163684_cov_22.531878" 2622172.0, \
 "NODE_9_length_140155_cov_13.110289" 2785855.0, \
 "NODE_10_length_62941_cov_26.295606" 2926009.0, \
 "NODE_11_length_53834_cov_32.508864" 2988949.0, \
 "NODE_12_length_40642_cov_83.073734" 3042782.0, \
 "NODE_13_length_22988_cov_21.631967" 3083423.0, \
 "NODE_14_length_12427_cov_36.581700" 3106410.0, \
 "NODE_15_length_9395_cov_52.023074" 3118836.0, \
 "NODE_16_length_4695_cov_14.196405" 3128230.0, \
 "NODE_17_length_3298_cov_83.829867" 3132924.0, \
 "NODE_18_length_486_cov_13.308068" 3136221.0, \
 "NODE_19_length_431_cov_13.838983" 3136706.0, \
 "NODE_20_length_385_cov_12.707792" 3137136.0, \
 "NODE_21_length_338_cov_10.620690" 3137520.0, \
 "NODE_22_length_323_cov_15.796748" 3137857.0, \
 "NODE_23_length_228_cov_9.152318" 3138179.0, \
 "NODE_24_length_190_cov_35.106195" 3138406.0, \
 "NODE_25_length_172_cov_48.810526" 3138595.0, \
 "NODE_26_length_161_cov_8.595238" 3138766.0, \
 "NODE_27_length_156_cov_18.139241" 3138926.0, \
 "NODE_28_length_153_cov_9.986842" 3139081.0, \
 "NODE_29_length_152_cov_9.720000" 3139233.0, \
 "NODE_30_length_151_cov_9.864865" 3139384.0, \
 "NODE_31_length_139_cov_11.645161" 3139534.0, \
 "NODE_32_length_80_cov_10.000000" 3139672.0, \
 "NODE_33_length_78_cov_9.000000" 3139751.0, \
 "" 3139860 \
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
set yrange [1:3139860]
set style line 1  lt 1 lw 3 pt 6 ps 1
set style line 2  lt 3 lw 3 pt 6 ps 1
set style line 3  lt 2 lw 3 pt 6 ps 1
plot \
 "out.fplot" title "FWD" w lp ls 1, \
 "out.rplot" title "REV" w lp ls 2
