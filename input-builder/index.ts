import { readdir } from "node:fs/promises";
import { extname, join } from "node:path";
import { environment } from "./environment";

const inputFiles = await readdir(environment.inputDir);
const outputFiles = (await readdir(environment.outputDir)).map(file => {
  const extension = extname(file);
  return file.replace(extension, '');
});

const remainingInputFiles = inputFiles.filter(inputFile => {
  const fileExtension = extname(inputFile);
  const withoutExtension = inputFile.replace(fileExtension, '');
  return !outputFiles.includes(withoutExtension);
});

console.log(remainingInputFiles.join('\n'));
