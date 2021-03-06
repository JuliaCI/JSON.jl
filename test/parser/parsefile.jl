tmppath, io = mktemp()
write(io, facebook)
close(io)
if is_windows()
    # don't use mmap on Windows, to avoid ERROR: unlink: operation not permitted (EPERM)
    @test haskey(JSON.parsefile(tmppath; use_mmap=false), "data")
else
    @test haskey(JSON.parsefile(tmppath), "data")
end
rm(tmppath)
