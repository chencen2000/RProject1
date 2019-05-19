finfo = file.info("data/test.bin")
toread = file("data/test.bin", "rb")
alldata = readBin(toread, raw(), size = 1, n = finfo$size)
#plot(alldata)