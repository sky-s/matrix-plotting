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

varargin = parsematrixplotting(varargin{:});

h_ = line(varargin{:});

if nargout
    h = h_;
end