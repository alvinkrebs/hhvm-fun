#!/usr/bin/env hhvm

require_once(__DIR__.'/../vendor/autoload.hack');

<<__EntryPoint>>
async function main(): Awaitable<noreturn> {

    \Facebook\AutoloadMap\initialize();

    $squared = square_vec(vec[1, 2, 3, 4, 5]);
    foreach ($squared as $square) {
        printf("%d\n", $square);
    }
    // Function pointers are not enabled.
    // Stack<int> $s;

    // Call to undefined function Stack()
    // $s = Stack<int>();

    $s = new Stack<int>();

    //
    // Uncaught exception 'OutOfBoundsException' with message
    // this was caused by the sample app having the push
    // use vec[0] = foobar, instead of vec[] = foobar;
    //
    $s->push(1);
    $s->push(2);
    $s->push(3);
    $s->push(4);

    $s->dmp();
    $p = $s->pop();
    echo "pop: $p\n";

    $s->dmp();
    $p = $s->pop();
    echo "pop: $p\n";
    $s->dmp();

    $v1 = 1;
    $v2 = 2;
    swap(inout $v1, inout $v2);
    echo "\$v1 is $v1, \$v2 is $v2\n";

    $p1 = new Point(3,4);
    // echo "\$p1 is .$p1\n";

    do_it();

    exit(0);
}
