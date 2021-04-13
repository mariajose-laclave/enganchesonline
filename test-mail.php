<?php
ini_set('display_errors', '1');
ini_set('display_startup_errors', '1');
error_reporting(E_ALL);
// the message
$msg = "First line of text\nSecond line of text";

// use wordwrap() if lines are longer than 70 characters
$msg = wordwrap($msg,70);

// send email
$headers = array("From: from@example.com",
    "Reply-To: replyto@example.com",
    "X-Mailer: PHP/" . PHP_VERSION
);
$to = 'grant@laclave.es';
$message = 'test';
$subject = 'test';
$headers = implode("\r\n", $headers);
$mail = mail($to, $subject, $message, $headers);

if (!$mail) {
    echo 'Uuups...';   
} else {
    echo 'Mail sent';
}