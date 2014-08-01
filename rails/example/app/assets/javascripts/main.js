$(document).ready(function() {
    $("#new_email").on("click", function() {
        $.ajax({
            async: true,
            dataType: "json",
            type: "post",
            url: "http://localhost:3000/emails",
            data: {
                subject: $("#subject").val(),
                body: $("#body").val(),
                receivers: JSON.stringify(_.union(
                    _.map($("#to_field").val().split(","), function(it) {
                        return { type: "to_field", address: it.trim()};
                    }),
                    _.map($("#cc_field").val().split(","), function(it) {
                        return { type: "cc_field", address: it.trim()};
                    })
                )),
                utf8: $(this).find('input[name="utf8"]').val(),
                authenticity_token: $(this).find('input[name="authenticity_token"]').val()
            },
            success: function(response, status, xhr) {
                console.log(response.responseText);
                if(response["redirectURL"]) {
                    window.location.href = response["redirectURL"];
                }
            }
        });

        return false;
    });
});
