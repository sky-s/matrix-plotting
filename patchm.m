function h = patchm(varargin)
% PATCHM  Patch using single 2 x n (or 3 x n) matrix as input instead of x, y,
% (and z) vectors. PATCHM(M) is equivalent to patch(M(1,:),M(2,:),...) or
% patch(M(1,:),M(2,:),M(3,:),...).
% 
%   Scalars and row vectors (including handles, Name/Value pairs, etc.) are
%   preserved and passed to the patch function.
% 
%   See also patch, plotm.

%   Copyright 2017 Sky Sartorius
%   Contact: www.mathworks.com/matlabcentral/fileexchange/authors/101715

varargin = parsematrixplotting(varargin{:});

h_ = patch(varargin{:});

if nargout
    h = h_;
end