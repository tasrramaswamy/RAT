pro rat_brewer_sav ,seq
	if(n_elements(seq) eq 0) then $
		seq=[[255,255,204],$
		[255,237,160],$
		[254,217,118],$
		[254,178,76],$
		[253,141,60],$
		[252,78,42],$
		[227,26,28],$
		[189,0,38],$
		[128,0,38]]
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
	!p.background=255
	!p.COLOR=254
	erase
end

