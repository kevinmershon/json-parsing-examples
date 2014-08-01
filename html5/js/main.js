$(document).ready(function() {
    $("form").on("click", function() {
        $.ajax({
            async: true,
            dataType: "json",
            type: "post",
            url: "http://localhost:9000/send",
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
                ))
            },
            success: function(response, status, xhr) {
                console.log(response.responseText);
            }
        });

        return false;
    });
});
