function rat_read_h5, file, path
  fid = h5f_open(file)
  did = h5d_open(fid, path)
  data = h5d_read(did)
  h5d_close, did
  h5f_close, fid
  return, data
end
