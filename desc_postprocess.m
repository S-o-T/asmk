% Apply some post-processing operations 
%
% Usage: [X Xm] = desc_postprocess (X, Xm)
%
%  X   descriptors
%  Xm  mean descriptor after root-SIFT and L2 normalization
%
% Authors: G. Tolias, Y. Avrithis, H. Jegou. 2013. 
%
function [X Xm] = desc_postprocess (X, Xm)

X = single (X);
X = X.^0.5; % Root-SIFT
X = yael_vecs_normalize (X); % L2 normalize

if ~exist ('Xm')
  Xm = mean (X, 2);
end

X = bsxfun (@minus, X, Xm);   % Subtract the mean
X = yael_vecs_normalize (X); % L2 normalize
X = single (X);
