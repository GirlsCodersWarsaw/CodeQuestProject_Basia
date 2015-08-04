$(document).ready(function() {
    $('form#new_invitation').submit(function() {
        //console.log('TEST');
        var valuesToSubmit = $(this).serialize();
        $.ajax({
            type: "POST",
            url: ('invitations'),
            data: valuesToSubmit,
            dataType: "JSON"
        }).success(function (json) {
            //console.log("success", json);
            var messageTextArea = document.getElementById('message');
            messageTextArea.innerText = json.recipient_email + " was invited to your team";
            messageTextArea.style.border = "thick double #7797db";
            var pendingInv = document.getElementById('pending-invitations');
            pendingInv.innerHTML = pendingInv.innerHTML + json.recipient_email;
            $("#invitation_recipient_email").val('');
        }).error(function (json) {
            //console.log("error", json);
            var messageTextArea = document.getElementById('message')
            messageTextArea.innerText = json.responseJSON[0];
            messageTextArea.style.border = "thick double #AD2300";
        });
        return false;
    });
});