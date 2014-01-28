pro rat_ncdf_read,ncfile,list1,__silent=__silent
	nc1 = ncdf_open(ncfile)
	ret_list=list()
	foreach elem,list1,i do begin
		varid =  NCDF_VARID( nc1, elem )
		if(varid lt 0) then begin
			if(~KEYWORD_SET(__silent)) then print,elem+' not found'
			stop
			continue
		endif
		ncdf_varget,nc1,varid,temp
		(SCOPE_VARFETCH(elem, LEVEL=-1,/ENTER))=temp
		delvar,temp,varid
	endforeach
	ncdf_close,nc1
end
