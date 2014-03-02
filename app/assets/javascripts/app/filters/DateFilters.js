app.filter('dateFilter', function() {
  return function(items, search) {
    if (!search || search.dateRange == "") {
      console.log(search + 'j');
      return items;
    }


    today = new Date();
    cutoff = new Date(today);
    cutoff.setDate(today.getDate() - parseInt(search.dateRange)); //setDate also supports negative values, which cause the month to rollover.
    cutoff.setHours(0,0,0,0);

    return items.filter(function(element, index, array) {
      return new Date(element.measured_at) > cutoff;
    });
    
  };
});
