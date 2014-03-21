function rat_rem_sigma, arr, sig,stop1=stop1
	inp = arr
	aa= moment(arr,/double,/Nan,sdev=std_dev)
	mean_val = aa[0]
	;	repeat begin
	min = mean_val - (sig*std_dev) & max = mean_val + (sig*std_dev)
	idx1 = where(arr lt min or arr gt max , count)
	if (count gt 0) then begin
		temp = rat_fill_val_nan(inp,index=idx1)
		inp=temp
	endif else print,'%% NO value greater than specified limit)'
	if(KEYWORD_SET(stop1)) then stop
	return,inp

end
