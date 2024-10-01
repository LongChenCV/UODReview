# Underwater Object Detection in the Era of Artificial Intelligence: Current, Challenges and Future (UODReview)

This website provides the source code to reproduce the experiments in our work UODReview, we publish the well-trained models, the detection results of some advanced detection networks trained on RUOD and DUO. Both xml and json annotations are provided for RUOD and DUO.

We also introduce two useful detection analysis tools (i.e., Diagnosis and Tide) to analyse the errors made by underwater detectors. This work provides the researchers with an off-the-shelf platform for comparing their underwater object detectors with previous works.

## 1. Download the Datasets and Our Trained Model

### 1.1 Download the [RUOD](https://drive.google.com/file/d/1hSXA1NcD27_XBk6Sfz7GNQxCgm8qYnB4/view?usp=drive_link) and [DUO](https://drive.google.com/file/d/17p1Cp4udYMP1fJzZIDfr7BhuVAdII6pO/view?usp=drive_link) Datasets
Put the downloaded datasets into ```./UODReview/RUOD``` and ```./UODReview/DUO```
Our RUOD and DUO datasets contain both .xml format and .json format annotations for the test set. 
The .json format are used for training and testing, while the .xml format annotations are used for the detection analysis tool Diagnosis in Section 3.2.

### 1.2 Download our trained models on [RUOD](https://drive.google.com/drive/folders/1-1F9AGgxaxftOe_viRd0kcXGYd-OWEdU?usp=sharing) and on [DUO](https://drive.google.com/drive/folders/1P2Yr54N1d2uk1XFXSJKKdW_Ll0JpczIc?usp=drive_link) 
Put the downloaded models into ```./UODReview/models/RUOD``` and ```./UODReview/models/DUO```

### 1.3 Quick Testing the trained models
For example,
```
python ./tools/test.py ./configs/reppoints/reppoints-moment_r101_fpn-gn_head-gn_2x_coco_RUOD.py ./models/RUOD/modelsReppoints/modelsReppoints.pth --work-dir ./models/RUOD/modelsReppoints
```

## 2. Deploy UOD Frameworks

