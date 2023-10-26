Change xampp\php\php.ini to

post_max_size = 750M
upload_max_filesize = 750M
max_execution_time = 5000
max_input_time = 5000
memory_limit = 1000M

And change xampp\mysql\bin\my.ini

max_allowed_packet = 200M

Add this line to xampp\phpmyadmin\config.inc.php
$cfg['ExecTimeLimit'] = 6000;
