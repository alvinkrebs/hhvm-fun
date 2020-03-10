use namespace HH\Asio;
use namespace HH\Lib\Vec;
// version 1
//
async function do_cpu_work(): Awaitable<void> {
  print("Start CPU work\n");
  $a = 0;
  $b = 1;

  $list = vec[$a, $b];

  for ($i = 0; $i < 1000; ++$i) {
    $c = $a + $b;
    $list[] = $c;
    $a = $b;
    $b = $c;
  }
  print("End CPU work\n");
}

async function do_sleep(): Awaitable<void> {
  print("Start sleep\n");
  \sleep(2);
  print("End sleep\n");
}

async function run(): Awaitable<void> {
  print("Start of main()\n");
  await Vec\from_async(vec[do_cpu_work(), do_sleep()]);
  print("End of main()\n");
}

function doit(): void {
  \HH\Asio\join(run());
}
// version 2
//
async function curl_A(): Awaitable<string> {
  $x = await \HH\Asio\curl_exec("http://example.com/");
  return $x;
}

async function curl_B(): Awaitable<string> {
  $y = await \HH\Asio\curl_exec("http://example.net/");
  return $y;
}

async function async_curl(): Awaitable<void> {
  $start = \microtime(true);
  // in an awaitable function so use from_async()
  //
  list($a, $b) = await Vec\from_async(vec[curl_A(), curl_B()]);
  $end = \microtime(true);
  echo "Total time taken: ".\strval($end - $start)." seconds\n";
}
async function get_raw(string $url): Awaitable<string> {
  return await \HH\Asio\curl_exec($url);
}

function do_it(): void {
    // not an awaitable function so we have to use join
    //
  \HH\Asio\join(async_curl());
  $result = \HH\Asio\join(get_raw("http://www.example.com"));
  \var_dump(\substr($result, 0, 10));
}
