function ms_sbvar(M, options)

clean_ms_files(M.fname);

options.data = read_variables(options.datafile,options.varobs,[],options.xls_sheet,options.xls_range);

if options.forecast == 0
    options.forecast = 4;
end

options.ms.output_file_tag = M.fname;
%options.ms.markov_file = 'specification_2v2c.dat';
%options.ms.mhm_file = 'MHM_input.dat';
%options.ms.restriction_fname = 'ftd_upperchol3v'; 

if options.ms.upper_cholesky
    if options.ms.lower_cholesky
        error(['Upper Cholesky and lower Cholesky decomposition can''t be ' ...
               'requested at the same time!'])
    else
        options.ms.restriction_fname = 'upper_cholesky';
    end
elseif options.ms.lower_cholesky
    options.ms.restriction_fname = 'lower_cholesky';
elseif ~isempty(options.ms.Qi) && ~isempty(options.ms.Ri)
    options.ms.restriction_fname = 'exclusions';
end

ms_mardd(options);
end
