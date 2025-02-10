function ecg_image  = ecg_to_scalogram(ecg_signal)

% Copyright 2020 The MathWorks, Inc.

persistent jetdata;
if(isempty(jetdata))
    jetdata = ecgColorMap(128,'single');
end
% Obtain wavelet coefficients from ECG signal
cfs = cwt_ecg(ecg_signal);  
% Obtain scalogram from wavelet coefficients
image = ind2rgb(im2uint8(rescale(cfs)),jetdata);
ecg_image = im2uint8(imresize(image,[227,227]));
%ecg_image = imresize(image,[227,227]);

end