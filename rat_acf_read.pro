pro rat_acf_read,fname,x1,x2,x3,x4,x5,x6,x7,n_lines=n_lines,$
	start=start,$
	stop1=stop1

;+
;This procedure reads the ACF files(format is specified beloe).
; FORMAT  = year day daynumber acf_chan01 acf_chan02.....acf_chan13
;-
; ##04/25/12 Tranpose the last variable if it contains only one column
para=N_params()
no_para = para-1	; Number of variables (parameters) called from main program
if(n_elements(START) eq 0 ) then d_start =0 else d_start = start-1
idx_para = indgen(no_para-1) ; index of the called variables, except last variable


DATA = READ_ASCII(fname,COMMENT=';',data_start=d_start)

D=DATA.(0)

data_dim = size(D,/dimensions)
n_rows = data_dim[0]

idx_rows_data = indgen(n_rows)

excess_rows = rat_1notin2(idx_rows_data,idx_para)

;Transpose excess rows if it has only one row.
for i= 0 , no_para-2 do begin
	temp= transpose(D[i,*])
	case i of
	0:	x1 = temp
	1:	x2 = temp
	2:	x3=temp
	3:	x4=temp
	4:	x5=temp
	5:	x6=temp
	endcase

endfor

extra_val = D[excess_rows,*]

;Trnapose the array if it has only one dimension
if(n_elements(excess_rows) eq 1) then extra_val = transpose(extra_val)
case i of 
1:	x2 = extra_val
2:	x3 = extra_val
3:	x4 = extra_val
4:	x5 = extra_val
5:	x6 = extra_val
6:	x7= extra_val
endcase

n_lines=n_elements(x1)
if(KEYWORD_SET(stop1)) then stop
end
