pro rat_ncdf_read,file_list,var_list
kk = 0 & n_files = n_elements(file_list)
if(n_elements(var_list) eq 0) then begin
	var_list=list()
	foreach file,file_list,idx do begin
		if(file_exists(file)) then begin
			nc1 =  ncdf_open(ncfile)
			if(nc1 gt 0) then begin
				n_vars = nc1.Nvars
				var_list=strarr[n_vars]
				for i =0,n_vars-1 do begin
					var_list[i]=(ncdf_varinq(nc1,i)).name
				endfor
				ncdf_close,nc1
				break
			endif
		endif
	endforeach
endif

foreach elem,list1,i do begin
	varid =  NCDF_VARID( nc1, elem )
	if(varid eq 0) then continue
	ncdf_varget,nc1,varid,temp
	(SCOPE_VARFETCH(elem, LEVEL=-1,/ENTER))=temp
	delvar,temp,varid
	endforeach
	ncdf_close,nc1
end
