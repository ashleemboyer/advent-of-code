const fs = require('fs');

const getShortestManhattanDistance = paths => {
  const allCoordinates = [];
  paths.forEach(path => {
    const coordinates = [];
    let currentX = 0;
    let currentY = 0;
    const moves = path
      .split(',')
      .map(move => ({ direction: move[0], distance: +move.substring(1) }));

    moves.forEach(({ direction, distance }) => {
      let dx = 0;
      let dy = 0;
      if (direction === 'R') {
        dx = 1;
      } else if (direction === 'D') {
        dy = -1;
      } else if (direction === 'L') {
        dx = -1;
      } else if (direction === 'U') {
        dy = 1;
      }

      for (let i = 0; i < distance; i += 1) {
        currentX += dx;
        currentY += dy;
        coordinates.push(`${currentX},${currentY}`);
      }
    });

    allCoordinates.push(coordinates);
  });

  const wire1Coordinates = allCoordinates[0];
  const wire2Coordinates = allCoordinates[1];

  let coordinatesToIterate;
  let otherCoordinates;
  if (wire1Coordinates.length > wire2Coordinates.length) {
    coordinatesToIterate = wire1Coordinates;
    otherCoordinates = wire2Coordinates;
  } else {
    coordinatesToIterate = wire2Coordinates;
    otherCoordinates = wire1Coordinates;
  }

  const otherCoordinatesSet = new Set(otherCoordinates);
  const intersections = new Set([]);
  coordinatesToIterate.forEach(coordinate => {
    if (otherCoordinatesSet.has(coordinate) && !intersections.has(coordinate)) {
      intersections.add(coordinate);
    }
  });

  const steps = [];
  intersections.forEach(intersection => {
    steps.push(
      wire1Coordinates.indexOf(intersection) +
        wire2Coordinates.indexOf(intersection) +
        2
    );
  });

  return Math.min(...steps);
};

const runTests = () => {
  const testValues = [
    { expected: 30, input: ['R8,U5,L5,D3', 'U7,R6,D4,L4'] },
    {
      expected: 610,
      input: [
        'R75,D30,R83,U83,L12,D49,R71,U7,L72',
        'U62,R66,U55,R34,D71,R55,D58,R83'
      ]
    },
    {
      expected: 410,
      input: [
        'R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51',
        'U98,R91,D20,R16,D67,R40,U7,R15,U6,R7'
      ]
    }
  ];

  console.log('Tests');

  testValues.forEach(({ expected, input }, i) => {
    const pass = getShortestManhattanDistance(input) === expected;
    console.log(`  Test ${i + 1} ${pass ? 'passed 🎉' : 'failed 😢'}!`);
  });
};

const solvePuzzle = () => {
  fs.readFile('input.txt', 'utf8', (err, data) => {
    if (err) {
      throw err;
    }

    const paths = data.split('\n');
    const result = getShortestManhattanDistance(paths);
    console.log(`\nPuzzle Answer\n  ${result}`);
  });
};

runTests();
solvePuzzle();
