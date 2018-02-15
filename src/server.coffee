module.exports = ({getEntry,path,fs,position}) =>
  testFolder = path.resolve("./test")

  getEntry.hookIn position.init, (o) =>
    o.files = await fs.readdir(testFolder)

  getEntry.hookIn (o) =>
    tmp = o.entry = {}
    for file in o.files
      tmp[file] = path.join(testFolder, file) unless file.startsWith("_")
