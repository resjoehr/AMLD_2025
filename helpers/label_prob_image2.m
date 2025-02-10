function final_image = label_prob_image(ecg_image, scores, labels, scores2, labels2)

% Copyright 2020-2021 The MathWorks, Inc.

scores = double(scores);
% Obtain maximum confidence 
[prob,index] = max(scores);
confidence = prob*100;
% Obtain label corresponding to maximum confidence
label = erase(char(labels(index)),'_label');
text = cell(2,1);
text{1} = ['Classification (CNN): ' label];
text{2} = ['Confidence: ' sprintf('%0.2f',confidence) '%'];
position = [100 20 0 0; 130 40 0 0];
ecg_image_mod = insertObjectAnnotation(ecg_image,'rectangle',position,...
    text,'TextBoxOpacity',0.9,'FontSize',9);

scores2 = double(scores2);
% Obtain maximum confidence 
[prob2,index2] = max(scores2);
confidence2 = prob2*100;
label2 = erase(char(labels2(index2)),'_label');
text2 = cell(2,1);
text2{1} = ['Classification (LSTM): ' label2];
text2{2} = ['Confidence: ' sprintf('%0.2f',confidence2) '%'];
position2 = [100 190 0 0; 130 210 0 0];
final_image = insertObjectAnnotation(ecg_image_mod,'rectangle',position2,...
    text2,'TextBoxOpacity',0.9,'FontSize',9);

end
