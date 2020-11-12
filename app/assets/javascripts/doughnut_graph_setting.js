function configureDoughnutGraph(displayGraph) {
  var blue = 'rgb(0, 72, 255)';
  var gray = 'rgb(99, 99, 99)';

  var options = {
    cutoutPercentage: 65,
    responsive: false,
    maintainAspectRatio: false
  };

  displayGraph(blue, gray, options);
};