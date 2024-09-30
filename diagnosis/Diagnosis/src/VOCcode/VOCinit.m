clear VOCopts

VOCopts.dataset='RUOD';
devkitroot = '/Users/longchen/Desktop/UODReview';
VOCopts.datadir=[devkitroot '/'];

% change this path to a writable directory for your results
VOCopts.resdir=[devkitroot '/results/' VOCopts.dataset '/'];
% change this path to a writable local directory for the example code
VOCopts.localdir=[devkitroot '/local/' VOCopts.dataset '/'];

% initialize the training set
VOCopts.trainset='train'; % use train for development
% VOCopts.trainset='trainval'; % use train+val for final challenge

% initialize the test set
VOCopts.testset='test'; % use validation data for development test set
% VOCopts.testset='test'; % use test set for final challenge

% initialize main challenge paths
VOCopts.annopath=[VOCopts.datadir VOCopts.dataset '/Annotations/%s.xml'];
VOCopts.imgpath=[VOCopts.datadir VOCopts.dataset '/test/%s.jpg'];
VOCopts.imgsetpath=[VOCopts.datadir VOCopts.dataset '/ImageSets/Main/%s.txt'];
VOCopts.clsimgsetpath=[VOCopts.datadir VOCopts.dataset '/ImageSets/Main/%s_%s.txt'];
VOCopts.clsrespath=[VOCopts.resdir 'Main/%s_cls_' VOCopts.testset '_%s.txt'];
VOCopts.detrespath=[VOCopts.resdir 'Main/%s_det_' VOCopts.testset '_%s.txt'];

% initialize segmentation task paths

VOCopts.seg.clsimgpath=[VOCopts.datadir VOCopts.dataset '/SegmentationClass/%s.png'];
VOCopts.seg.instimgpath=[VOCopts.datadir VOCopts.dataset '/SegmentationObject/%s.png'];

VOCopts.seg.imgsetpath=[VOCopts.datadir VOCopts.dataset '/ImageSets/Segmentation/%s.txt'];

VOCopts.seg.clsresdir=[VOCopts.resdir 'Segmentation/%s_%s_cls'];
VOCopts.seg.instresdir=[VOCopts.resdir 'Segmentation/%s_%s_inst'];
VOCopts.seg.clsrespath=[VOCopts.seg.clsresdir '/%s.png'];
VOCopts.seg.instrespath=[VOCopts.seg.instresdir '/%s.png'];

% initialize layout task paths

VOCopts.layout.imgsetpath=[VOCopts.datadir VOCopts.dataset '/ImageSets/Layout/%s.txt'];
VOCopts.layout.respath=[VOCopts.resdir 'Layout/%s_layout_' VOCopts.testset '.xml'];

% % DUO Dataset
% VOCopts.classes={...
%     'holothurian'
%     'echinus'
%     'scallop'
%     'starfish'};

% RUOD Dataset
VOCopts.classes={...
    'holothurian'
    'echinus'
    'scallop'
    'starfish'
    'fish'
    'corals'
    'diver'
    'cuttlefish'
    'turtle'
    'jellyfish'};
VOCopts.nclasses=length(VOCopts.classes);	

VOCopts.poses={...
    'Unspecified'
    'SideFaceLeft'
    'SideFaceRight'
    'Frontal'
    'Rear'};

VOCopts.nposes=length(VOCopts.poses);

VOCopts.parts={...
    'head'
    'hand'
    'foot'};    

VOCopts.maxparts=[1 2 2];   % max of each of above parts

VOCopts.nparts=length(VOCopts.parts);

VOCopts.minoverlap=0.5;

% annotation cache for evaluation

VOCopts.annocachepath=[VOCopts.localdir '%s_anno.mat'];

% options for example implementations

VOCopts.exfdpath=[VOCopts.localdir '%s_fd.mat'];
