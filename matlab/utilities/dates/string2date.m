function date = string2date(a) % --*-- Unitary tests --*--
    
% Copyright (C) 2013 Dynare Team
%
% This file is part of Dynare.
%
% Dynare is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% Dynare is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with Dynare.  If not, see <http://www.gnu.org/licenses/>.

date = struct('freq', NaN, 'time', NaN(1,2));

if ~ischar(a) || ~isdate(a)
    error('dates::string2date: Input must be a string that can be interpreted as a date!');
end

if isyearly(a)
    year = 1:(regexp(a,'[AaYy]')-1);
    date.freq = 1;
    date.time = write_time_field(a, year);
    return
end

if isquaterly(a)
    year = 1:(regexp(a,'[Qq]')-1);
    date.freq = 4;
    date.time = write_time_field(a, year);
    return
end

if ismonthly(a)
    year = 1:(regexp(a,'[Mm]')-1);
    date.freq = 12;
    date.time = write_time_field(a, year);
    return
end

if isweekly(a)
    year = 1:(regexp(a,'[Ww]')-1);
    date.freq = 52;
    date.time = write_time_field(a, year);
    return
end

function b = write_time_field(c, d)
    b(1) = str2num(c(d));
    if ismember(c(d(end)+1),{'Y','y','A','a'})
        b(2) = 1;
    else
        b(2) = str2num(c(d(end)+2:end));
    end

%@test:1
%$
%$ % Define some dates
%$ date_1 = '1950Q2';
%$ date_2 = '1950m10';
%$ date_3 = '1950w50';
%$ date_4 = '1950a';
%$ date_5 = '1967y';
%$ date_6 = '2009A';
%$
%$ % Define expected results.
%$ e_date_1 = [1950 2];
%$ e_freq_1 = 4;
%$ e_date_2 = [1950 10];
%$ e_freq_2 = 12;
%$ e_date_3 = [1950 50];
%$ e_freq_3 = 52;
%$ e_date_4 = [1950 1];
%$ e_freq_4 = 1;
%$ e_date_5 = [1967 1];
%$ e_freq_5 = 1;
%$ e_date_6 = [2009 1];
%$ e_freq_6 = 1;
%$
%$ % Call the tested routine.
%$ d1 = string2date(date_1);
%$ d2 = string2date(date_2);
%$ d3 = string2date(date_3);
%$ d4 = string2date(date_4);
%$ d5 = string2date(date_5);
%$ d6 = string2date(date_6);
%$
%$ % Check the results.
%$ t(1) = dyn_assert(d1.time,e_date_1);
%$ t(2) = dyn_assert(d2.time,e_date_2);
%$ t(3) = dyn_assert(d3.time,e_date_3);
%$ t(4) = dyn_assert(d4.time,e_date_4);
%$ t(5) = dyn_assert(d5.time,e_date_5);
%$ t(6) = dyn_assert(d6.time,e_date_6);
%$ t(7) = dyn_assert(d1.freq,e_freq_1);
%$ t(8) = dyn_assert(d2.freq,e_freq_2);
%$ t(9) = dyn_assert(d3.freq,e_freq_3);
%$ t(10) = dyn_assert(d4.freq,e_freq_4);
%$ t(11)= dyn_assert(d5.freq,e_freq_5);
%$ t(12)= dyn_assert(d6.freq,e_freq_6);
%$ T = all(t);
%@eof:1