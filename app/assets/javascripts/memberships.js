$(document).ready(function() {
  $('form#new_membership').submit(function() {
    var valuesToSubmit = $(this).serialize();
    $.ajax({
      type: "POST",
      url: ('memberships'),
      data: valuesToSubmit,
      dataType: "JSON"
    }).success(function (json) {
      $("#message").text(
        "User was added to project"
      ).css('border', '4px double #7797db');
      var members = $('#project-members');
      members.html(members.html() + json.email)
      $("#invite_to_project_email").val('');
    }).error(function (json) {
      $("#message").text(
        json.responseText.slice(2, -2)
      ).css('border', '4px double #AD2300');
    });
    return false;
  });
});
