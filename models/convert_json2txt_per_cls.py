#COCO format to Txt Per Class
import os
import json

methods=['CascadeRCNN', 'ATSS', 'Detectors', 'Foveabox', 'GridRCNN', 'GuidedAnchor', 'Retinanet', 'Reppoints']
for method in methods:
    anno_txt_save_path= r'/Users/longchen/Desktop/UODReview/diagnosis/Diagnosis/detections/'+method
    json_file = r'/Users/longchen/Desktop/UODReview/models/RUOD/models'+method+'/detectionresults'+method + '.bbox.json'
    data = json.load(open(json_file, 'r'))
    if not os.path.exists(anno_txt_save_path):
        os.makedirs(anno_txt_save_path)

    # 1: holothurian, 2: echinus, 3: scallop, 4: starfish, 5: fish, 6: corals, 7: diver, 8: cuttlefish, 9: turtle, 10: jellyfish
    holothurian=open(os.path.join(anno_txt_save_path, 'comp3_det_test_holothurian.txt'), 'w')
    echinus=open(os.path.join(anno_txt_save_path, 'comp3_det_test_echinus.txt'), 'w')
    scallop=open(os.path.join(anno_txt_save_path, 'comp3_det_test_scallop.txt'), 'w')
    starfish=open(os.path.join(anno_txt_save_path, 'comp3_det_test_starfish.txt'), 'w')
    fish=open(os.path.join(anno_txt_save_path, 'comp3_det_test_fish.txt'), 'w')
    corals=open(os.path.join(anno_txt_save_path, 'comp3_det_test_corals.txt'), 'w')
    diver=open(os.path.join(anno_txt_save_path, 'comp3_det_test_diver.txt'), 'w')
    cuttlefish=open(os.path.join(anno_txt_save_path, 'comp3_det_test_cuttlefish.txt'), 'w')
    turtle=open(os.path.join(anno_txt_save_path, 'comp3_det_test_turtle.txt'), 'w')
    jellyfish=open(os.path.join(anno_txt_save_path, 'comp3_det_test_jellyfish.txt'), 'w')

    for box in data:
        bbox= box['bbox']
        category = box['category_id']
        image_id = box['image_id']
        # image_id = str(image_id)
        image_id = str(image_id).zfill(6)
        score = str(box['score'])
        # 0: holothurian, 1: echinus, 2: scallop, 3: starfish, 4: fish, 5: corals, 6: diver, 7: cuttlefish, 8: turtle, 9: jellyfish
        if category==1:
            holothurian.write("%s %s %s %s %s %s\n" % (image_id, score, str(int(bbox[0])), str(int(bbox[1])), str(int(bbox[0]+bbox[2])), str(int(bbox[1]+bbox[3]))))
        if category==2:
            echinus.write("%s %s %s %s %s %s\n" % (image_id, score, str(int(bbox[0])), str(int(bbox[1])), str(int(bbox[0]+bbox[2])), str(int(bbox[1]+bbox[3]))))
        if category==3:
            scallop.write("%s %s %s %s %s %s\n" % (image_id, score, str(int(bbox[0])), str(int(bbox[1])), str(int(bbox[0]+bbox[2])), str(int(bbox[1]+bbox[3]))))
        if category==4:
            starfish.write("%s %s %s %s %s %s\n" % (image_id, score, str(int(bbox[0])), str(int(bbox[1])), str(int(bbox[0]+bbox[2])), str(int(bbox[1]+bbox[3]))))
        if category==5:
            fish.write("%s %s %s %s %s %s\n" % (image_id, score, str(int(bbox[0])), str(int(bbox[1])), str(int(bbox[0]+bbox[2])), str(int(bbox[1]+bbox[3]))))
        if category==6:
            corals.write("%s %s %s %s %s %s\n" % (image_id, score, str(int(bbox[0])), str(int(bbox[1])), str(int(bbox[0]+bbox[2])), str(int(bbox[1]+bbox[3]))))
        if category==7:
            diver.write("%s %s %s %s %s %s\n" % (image_id, score, str(int(bbox[0])), str(int(bbox[1])), str(int(bbox[0]+bbox[2])), str(int(bbox[1]+bbox[3]))))
        if category==8:
            cuttlefish.write("%s %s %s %s %s %s\n" % (image_id, score, str(int(bbox[0])), str(int(bbox[1])), str(int(bbox[0]+bbox[2])), str(int(bbox[1]+bbox[3]))))
        if category==9:
            turtle.write("%s %s %s %s %s %s\n" % (image_id, score, str(int(bbox[0])), str(int(bbox[1])), str(int(bbox[0]+bbox[2])), str(int(bbox[1]+bbox[3]))))
        if category==10:
            jellyfish.write("%s %s %s %s %s %s\n" % (image_id, score, str(int(bbox[0])), str(int(bbox[1])), str(int(bbox[0]+bbox[2])), str(int(bbox[1]+bbox[3]))))
    holothurian.close()
    echinus.close()
    scallop.close()
    starfish.close()
    fish.close()
    corals.close()
    diver.close()
    cuttlefish.close()
    turtle.close()
    jellyfish.close()

    print("Convert Successful!")



