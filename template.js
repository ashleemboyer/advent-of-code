const runTests = () => {
  const testValues = [{ expected: "TODO", input: "TODO" }];

  console.log("Tests");

  testValues.map(({ expected, input }, i) => {
    const pass = false;
    console.log(`  Test ${i + 1} ${pass ? "passed 🎉" : "failed 😢"}!`);
  });
};

const solvePuzzle = () => {
  const result = "TODO";
  console.log(`\nPuzzle Answer\n  ${result}`);
};

runTests();
solvePuzzle();
