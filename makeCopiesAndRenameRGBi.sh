cd /data/workspace/datasets/NYUD_V2/data
rm -rf rgb_iRange_100_60_8bits
mkdir rgb_iRange_100_60_8bits

cp -v rgb_raw_8bits/*.png rgb_iRange_100_60_8bits/
cd rgb_iRange_100_60_8bits
rename -v 's/^([0-9]{4})(.png)/i100_$1$2/' *
cd ..

cp -v rgb_i_90_8bits/*.png rgb_iRange_100_60_8bits/
cd rgb_iRange_100_60_8bits
rename -v 's/^([0-9]{4})(.png)/i90_$1$2/' *
cd ..

cp -v rgb_i_80_8bits/*.png rgb_iRange_100_60_8bits/
cd rgb_iRange_100_60_8bits
rename -v 's/^([0-9]{4})(.png)/i80_$1$2/' *
cd ..

cp -v rgb_i_70_8bits/*.png rgb_iRange_100_60_8bits/
cd rgb_iRange_100_60_8bits
rename -v 's/^([0-9]{4})(.png)/i70_$1$2/' *
cd ..

cp -v rgb_i_60_8bits/*.png rgb_iRange_100_60_8bits/
cd rgb_iRange_100_60_8bits
rename -v 's/^([0-9]{4})(.png)/i60_$1$2/' *
cd ..






rm -rf rgb_iRange_50_10_8bits
mkdir rgb_iRange_50_10_8bits


cp -v rgb_i_50_8bits/*.png rgb_iRange_50_10_8bits/
cd rgb_iRange_50_10_8bits
rename -v 's/^([0-9]{4})(.png)/i50_$1$2/' *
cd ..

cp -v rgb_i_40_8bits/*.png rgb_iRange_50_10_8bits/
cd rgb_iRange_50_10_8bits
rename -v 's/^([0-9]{4})(.png)/i40_$1$2/' *
cd ..

cp -v rgb_i_30_8bits/*.png rgb_iRange_50_10_8bits/
cd rgb_iRange_50_10_8bits
rename -v 's/^([0-9]{4})(.png)/i30_$1$2/' *
cd ..

cp -v rgb_i_20_8bits/*.png rgb_iRange_50_10_8bits/
cd rgb_iRange_50_10_8bits
rename -v 's/^([0-9]{4})(.png)/i20_$1$2/' *
cd ..

cp -v rgb_i_10_8bits/*.png rgb_iRange_50_10_8bits/
cd rgb_iRange_50_10_8bits
rename -v 's/^([0-9]{4})(.png)/i10_$1$2/' *
cd ..



rm -rf rgb_iAll_8bits
mkdir rgb_iAll_8bits

cp -v rgb_iRange_50_10_8bits/* rgb_iAll_8bits
cp -v rgb_iRange_100_60_8bits/* rgb_iAll_8bits



