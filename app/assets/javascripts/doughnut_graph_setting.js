function configureDoughnutGraph(displayGraph) {
  var blue = 'rgb(54, 162, 235)';
  var gray = 'rgb(99, 99, 99)';

  var options = {
    cutoutPercentage: 65,
    responsive: false
  };

  displayGraph(blue, gray, options);
};