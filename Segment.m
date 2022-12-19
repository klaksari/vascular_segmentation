
%% Vessel enhancement
% Run the FrangiVesselnessFilter3D executable file to obtain the variable
% 'Ivessel'before proceeding to the final binarization step below

%% Image Segmentation - binarization

Ivessel = mat2gray(Ivessel);

% Threshold Ivessel to obtain a binary/logical variable which contains the
% segmentation
BW = Ivessel>0.0005; % IF NEEDED, adjust this threshold based on the raw probability values obtained in Ivessel

%Noise removal and deleting any unwantred disconnected segments smaller
%than 1000 pixels and connectivity defined using 6 neighbors. For more
%info, check help bwareaopen

BW = bwareaopen(BW,2000,6); %readjust the number of pixels (from 1000 to higher of lower) based on the noise level or disconnected segments in your final segmentation

%Save final segmentation as matfiles
save ('segmentation', 'BW')