### 2.1 Environment Installation
The source code is based on the MMDetection toolbox, which a part of the [OpenMMLab](https://openmmlab.com/) project. Please refer to [Installation](https://mmdetection.readthedocs.io/en/latest/get_started.html) to set the running environment.
#### Dependencies
* Python: 3.8.19
* CUDA: 11.3
* PyTorch: 1.12.1
* CuDNN: 8.3.2
* TorchVision: 0.13.1
* OpenCV: 4.9.0
* Magma: 2.5.2
* MMEngine: 0.10.4


### 2.2 Training
```
python ./tools/train.py ./configs/xxx/xxx_RUOD.py --work-dir ./models/RUOD/modelsxxx    #On RUOD
python ./tools/train.py ./configs/xxx/xxx_DUO.py  --work-dir ./models/DUO/modelsxxx     #On DUO
```
For example,
```
python ./tools/train.py ./configs/reppoints/reppoints-moment_r101_fpn-gn_head-gn_2x_coco_RUOD.py --work-dir ./RUOD/modelsReppoints
```
Notice: when changing between RUOD and DUO, please change the dataset setting in:
```
./mmdet/datasets/coco.py
./configs/_base_/datasets/coco_detection.py
./configs/xxx/xxx_RUOD.py or ./configs/xxx/xxx_DUO.py #set num_classes=10 for RUOD and num_classes=4 for DUO
```
### 2.3 Testing
```
python ./tools/test.py ./configs/xxx/xxx_RUOD.py ./models/RUOD/modelsxxx/modelsxxx.pth --work-dir ./models/RUOD/modelsxxx     #On RUOD
```
For example,
```
python ./tools/test.py ./configs/reppoints/reppoints-moment_r101_fpn-gn_head-gn_2x_coco_RUOD.py ./models/RUOD/modelsReppoints/modelsReppoints.pth --work-dir ./models/RUOD/modelsReppoints
```
Notice: when changing between RUOD and DUO, please change the dataset setting in:
```
./mmdet/datasets/coco.py
./configs/_base_/datasets/coco_detection.py
./configs/xxx/xxx_RUOD.py or ./configs/xxx/xxx_DUO.py #set num_classes=10 for RUOD and num_classes=4 for DUO
```

#### 2.3.1 Output the AP Per Class
Set "classwise=True" in ```./configs/_base_/datasets/coco_detection.py``` as follows:
```
val_evaluator = dict(
    type='CocoMetric',
    ann_file=data_root + 'annotations_json/instances_test.json',
    metric='bbox',
    classwise=True,  # Set
    format_only=False,
    backend_args=backend_args)
```

#### 2.3.2 Save the Detection Results into xxx.json
Add the following statement in ```./configs/_base_/datasets/coco_detection.py``` as follows:
```
test_evaluator = dict(
    type='CocoMetric',
    metric='bbox',
    format_only=True,
    classwise= True,
    ann_file=data_root + 'annotations_json/instances_val.json',
    outfile_prefix='./UODReview/models/RUOD/modelsReppoints/detectionresults',
    backend_args=backend_args)
```
The detection results are saved in  ```'./UODReview/models/RUOD/modelsxxx/detectionresultsxxx.bbox.json'```

### 2.3.3 Obtain the Model's FLOPS and Params
```
python tools/analysis_tools/get_flops.py ./configs/reppoints/reppoints-moment_r101_fpn-gn_head-gn_2x_coco_RUOD.py  #On RUOD
python tools/analysis_tools/get_flops.py ./configs/reppoints/reppoints-moment_r101_fpn-gn_head-gn_2x_coco_DUO.py   #On DUO
```

### 2.3.4 Results and Models 
#### On RUOD
|    Methods    |   Backbones    |  Params  |  FLOPs   |  AP  | AP_50 | AP_75 | AP_s | AP_m | AP_l |                                            Models                                             | Detections                                                                                         |
|:-------------:|:--------------:|:--------:|:--------:|:----:|:-----:|-------|------|------|------|:---------------------------------------------------------------------------------------------:|----------------------------------------------------------------------------------------------------|
|    FoveaBox   |   ResNet101    |  56.68M  | 268.29G  | 44.8 | 80.2  | 45.2  | 18.0 | 37.5 | 49.1 | [model](https://drive.google.com/drive/folders/1-1F9AGgxaxftOe_viRd0kcXGYd-OWEdU?usp=sharing) | [Detections](https://drive.google.com/drive/folders/1-1F9AGgxaxftOe_viRd0kcXGYd-OWEdU?usp=sharing) |
|  GuideAnchor  |   ResNet101    |  60.98M  | 258.05G  | 46.6 | 80.8  | 48.3  | 21.5 | 41.1 | 50.6 | [model](https://drive.google.com/drive/folders/1-1F9AGgxaxftOe_viRd0kcXGYd-OWEdU?usp=sharing) | [Detections](https://drive.google.com/drive/folders/1-1F9AGgxaxftOe_viRd0kcXGYd-OWEdU?usp=sharing) |
|  CascadeRCNN  |   ResNet101    |  88.17M  | 301.06G  | 49.8 | 80.5  | 54.2  | 18.7 | 43.1 | 54.3 | [model](https://drive.google.com/drive/folders/1-1F9AGgxaxftOe_viRd0kcXGYd-OWEdU?usp=sharing) | [Detections](https://drive.google.com/drive/folders/1-1F9AGgxaxftOe_viRd0kcXGYd-OWEdU?usp=sharing) |
|   RetinaNet   |   ResNet101    |  55.51M  | 273.41G  | 52.8 | 81.8  | 57.9  | 14.6 | 39.9 | 58.3 | [model](https://drive.google.com/drive/folders/1-1F9AGgxaxftOe_viRd0kcXGYd-OWEdU?usp=sharing) | [Detections](https://drive.google.com/drive/folders/1-1F9AGgxaxftOe_viRd0kcXGYd-OWEdU?usp=sharing) |
|   RepPoints   |   ResNet101    |  55.82M  | 256.00G  | 53.2 | 82.2  | 60.1  | 28.2 | 44.9 | 57.8 | [model](https://drive.google.com/drive/folders/1-1F9AGgxaxftOe_viRd0kcXGYd-OWEdU?usp=sharing) | [Detections](https://drive.google.com/drive/folders/1-1F9AGgxaxftOe_viRd0kcXGYd-OWEdU?usp=sharing) |
|   DetectoRS   |   DResNet50    | 123.23M  |  90.05G  | 53.3 | 84.1  | 58.7  | 30.8 | 46.6 | 57.8 | [model](https://drive.google.com/drive/folders/1-1F9AGgxaxftOe_viRd0kcXGYd-OWEdU?usp=sharing) | [Detections](https://drive.google.com/drive/folders/1-1F9AGgxaxftOe_viRd0kcXGYd-OWEdU?usp=sharing) |
|     ATSS      |   ResNet101    |  51.13M  | 267.26G  | 54.0 | 80.3  | 60.2  | 18.0 | 40.0 | 59.5 | [model](https://drive.google.com/drive/folders/1-1F9AGgxaxftOe_viRd0kcXGYd-OWEdU?usp=sharing) | [Detections](https://drive.google.com/drive/folders/1-1F9AGgxaxftOe_viRd0kcXGYd-OWEdU?usp=sharing) |
|   GridRCNN    |   ResNet101    | 129.63M  | 365.60G  | 54.2 | 81.6  | 60.0  | 25.6 | 46.1 | 59.8 | [model](https://drive.google.com/drive/folders/1-1F9AGgxaxftOe_viRd0kcXGYd-OWEdU?usp=sharing) | [Detections](https://drive.google.com/drive/folders/1-1F9AGgxaxftOe_viRd0kcXGYd-OWEdU?usp=sharing) |

#### On DUO
|    Methods    |   Backbones    | Params  |  FLOPs  |  AP  | AP_50 | AP_75 | AP_s | AP_m | AP_l |                                                Models                                                 | Detections                                                                                         |
|:-------------:|:--------------:|:-------:|:-------:|:----:|:-----:|------|------|------|------|:-----------------------------------------------------------------------------------------------------:|----------------------------------------------------------------------------------------------------|
|    FoveaBox   |   ResNet101    | 55.24M  | 286.72G | 53.7 | 78.4  | 63.9 | 55.3 | 54.3 |  54.6|     [model](https://drive.google.com/drive/folders/1P2Yr54N1d2uk1XFXSJKKdW_Ll0JpczIc?usp=sharing)     | [Detections](https://drive.google.com/drive/folders/1P2Yr54N1d2uk1XFXSJKKdW_Ll0JpczIc?usp=sharing) |
|  GuideAnchor  |   ResNet101    | 60.94M  | 276.48G | 61.4 | 83.8  | 72.0 | 58.9 | 62.4 | 61.3 |     [model](https://drive.google.com/drive/folders/1P2Yr54N1d2uk1XFXSJKKdW_Ll0JpczIc?usp=sharing)     | [Detections](https://drive.google.com/drive/folders/1P2Yr54N1d2uk1XFXSJKKdW_Ll0JpczIc?usp=sharing) |
|  CascadeRCNN  |   ResNet101    | 88.15M  | 319.49G | 60.6 | 80.9  | 70.5 | 54.4 | 61.4 | 61.2 |     [model](https://drive.google.com/drive/folders/1P2Yr54N1d2uk1XFXSJKKdW_Ll0JpczIc?usp=sharing)     | [Detections](https://drive.google.com/drive/folders/1P2Yr54N1d2uk1XFXSJKKdW_Ll0JpczIc?usp=sharing) |
|   RetinaNet   |   ResNet101    | 55.38M  | 289.79G | 50.9 | 73.1  | 59.7 | 51.0 | 50.1 | 53.1 |     [model](https://drive.google.com/drive/folders/1P2Yr54N1d2uk1XFXSJKKdW_Ll0JpczIc?usp=sharing)     | [Detections](https://drive.google.com/drive/folders/1P2Yr54N1d2uk1XFXSJKKdW_Ll0JpczIc?usp=sharing) |
|   RepPoints   |   ResNet101    | 55.82M  | 256.00G | 59.4 | 80.4  | 70.1 | 55.5 | 59.6 | 60.1 |     [model](https://drive.google.com/drive/folders/1P2Yr54N1d2uk1XFXSJKKdW_Ll0JpczIc?usp=sharing)     | [Detections](https://drive.google.com/drive/folders/1P2Yr54N1d2uk1XFXSJKKdW_Ll0JpczIc?usp=sharing) |
|   DetectoRS   |   DResNet50    | 123.23M | 90.05G  | 58.9 | 81.4  | 68.3 | 49.6 | 57.6 | 61.8 |     [model](https://drive.google.com/drive/folders/1P2Yr54N1d2uk1XFXSJKKdW_Ll0JpczIc?usp=sharing)     | [Detections](https://drive.google.com/drive/folders/1P2Yr54N1d2uk1XFXSJKKdW_Ll0JpczIc?usp=sharing) |
|     ATSS      |   ResNet101    | 51.11M  | 286.72G | 55.4 | 79.2  | 63.2 | 55.7 | 55.7 | 56.0 |     [model](https://drive.google.com/drive/folders/1P2Yr54N1d2uk1XFXSJKKdW_Ll0JpczIc?usp=sharing)     | [Detections](https://drive.google.com/drive/folders/1P2Yr54N1d2uk1XFXSJKKdW_Ll0JpczIc?usp=sharing) |
|   GridRCNN    |   ResNet101    | 129.63M | 365.60G | 56.6 | 78.9  | 67.2 | 50.3 | 56.7 | 57.4 |     [model](https://drive.google.com/drive/folders/1P2Yr54N1d2uk1XFXSJKKdW_Ll0JpczIc?usp=sharing)     | [Detections](https://drive.google.com/drive/folders/1P2Yr54N1d2uk1XFXSJKKdW_Ll0JpczIc?usp=sharing) |


## 3. Detection Analysis Tools on RUOD and DUO
### 3.1 TIDE (Python)
Our TIDE source code is custom-designed for RUOD and UOD datasets, located in ```UODRevew/diagnosis/Tide/```   

### 3.1.1 TIDE Installation

```
pip3 install tidecv
```
### 3.1.2 Obtain the Model's Errors:
```
python ./diagnosis/tide-master/examples/TIDE_RUOD_DUO.py
```

Set the Path of Ground Truth and Detections
```
annFile = './RUOD/annotations/instances_val2017.json'  # Ground Truth
resFile = './RUOD/modelsxxx/detectionresultsxxx.bbox.json' # Detections
```

And a summary plot for the model's errors are saved in ```UODReview/RUOD/modelsxxx/xxx_bbox_summary.json```, one example as follows:

### 3.2 Diagnosis (Matlab)
Our Diagnosis source code is custom-designed for RUOD and UOD datasets, located in ```UODRevew/diagnosis/Diagnosis/```   


### 3.2.1 Put the detection results in
Diagnosis needs to read the txt format detection results saved in per txt per class, such as:
```comp3_det_test_holothurian.txt```
So we need to transfer the json format detection results (produced in Section 2.3.2) into txt per class format using the python script:
```
python ./UODReview/models/convert_json2txt_per_cls.py
```
The txt format results will be saved in ```./UODReview/diagnosis/Diagnosis/detections/xxx```

### 3.2.2 Set Dataset information
Change between DUO and RUOD datasets in ```UODReview/diagnosis/Diagnosis/src/setDatasetParameters.m``` and ```UODReview/diagnosis/Diagnosis/src/VOCcode/VOCinit.m```

### 3.2.3 Set Detector Information and Path of Detection
In ```UODReview/diagnosis/Diagnosis/src/setDetectorInfo.m```, for example, the ATSS detector was set as:
```
  case 'ATSS'
    detpath = '../detections/ATSS/comp3_det_test_%s.txt';
    resultdir = '../results/ATSS';
    detname = 'ATSS'; 
```
### 3.2.4 Start analysis by running   
```UODReview/diagnosis/Diagnosis/src/detectionAnalysisScript.m```


## Contributing

We appreciate all contributions in the field of underwater object detection to improve UODReview. Welcome community users to participate in these projects. 
## Citation

If you use this toolbox or benchmark in your research, please cite this project.

```
@article{UODReview,
  title   = {Underwater Object Detection in the Era of Artificial Intelligence: Current, Challenges and Future},
  author  = {Long Chen, Yuzhi Huang, Junyu Dong, Qi xu, Sam Kwong, Huimin Lu, Chongyi Li},
  journal= {},
  year={2024}
}
```
```
@article{hoiem2012diagnosing,
  title={Diagnosing error in object detectors},
  author={Hoiem, Derek and Chodpathumwan, Yodsawalai and Dai, Qieyun},
  journal={Computer Vision--ECCV 2012},
  pages={340--353},
  year={2012},
  publisher={Springer}
}
```
```
@inproceedings{tide-eccv2020,
  author    = {Daniel Bolya and Sean Foley and James Hays and Judy Hoffman},
  title     = {TIDE: A General Toolbox for Identifying Object Detection Errors},
  booktitle = {ECCV},
  year      = {2020},
}
```


