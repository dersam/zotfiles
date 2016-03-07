<?php
$cmd = "wget {$argv[1]} --no-check-certificate --delete-after -q --output-document=/dev/null";

$avg = 0;
$iterations = 10;
$max = 0;
$min = null;

for ($i =0; $i < $iterations; $i++) {
  echo '.';
  $start = microtime(true);
  shell_exec($cmd);
  $end = microtime(true);
  $time = ($end - $start);
  $avg += $time;
  $max = $max < $time ? $time : $max;
  $min =  $min == null || $min > $time ? $time : $min;
}

echo PHP_EOL;
echo 'Average: '.number_format(($avg/$iterations)*1000, 0).'ms'.PHP_EOL;
echo 'Max: '.number_format($max*1000, 0).'ms'.PHP_EOL;
echo 'Min: '.number_format($min*1000, 0).'ms'.PHP_EOL;
