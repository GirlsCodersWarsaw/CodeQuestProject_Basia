$(document).ready(function() {
    $('form#new_membership').submit(function() {
        //console.log('TEST');
        var valuesToSubmit = $(this).serialize();
        $.ajax({
            type: "POST",
            url: ('memberships'),
            data: valuesToSubmit,
            dataType: "JSON"
        }).success(function (json) {
            //console.log("success", json);
            var messageTextArea = document.getElementById('message');
            messageTextArea.innerText = "User was added to project";
            messageTextArea.style.border = "thick double #7797db";
            var projectMembers = document.getElementById('project-members');
            projectMembers.innerHTML = projectMembers.innerHTML + json.email;
            $("#invite_to_project_email").val('');
        }).error(function (json) {
            //console.log("error", json);
            var messageTextArea = document.getElementById('message')
            messageTextArea.innerText = json.responseText.slice(2, -2);
            messageTextArea.style.border = "thick double #AD2300";
        });
        return false;
    });
});
