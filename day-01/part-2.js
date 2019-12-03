const fs = require("fs");

const getFuelRequirement = mass => {
  const fuel = Math.floor(+mass / 3) - 2;

  if (fuel < 0) {
    return 0;
  } else {
    return fuel + getFuelRequirement(fuel);
  }
};

const runTests = () => {
  const testValues = [
    { expected: 2, input: 12 },
    { expected: 966, input: 1969 },
    { expected: 50346, input: 100756 }
  ];

  console.log("Tests");

  testValues.forEach(({ expected, input }, i) => {
    const pass = getFuelRequirement(input) === expected;
    console.log(`  Test ${i + 1} ${pass ? "passed 🎉" : "failed 😢"}!`);
  });
};

const solvePuzzle = () => {
  fs.readFile("input.txt", "utf8", (err, data) => {
    if (err) {
      throw err;
    }

    const masses = data.split("\n");
    const result = masses
      .map(mass => getFuelRequirement(mass))
      .reduce((a, b) => a + b);

    console.log(`\nPuzzle Answer\n  ${result}`);
  });
};

runTests();
solvePuzzle();
