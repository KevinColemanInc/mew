
app.filter('glucoseValueFilter', function() {
  return function(item) {
    return item + ' mg/dL';
  };
});
