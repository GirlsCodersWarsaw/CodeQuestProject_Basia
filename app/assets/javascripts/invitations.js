$(document).ready(function() {
  $('form#new_invitation').submit(function() {
    var valuesToSubmit = $(this).serialize();
    $.ajax({
      type: "POST",
      url: ('invitations'),
      data: valuesToSubmit,
      dataType: "JSON"
    }).success(function (json) {
      $("#message").text(
        json.recipient_email + " was invited to your team"
      ).css('border', '4px double #7797db');
      var pending = $('#pending-invitations');
      pending.html(pending.html() + json.recipient_email);
      $("#invitation_recipient_email").val('');
    }).error(function (json) {
      $("#message").text(
        json.responseJSON[0]
      ).css('border', '4px double #AD2300');
    });
    return false;
  });
});
