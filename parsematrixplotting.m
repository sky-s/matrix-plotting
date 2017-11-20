function varargin = parsematrixplotting(varargin)
% PARSEMATRIXPLOTTING  Expand 2 x n (or 3 x n) matrix in a set of inputs into x,
% y, (and z) vector inputs for plotting functions. 
% 
%   Scalars and row vectors (including handles, Name/Value pairs, etc.) are
%   preserved and passed to the outup.
% 
%   Example.
%     v = parsematrixplotting(randn(3,100),'LineStyle','none','Marker','x');
%     line(v{:})
% 
%   See also plotm, linem, transpose.

%   Copyright 2017 Sky Sartorius
%   Contact: www.mathworks.com/matlabcentral/fileexchange/authors/101715

for i = numel(varargin):-1:1
    M = varargin{i};
    if size(M,1) >= 2
        nDims = size(M,1);
        if nDims > 3
            error('Input must have no more than 3 rows.')
        end
        M = mat2cell(M,ones(nDims,1));
        varargin = [varargin(1:i-1) {M{:}} varargin(i+1:end)]; %#ok<CCAT1>
    end
end