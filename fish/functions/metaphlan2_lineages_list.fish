function metaphlan2_lineages_list
    python -c "import pickle;import bz2;handle = bz2.open('/ldfssz1/ST_META/share/database/huttenhower.sph.harvard.edu/metaphlan2/db_v20/mpa_v20_m200.pkl', 'rb');mpa = pickle.load(handle);print('\n'.join(sorted(mpa['taxonomy'].keys())));handle.close();"
end
