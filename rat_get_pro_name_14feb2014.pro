;+
;Stacks the names of routines with MAIN at the bottom
;if Level is zero :default case. Pop the topmost routine name
;;level <0 : pops the name corresponding to the level.
;-

function rat_get_pro_name, level,stop1=stop1



help,calls=level_name,/traceback
n_levels = n_elements(level_name)-1
names = level_name[1:n_levels]
np = n_params()
if(np eq 0) then inp=-1 else inp=level
if(inp eq 0) then inp=-1
if(inp le 0) then begin
	idx = (n_levels + inp) >0
	str1 =names[idx]
endif else begin
	idx = (inp-1 ) < (n_levels-1)
	str1 = names[idx]
endelse
ret_str=''
;pos1 = strpos(str1,'MAIN')
pos1 = strpos(str1,'<')
if(pos1 lt 0) then ret_str=str1   else begin
	pos2 = strpos(str1,'<')
	pos3 = strpos(str1,'(')
	str2 =strmid(str1,pos2+1,pos3-pos2-1)
	ret_str = ret_str+str2
endelse
if(keyword_set(stop1)) then stop
return,strcompress(ret_str)
end
	
