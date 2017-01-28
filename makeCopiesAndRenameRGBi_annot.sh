cd /data/workspace/datasets/NYUD_V2/data
rm -rf annotations_tmp
mkdir annotations_tmp

cp -v Annotations/*.xml annotations_tmp/
cd annotations_tmp
rename -v 's/^([0-9]{4})(.xml)/i100_$1$2/' *
cd ..


cp -v Annotations/*.xml annotations_tmp/
cd annotations_tmp
rename -v 's/^([0-9]{4})(.xml)/i90_$1$2/' *
cd ..


cp -v Annotations/*.xml annotations_tmp/
cd annotations_tmp
rename -v 's/^([0-9]{4})(.xml)/i80_$1$2/' *
cd ..


cp -v Annotations/*.xml annotations_tmp/
cd annotations_tmp
rename -v 's/^([0-9]{4})(.xml)/i70_$1$2/' *
cd ..


cp -v Annotations/*.xml annotations_tmp/
cd annotations_tmp
rename -v 's/^([0-9]{4})(.xml)/i60_$1$2/' *
cd ..


cp -v Annotations/*.xml annotations_tmp/
cd annotations_tmp
rename -v 's/^([0-9]{4})(.xml)/i50_$1$2/' *
cd ..


cp -v Annotations/*.xml annotations_tmp/
cd annotations_tmp
rename -v 's/^([0-9]{4})(.xml)/i40_$1$2/' *
cd ..


cp -v Annotations/*.xml annotations_tmp/
cd annotations_tmp
rename -v 's/^([0-9]{4})(.xml)/i30_$1$2/' *
cd ..


cp -v Annotations/*.xml annotations_tmp/
cd annotations_tmp
rename -v 's/^([0-9]{4})(.xml)/i20_$1$2/' *
cd ..



cp -v Annotations/*.xml annotations_tmp/
cd annotations_tmp
rename -v 's/^([0-9]{4})(.xml)/i10_$1$2/' *
cd ..

cp -v annotations_tmp/* Annotations

rm -rf annotations_tmp



