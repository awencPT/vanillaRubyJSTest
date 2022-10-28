import {
  Multicall,
  // ContractCallResults,
  // ContractCallContext,
} from 'ethereum-multicall';
import fs from "fs";
import csvWriter from "csv-write-stream";


console.log("HELLO")
const finalPathFile = "/csvTest.csv";


let writer;
if (!fs.existsSync(finalPathFile)){
   writer = csvWriter({ headers: ["header0"]});
 }else{
   writer = csvWriter({sendHeaders: false});
}
 writer.pipe(fs.createWriteStream(finalPathFile, {flags: 'a'}));


 writer.write({
   header0:"HELLO"
 });

 writer.end()
const main = async function(){
  return "HELLO"
}

main()