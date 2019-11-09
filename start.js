// execSync allows us to run system commands synchronously
const { execSync } = require('child_process');

// process.env.PORT is defined by Heroku environment. Use 3200 as fallback if outside of Heroku.
const port = process.env.PORT || 3200;

// Same as runnin "npm run serve" in terminal
execSync(`npm run serve -- -l ${ port} ./build`, (err, stdout, stderr) => {
  if (err) {
    // node couldn't execute the command
    return;
  }

  // the *entire* stdout and stderr (buffered)
  console.log(`${stdout}`);
  console.log(`${stderr}`);
});