function h = linem(varargin)
% LINEM  Line using single 2 x n (or 3 x n) matrix as input instead of x, y,
% (and z) vectors. LINEM(M) is equivalent to line(M(1,:),M(2,:)) or
% line(M(1,:),M(2,:),M(3,:)).
% 
%   Scalars and row vectors (including handles, Name/Value pairs, etc.) are
%   preserved and passed to the line function.
% 
%   Example.
%     linem(randn(3,100),'LineStyle','none','Marker','x')
% 
%   See also plot, plot3, line, plotm, transpose.

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

h_ = line(varargin{:});

if nargout
    h = h_;
end