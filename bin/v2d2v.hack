require_once(__DIR__.'/../vendor/autoload.hack');

use namespace HH\Lib\{C, Math, Str, Vec, Dict};

class Thing {

    private int    $start;
    private int    $confidence;
    private string $desc;

    public function __construct(int $start, string $desc, int $confidence) {
        $this->desc = $desc;
        $this->start = $start;
        $this->confidence = $confidence;
    }
    public function get(): Thing {
        return $this;
    }
    public function key(): string {
        return $this->start . $this->desc;
    }
}
<<__EntryPoint>>
function v2d2v(): void {

    $v = Vector{ 
        new Thing(1998, "Linux", 100),
        new Thing(1995, "Windows", 80),
        new Thing(2010, "OSX", 90),
        new Thing(1998, "C++", 90),
        new Thing(1990, "C", 90),
    };

    // https://github.com/hhvm/hsl/blob/master/tests/vec/VecOrderTest.php
    //
    // sort_by($v, $s ==> Str\reverse($s->key()), ($a, $b) ==> $a <=> $b);

    $vec = vec($v);
    $order_by = Dict\map($vec, $s ==> Str\reverse($s->key()));
    \asort(inout $order_by);
    $vec_new = map_with_key($order_by, ($k, $v) ==> $vec[$k]);

    $m = Map{};

    foreach ($v as $vv) {
        $m[$vv->key()] = $vv->get();
    }

    $ary = $m->toArray();

    // public function mapWithKey<Tu>(
    //      (function(Tk, Tv) : Tu) $callback,): Map<Tk, Tu>;
    // $m->mapWithKey(($key, $value) ==> print($key));
    // var_dump($m);
    // foreach ($m as $mm) { var_dump($mm->get()); }
}
