

pro rat_brewer_div ,idx
	if(n_elements(idx) eq 0) then idx=0
	
		seq=[[140,81,10],$
		[191,129,45],$
		[223,194,125],$
		[246,232,195],$
		[245,245,245],$
		[199,234,229],$
		[128,205,193],$
		[53,151,143],$
		[1,102,94]]
	;rat_brewer,36
	;tvlct,r,g,b,/get
	r = bytarr(256) & g = r & b=r
	r1 = seq[0,*] & g1=seq[1,*] & b1=seq[2,*]
	n1 = n_elements(r1)
	r[0:n1-1]=r1 & g[0:n1-1]=g1 & b[0:n1-1]=b1


	r[255]=255 & g[255]=255 & b[255]=255
	r[254]=0  & g[254]=0 & b[254]=0
	r[251]=130 & g[251]=130 & b[251]=130
	TVLCT,r,g,b
	!p.background=251
	!p.COLOR=254
	erase
end

