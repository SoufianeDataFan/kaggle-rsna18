cd $TOP/models/RetinaNet/ ; pip install .


cd -


mkdir data ; cd data 
# Download the challenge data here 
kaggle competitions download -c rsna-pneumonia-detection-challenge
unzip stage_2_detailed_class_info.csv.zip 
unzip stage_2_train_labels.csv.zip 
mv stage_2_detailed_class_info.csv detailed_class_info.csv 
mv stage_2_train_labels.csv train_labels.csv 
mkdir train_dicoms test_dicoms 
cd train_dicoms ; unzip ../stage_2_train_images.zip 
cd ../test_dicoms ; unzip ../stage_2_test_images.zip 
