function [BB, instanceLabels] = getInstanceBB(...
    imgObjectLabels, imgInstances)
  
  %[H, W] = size(imgObjectLabels);  

  pairs = unique([imgObjectLabels(:), uint16(imgInstances(:))], 'rows');
  pairs(sum(pairs, 2) == 0, :) = [];
  
  N = size(pairs, 1);
  
  %instanceMasks = false(H, W, N);
  instanceLabels = zeros(N, 1);
  BB = cell(N, 1);
  for ii = 1 : N
    instanceMask = imgObjectLabels == pairs(ii,1) & imgInstances == pairs(ii,2);
    instanceLabels(ii) = pairs(ii,1);
    rp = regionprops(instanceMask);
    BB{ii} = rp.BoundingBox;
  end
  
  
end