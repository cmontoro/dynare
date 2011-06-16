function fn_fprintmatrix(fid, M, nrows, ncols, indxFloat)
% Prints the matrix to an ascii file indexed by fid.
%
% Inputs:
%   fid:  Ascii file id.  Example:  fid = fopen('outdatainp_3s_stv_tvms6lags.prn','a');
%   M:  The matrix to be written to the file.
%   nrows:  Number of rows of M.
%   ncols:  Number of columns of M.
%   indxFloat:  1 if double;
%               2 if single;
%               3 if only 3 significant digits
%               0 if integer.
%
if nrows~=size(M,1)
   nrows
   size(M,1)
   error('fn_fprintmatrix(): Make sure the row number supplied match that of the matrix');
end
if ncols~=size(M,2)
   ncols
   size(M,2)
   error('fn_fprintmatrix(): Make sure the column number supplied match that of the matrix');
end
for ki=1:nrows
   for kj=1:ncols
      if (indxFloat == 1)
         fprintf(fid,' %.16e ',M((kj-1)*nrows+ki));
      elseif (indxFloat == 2)
         fprintf(fid,' %.8e ',M((kj-1)*nrows+ki));
      elseif (indxFloat == 3)
         fprintf(fid,' %.3e ',M((kj-1)*nrows+ki));
      else
         fprintf(fid,' %d ',M((kj-1)*nrows+ki));
      end
      if (kj==ncols)
         fprintf(fid,'\n');
      end
   end
   if (ki==nrows)
      fprintf(fid,'\n\n');
   end
end