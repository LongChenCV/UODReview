from tidecv import TIDE
import tidecv.datasets as datasets

methods = ['ATSS', 'CascadeRCNN', 'Detectors', 'Foveabox', 'GridRCNN', 'GuidedAnchor', 'Reppoints', 'Retinanet']

for method in methods:
    annFile = '/mnt/storage/home/lchen6/lchen6/data/RUOD/annotations/instances_val2017.json'  # Ground Truth
    resFile = '/mnt/storage/home/lchen6/lchen6/Remote/mmdetection/RUOD/models'+ method+ '/detectionresults' + method + '.bbox.json' # Detections
    gt = datasets.COCO(annFile)
    bbox_results = datasets.COCOResult(resFile)
    tide = TIDE()
    tide.evaluate_range(gt, bbox_results, mode=TIDE.BOX, name=method)
    tide.summarize()
    tide.plot('/mnt/storage/home/lchen6/lchen6/Remote/mmdetection/RUOD/models'+ method)
