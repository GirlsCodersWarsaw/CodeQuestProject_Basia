$(document).ready(function() {
    $('form#new_membership').submit(function() {
        console.log('TEST');
        var valuesToSubmit = $(this).serialize();
        $.ajax({
            type: "POST",
            url: ('memberships'),
            data: valuesToSubmit,
            dataType: "JSON"
        }).success(function (json) {
            console.log("success", json);
            document.getElementById('message').innerText = "User was added to project";
        }).error(function (json) {
            console.log("error", json);
            document.getElementById('message').innerText = json.responseText;
        });
        return false;
    });
});
