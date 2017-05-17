function h = plotm(varargin)
% PLOTM  Plot using single 2 x n (or 3 x n) matrices as inputs instead of x, y,
% (and z) vectors. 
%   
%   PLOTM was created so you can stop doing things like this:
% 
%     plot(M(1,:),M(2,:)) or plot3(M(1,:),M(2,:),M(3,:)).
% 
%   and start doing things like this:
% 
%     plotm(M)
% 
%   PLOTM works by separating any matrix with two or more rows into vectors. The
%   vectors are passed to plot for 2 x n and to plot3 for 3 x n. If no inputs
%   have multiple rows, PLOTM calls plot.
% 
%   Scalars and row vectors (including handles, Name/Value pairs, LineSpecs,
%   etc.) are preserved and passed to the plotting functions.
% 
%   Mixed inputs with two rows and three rows will return an error. 
% 
%   Example: Plot using matrices.
%     M1 = randn(3,100);
%     M2 = M1.^2;
%     plotm(M1,'ob',M2,'xr')
% 
%   See also plot, plot3, line, linem, transpose.

%   Copyright 2017 Sky Sartorius
%   Contact: www.mathworks.com/matlabcentral/fileexchange/authors/101715

nDims = NaN;

for i = numel(varargin):-1:1
    M = varargin{i};
    if size(M,1) >= 2
        nDims = size(M,1);
        if nDims > 3
            error('Input must have no more than 3 rows.')
        end
        M = mat2cell(M,ones(nDims,1));
        varargin = [varargin(1:i-1) {M{:}} varargin(i+1:end)];
    end
end

if nDims == 3
    h_ = plot3(varargin{:});
else
    h_ = plot(varargin{:});
end

if nargout
    h = h_;
end