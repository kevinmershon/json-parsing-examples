$(document).ready(function() {
    $("#new-email").on("click", function() {
        $.ajax({
            async: true,
            dataType: "json",
            type: "post",
            url: "http://localhost:3000/emails",
            data: {
                subject: $("#subject").val(),
                body: $("#body").val(),
                receivers: JSON.stringify(_.union(
                    _.map($("#to").val().split(","), function(it) {
                        return { type: "to", address: it.trim()};
                    }),
                    _.map($("#cc").val().split(","), function(it) {
                        return { type: "cc", address: it.trim()};
                    })
                ))
            },
            success: function(response, status, xhr) {
                console.log(response.responseText);
            }
        });

        return false;
    });
});
