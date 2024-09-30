function dataset_params = setDatasetParameters(dataset)
% dataset_params = setDatasetParameters(dataset)
%
% Sets machine-specific and datset-specific parameters such as image paths.
%
% Required parameters:
%   imdir: directory containing images
%   objnames_all{nclasses}: names for each object class, order specifies
%     index for each class
%   objnames_extra{nclasses}: names of classes for more detailed analysis
%     (may only be relevant for VOC2007); if not available, set to {}
%   similar_classes{ngroups}: set of equivalence sets such that any pair of
%     classes in an equivalence set is considered similar (symmetric binary
%     confusion matrix can be encoded as a set of pairs); sets consist of
%     indices into classes given by objnames_all
%  summary_sets{nsets}: sets of indices that will be used to summarize
%     stastics
%  summary_setnames{nsets}: names of each set (e.g., animal)

switch lower(dataset)
  case 'voc'
    dataset_params.imset = 'test';  % set used for analysis

    dataset_params.imdir = '/Users/longchen/Desktop/UODReview/RUOD/test/'; % needs to be set for your computer
    dataset_params.VOCset = 'RUOD';

    dataset_params.VOCsourcepath = '/Users/longchen/Desktop/UODReview/diagnosis/Diagnosis/src/VOCcode';  % change this for later VOC versions
    addpath(dataset_params.VOCsourcepath);
    dataset_params.annotationdir = '/Users/longchen/Desktop/UODReview/diagnosis/Diagnosis/annotations';
    dataset_params.objnames_extra = {}; % required parameter: specify objects with extra annotation -- set to empty set if not using VOC2007
    dataset_params.confidence_threshold = -Inf; % minimum confidence to be included in analysis (e.g., set to 0.01 to improve speed)
    
    % all object names
%     % RUOD Dataset
    dataset_params.objnames_all = {'holothurian', 'echinus', 'scallop', 'starfish', 'fish', 'corals', 'diver', 'cuttlefish', 'turtle', 'jellyfish'};
    dataset_params.similar_classes = {'holothurian', 'echinus', 'scallop', 'starfish', 'fish', 'corals', 'diver', 'cuttlefish', 'turtle', 'jellyfish'};

%     % DUO Dataset
%     dataset_params.objnames_all = {'holothurian', 'echinus', 'scallop', 'starfish'};
%     dataset_params.similar_classes = {'holothurian', 'echinus', 'scallop', 'starfish'};

    % specify summary sets
    dataset_params.summary_sets = {};
    dataset_params.summary_setnames = {};
    
    % localization criteria
    dataset_params.iuthresh_weak = 0.1;  % intersection/union threshold
    dataset_params.idthresh_weak = 0;    % intersection/det_area threshold
    dataset_params.iuthresh_strong = 0.5;  % intersection/union threshold
    dataset_params.idthresh_strong = 0;    % intersection/det_area threshold
    
end
