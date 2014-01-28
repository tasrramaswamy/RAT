function rat_sort,arr,sorted=sorted

n_dim = SIZE(arr,/N_DIMENSIONS)
dim = SIZE(arr,/DIMENSIONS)
    s_idx = sort(arr)
    if(n_dim eq 2) then begin
    a_idx2d = array_indices(arr,s_idx)
    sorted = arr(a_idx2d(0,*),a_idx2d(1,*))
    endif else begin
    a_idx2d = s_idx 
    sorted = arr[s_idx]
    endelse
if(KEYWORD_SET(sorted)) then r = sorted	 else r = a_idx2d
;stop
return,r
end
