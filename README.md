# Matrix plotting

Plot using single 2 x n (or 3 x n) matrices as inputs instead of x, y, (and z) vectors.

[![View Matrix plotting on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/62962)

plotm was created so you can stop doing things like this:

`plot(M(1,:),M(2,:))` or `plot3(M(1,:),M(2,:),M(3,:))`

and start doing things like this:

`plotm(M)`

`plotm` works by separating any matrix with two or more rows into vectors. The vectors are passed to `plot` for 2 x n and to `plot3` for 3 x n. If no inputs have multiple rows, `plotm` calls `plot`.

Scalars and row vectors (including handles, Name/Value pairs, LineSpecs, etc.) are preserved and passed to the plotting functions. For example, `plotm(M1,'or',M2,'xb')`.

The equivalent function for `line`, `linem`, is also included.
