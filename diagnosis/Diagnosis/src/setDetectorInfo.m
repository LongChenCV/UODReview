function [detpath, resultdir, detname] = setDetectorInfo(detector)
% [detpath, resultdir, detname] = setDetectorInfo(detector)
%
% sets path etc for given detector

switch detector  
    
  case 'CascadeRCNN'
    detpath = '/Users/longchen/Desktop/UODReview/diagnosis/Diagnosis/detections/CascadeRCNN/comp3_det_test_%s.txt';
    resultdir = '/Users/longchen/Desktop/UODReview/diagnosis/Diagnosis/results/CascadeRCNN';
    detname = 'CascadeRCNN';   

  case 'ATSS'
    detpath = '/Users/longchen/Desktop/UODReview/diagnosis/Diagnosis/detections/ATSS/comp3_det_test_%s.txt';
    resultdir = '/Users/longchen/Desktop/UODReview/diagnosis/Diagnosis/results/ATSS';
    detname = 'ATSS';

  case 'DetectoRS'
    detpath = '/Users/longchen/Desktop/Project/Underwater/Diagnosis/detections/DetectoRS/comp3_det_test_%s.txt';
    resultdir = '/Users/longchen/Desktop/Project/Underwater/Diagnosis/results/DetectoRS';
    detname = 'DetectoRS';   

  case 'Foveabox'
    detpath = '/Users/longchen/Desktop/Project/Underwater/Diagnosis/detections/Foveabox/comp3_det_test_%s.txt';
    resultdir = '/Users/longchen/Desktop/Project/Underwater/Diagnosis/results/Foveabox';
    detname = 'Foveabox';   

  case 'GridRCNN'
    detpath = '/Users/longchen/Desktop/Project/Underwater/Diagnosis/detections/GridRCNN/comp3_det_test_%s.txt';
    resultdir = '/Users/longchen/Desktop/Project/Underwater/Diagnosis/results/GridRCNN';
    detname = 'GridRCNN';   

  case 'GuidedAnchor'
    detpath = '/Users/longchen/Desktop/Project/Underwater/Diagnosis/detections/GuidedAnchor/comp3_det_test_%s.txt';
    resultdir = '/Users/longchen/Desktop/Project/Underwater/Diagnosis/results/GuidedAnchor';
    detname = 'GuidedAnchor';   

  case 'RepPoints'
    detpath = '/Users/longchen/Desktop/Project/Underwater/Diagnosis/detections/RepPoints/comp3_det_test_%s.txt';
    resultdir = '/Users/longchen/Desktop/Project/Underwater/Diagnosis/results/RepPoints';
    detname = 'RepPoints';   

  case 'Retinanet'
    detpath = '/Users/longchen/Desktop/Project/Underwater/Diagnosis/detections/Retinanet/comp3_det_test_%s.txt';
    resultdir = '/Users/longchen/Desktop/Project/Underwater/Diagnosis/results/Retinanet';
    detname = 'Retinanet';   
    
  otherwise
    error('unknown detector')
end
