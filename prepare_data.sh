echo "Running src/etl/0_Stage1Filter.py  ..."
python -W ignore src/etl/0_Stage1Filter.py
echo "Extracting metadata from DICOM Files ..."
python -W ignore src/etl/1_GetMetadata.py
echo "Creating stratified 10-fold cross-validation ..."
python -W ignore src/etl/2_AssignCVFolds.py
echo "Converting DICOMs to PNGs ..." 
python -W ignore src/etl/3_ConvertDICOM2PNG.py 
echo "Creating resized numpy arrays from PNGs ..."
python -W ignore src/etl/4_CreateResizedNumpyArrays.py
echo "Creating flipped test images for later inference ..."
python -W ignore src/etl/5_FlipTestImages.py
echo "Transforming data into COCO format ..."
python -W ignore src/etl/6_COCOify.py train
python -W ignore src/etl/6_COCOify.py test
echo "Generating concatenated images for ConcatRetinaNet ..."
python -W ignore src/etl/7_CreateConcatImages.py 
echo "Generating annotations for training keras-retinanet ..."
python -W ignore src/etl/8_GenerateConcatRetinaAnnotations.py 
python -W ignore src/etl/9_GeneratePositiveRetinaAnnotations.py
echo "DONE !" 
