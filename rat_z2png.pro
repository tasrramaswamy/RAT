pro rat_z2png , fname
np=n_params()
if(np eq 0) then fname='idl.png'
thisDev=!D.NAME
if(thisDev ne 'Z') then begin
		message,'Current Device Not Z BUffer'
endif
 img=tvrd()
 tvlct,r,g,b,/get
 ; outfile=(strsplit(file,'.',/ext))[0]+'.png'
 print,'Printing Zbuffer to '+fname
 write_png,fname,img,r,g,b
end

