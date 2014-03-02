
app.filter('glucoseTypeFilter', function() {
  return function(item) {

    switch(parseInt(item))
    {
      case 0:
        return 'Normal';
        break;
      case 1:
        return 'Before Meal(AC)';
        break;
      case 2:
        return 'Before Meal(PC)';
        break;
      case 3:
        return 'CTL Mode(QC)';
        break;
      default:
        return 'Unknown';
        break;
    }
    
  };
});
