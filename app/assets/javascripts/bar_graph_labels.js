function createLabels(labels, date) {
  var month = date.getMonth() + 1;
  var day = date.getDate();
  labels.push(`${month}/${day}`);
};

function createLabelsOnMonthly(labels, date) {
  var year = date.getFullYear();
  var month = date.getMonth() + 1;
  labels.push(`${year}/${month}`);
};