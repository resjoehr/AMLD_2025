function final_image = label_prob_image(ecg_image, scores, labels)

% Copyright 2020-2021 The MathWorks, Inc.

scores = double(scores);
% Obtain maximum confidence 
[prob,index] = max(scores);
confidence = prob*100;
% Obtain label corresponding to maximum confidence
label = erase(char(labels(index)),'_label');
text = cell(2,1);
text{1} = ['Classification: ' label];
text{2} = ['Confidence: ' sprintf('%0.2f',confidence) '%'];
position = [135 20 0 0; 130 40 0 0];
final_image = insertObjectAnnotation(ecg_image,'rectangle',position,...
    text,'TextBoxOpacity',0.9,'FontSize',9);

end
