const fs = require("fs");

const runIntcode = input => {
  const result = [...input];

  let i = 0;
  while (i < result.length) {
    const opcode = result[i];

    if (opcode === 99) {
      break;
    }

    const firstNumber = result[result[i + 1]];
    const secondNumber = result[result[i + 2]];

    if (opcode === 1) {
      result[result[i + 3]] = firstNumber + secondNumber;
    }

    if (opcode === 2) {
      result[result[i + 3]] = firstNumber * secondNumber;
    }

    i += 4;
  }

  return result;
};

const runTests = () => {
  const testValues = [
    { expected: [2, 0, 0, 0, 99], input: [1, 0, 0, 0, 99] },
    { expected: [2, 3, 0, 6, 99], input: [2, 3, 0, 3, 99] },
    { expected: [2, 4, 4, 5, 99, 9801], input: [2, 4, 4, 5, 99, 0] },
    {
      expected: [30, 1, 1, 4, 2, 5, 6, 0, 99],
      input: [1, 1, 1, 4, 99, 5, 6, 0, 99]
    }
  ];

  console.log("Tests");

  testValues.map(({ expected, input }, i) => {
    const pass = JSON.stringify(runIntcode(input)) === JSON.stringify(expected);
    console.log(`  Test ${i + 1} ${pass ? "passed 🎉" : "failed 😢"}!`);
  });
};

const solvePuzzle = () => {
  fs.readFile("input.txt", "utf8", (err, data) => {
    if (err) {
      throw err;
    }

    const integers = data.split(",").map(int => +int);

    integers[1] = 12;
    integers[2] = 2;

    const result = runIntcode(integers)[0];
    console.log(`\nPuzzle Answer\n  ${result}`);
  });
};

runTests();
solvePuzzle();
