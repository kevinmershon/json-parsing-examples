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
                receivers: _.union(
                    _.map($("#to").val().split(","), function(it) {
                        return { type: "to", address: it.trim()};
                    }),
                    _.map($("#cc").val().split(","), function(it) {
                        return { type: "cc", address: it.trim()};
                    })
                )
            },
            success: function(response, status, xhr) {
                console.log(response.responseText);
            }
        });

        return false;
    });
});
