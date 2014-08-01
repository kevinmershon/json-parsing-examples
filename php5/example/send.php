<?php

$receivers = json_decode($_POST['receivers']);
$subject = $_POST['subject'];
$body = $_POST['body'];

error_log("\nTo:");
foreach($receivers as $x) {
    $type = $x->{'type'};
    if ($type == "to")
        error_log($x->{'address'});
}
error_log("\nCC:");
foreach($receivers as $x) {
    $type = $x->{'type'};
    if ($type == "cc")
        error_log($x->{'address'});
}
error_log("\nSubject: $subject");
error_log("\nBody: $body");

echo("ok");

?>
