$(document).ready(function() {
  var checkbox = $('#project_billable');
  var detailsDiv = $('#financial-details');
  if (checkbox.is(':checked')) {
    detailsDiv.css("display", "block");
  } else {
    detailsDiv.css("display", "none");
  };
  checkbox.hover(function() {
    checkbox.change(function() {
      if (checkbox.is(':checked')) {
        detailsDiv.css("display", "block");
      } else {
        detailsDiv.css("display", "none");
      }
    })
  })
});
