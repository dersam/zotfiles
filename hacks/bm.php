<?php
$cmd = "wget {$argv[1]} --no-check-certificate --delete-after -q --output-document=/dev/null";

$avg = 0;
$iterations = 10;

for ($i =0; $i < $iterations; $i++) {
  $start = microtime(true);
  shell_exec($cmd);
  $end = microtime(true);
  $avg += ($end - $start);
}

echo number_format(($avg/$iterations), 3).' seconds average time over 10 iterations.';
echo PHP_EOL;
