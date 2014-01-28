pro rat_stat,arr,fill_val=fill_val,stop1=stop1

if(KEYWORD_SET(fill_val)) then inp = rat_fill_val_nan(arr,fill_val=fill_val) $
	else inp = arr
print,'Mean : '+string(avg(inp,/Nan))
print,'Median : '+string(median(inp))
print,'Max : '+string(max(inp,/nan))
print,'Min : '+string(min(inp,/nan))
print,'Std. Dev : '+string(stddev(inp,/nan,/double))
sd = stddev(inp,/nan,/double)
mu = avg(inp,/Nan)
idx = where(abs(inp-mu) le sd , n_sig1)
idx = where(abs(inp-mu) le (2*sd) , n_sig2)
idx = where(abs(inp-mu) le (3*sd) , n_sig3)
idx = where(finite(inp) eq 1 , n_finite)
n1_sigp = (n_sig1/double(n_finite))*100
n2_sigp = (n_sig2/double(n_finite))*100
n3_sigp = (n_sig3/double(n_finite))*100
print,'Points within 1-sigma (in %) : '+string(n1_sigp,form='(F5.2)')
print,'Points within 2-sigma (in %) : '+string(n2_sigp,form='(F5.2)')
print,'Points within 3-sigma (in %) : '+string(n3_sigp,form='(F5.2)')
if(KEYWORD_SET(stop1)) then stop
end

