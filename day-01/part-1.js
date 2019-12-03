const fs = require("fs");

const getFuelRequirement = mass => {
  return Math.floor(+mass / 3) - 2;
};

const runTests = () => {
  const testValues = [
    { expected: 2, input: 12 },
    { expected: 2, input: 14 },
    { expected: 654, input: 1969 },
    { expected: 33583, input: 100756 }
  ];

  console.log("Tests");
  testValues.forEach(({ expected, input }, i) => {
    const pass = getFuelRequirement(input) === expected;
    console.log(`  Test ${i + 1} ${pass ? "passed 🎉" : "failed 😢"}!`);
  });
};

const solvePuzzle = () => {
  fs.readFile("./input.txt", "utf8", (err, data) => {
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
