function [] = dwisplitshells(bvecPath, ...
                             xFlip, yFlip, zFlip, ...
                             outputPath)
                         
if ~exist(xFlip)  | strcmp(xFlip, 'false')
    xFlip = false;
else
    xFlip = true;
end
if ~exist(yFlip)  | strcmp(yFlip, 'false')
    yFlip = false;
else
    yFlip = true;
end
if ~exist(zFlip)  | strcmp(zFlip, 'false')
    zFlip = false;
else
    zFlip = true;
end

if ~exist(outputPath)
    outputPath = fileparts(bvecPath);
end

% Local data for testing
%{
    bvecPath = 'local/testdata/bvec/101915_dwi.bvec';
%}

% Read the files according the provided path
bvecs = dlmread(bvecPath);

% Make it into rows
if ~(size(bvecs,1) == 3), bvecs = bvecs'; end


if ~xFlip & ~yFlip & ~zFlip
    toTheName = 'noFlips';
else
    toTheName = 'flippedBy';
end


% Shift if required
if xFlip
    bvecs(1,:) = -bvecs(1,:);
    toTheName=[toTheName 'X'];
end
if yFlip
    bvecs(2,:) = -bvecs(2,:);
    toTheName=[toTheName 'Y'];
end
if zFlip
    bvecs(3,:) = -bvecs(3,:);
    toTheName=[toTheName 'Z'];
end

dlmwrite('dwi.bvecs',bvecs,'delimiter',' ');


% Obtain the fileparts
[~ ,bvecFileName,bvecFileExt] = fileparts(bvecPath);
bvecName = fullfile(outputPath, [bvecFileName '_' toTheName  bvecFileExt]);
dlmwrite(bvecName, bvecs,'delimiter',' ');

% For future reference, compiled used the following command:
% mcc -m dwiflipbvec.m


