
app.filter('glucoseTypeFilter', function() {
  return function(item) {

    switch(parseInt(item))
    {
      case 'normal':
        return 'Normal';
        break;
      case 'AC':
        return 'Before Meal(AC)';
        break;
      case 'PC':
        return 'Before Meal(PC)';
        break;
      case 'QC':
        return 'CTL Mode(QC)';
        break;
      default:
        return 'Unknown';
        break;
    }
    
  };
});
