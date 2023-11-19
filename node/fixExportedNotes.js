/**
 * Remove first line of the exported notes without changing the last modified date
 * to keep the sorting of the notes the same.
 */

const fs = require("fs");
const { program } = require("commander");

program.argument("<directory>", "Directory to fix");

program.parse();

const directoryPath = program.args[0];

fs.readdir(directoryPath, (err, files) => {
  if (err) {
    console.error("Error reading directory:", err);
    return;
  }

  files.forEach((file) => {
    const filePath = `${directoryPath}/${file}`;

    if (fs.statSync(filePath).isFile()) {
      const contents = fs.readFileSync(filePath, "utf8");

      const newContents = contents.replace(/^.+\n/, "");

      const stats = fs.statSync(filePath);

      fs.writeFileSync(filePath, newContents);

      console.log("times", stats.atime, stats.mtime);

      fs.utimesSync(filePath, stats.atime, stats.mtime);
    }
  });
});
