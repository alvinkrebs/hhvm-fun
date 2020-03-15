use namespace HH\Lib\{C, Math, Str, Vec, Dict};

require_once(__DIR__.'/../vendor/autoload.hack');

class Thing {

    private int    $start;
    private int    $confidence;
    private string $desc;

    public function __construct(string $desc, int $start, int $confidence) {
        $this->desc = $desc;
        $this->start = $start;
        $this->confidence = $confidence;
    }
    public function get(): Thing {
        return $this;
    }
    public function key(): string {
        return $this->start . " " . $this->desc;
    }
}
function sort_vec(vec<Thing> $vec): vec<Thing> {
    $d = dict[];
    foreach ($vec as $k => $v) {
        $d[$v->key()] = $v->get();
    }
    $ordered = Dict\sort($d);
    $sorted_vec = vec[];
    foreach ($ordered as $k => $v) {
        $sorted_vec[] = $v->get();
    }
    return $sorted_vec;
}
<<__EntryPoint>>
function v2d2v(): void {

    // !! this is important !!
    //
    \Facebook\AutoloadMap\initialize();

    $v = vec<Thing>[
        new Thing("Linux", 1998, 100),
        new Thing("Windows", 1995, 80),
        new Thing("OSX", 2010, 90),
        new Thing("C++", 1998, 90),
        new Thing("C", 1990, 90),
        new Thing("C*", 2016, 90),
        new Thing("swift",2018,  90),
        new Thing("java", 2000, 90),
        new Thing("perl", 1990, 90),
        new Thing("shell scripting", 1990, 90),
        new Thing("make", 1996, 90),
        new Thing("cmake", 2011, 90),
        new Thing("cordova", 2018, 90),
        new Thing("awk", 1990, 90),
        new Thing("php", 1990, 90),
        new Thing("gdb", 1998, 90),
        new Thing("git", 2015, 90),
        new Thing("aws ec2", 2018, 90),
        new Thing("aws s3", 2018, 90),
        new Thing("aws elastic beanstalk", 2018, 90),
        new Thing("aws lambda", 2018, 90),
        new Thing("aws aurora", 2018, 90),
        new Thing("sql", 1990, 90),
    ];

/*
    $comp = function(vec<Thing> $a, vec<Thing> $b): int { return 0; };

    foreach (Dict\sort($v, $comp) as $k => $v) {
        echo "k: " . $k . ", " . $v->key() . "\n";
    }

    foreach (sort_vec($v) as $kv => $vv) {
        echo "kv: " . $kv . ", " . $vv->key() . "\n";
    }

    $numbers = vec[1, 1, 2, 3, 5, 8, 14];
    $groups = Dict\group_by($numbers, $value ==> $value % 2);

    $groups = Dict\group_by($v, $value ==> Str\contains($value->key(), "19"));
    \print_r($groups);

*/

}
/*
    what did we learn?
    1. AutoloadMap\initialize() allows the use of Dict\ Vec\ etc.
    2. Do not use the upper-cased Vec, Dict, etc. as containers, use vec<T> instead.
        * https://docs.hhvm.com/hack/built-in-types/arrays
        * These container types should be avoided in new code; use dict<Tk, Tv>, keyset<T>, and vec<T> instead.
    3. pass dict[] as just dict
    4. the difference between Thing (here) and Skill (there) was the manner in which the properties were
       declared. To make the sort work correclty, you had to declare each class with the same property list
       in the same order. In other words: <string, int, int> key != <int, int, string>. Once that was changed,
       the sort worked correctly.




    function group_by<Tk as arraykey, Tv> (Traversable<Tv> $values, (function(Tv): ?Tk) $key_func,) : dict<Tk, vec<Tv>>;

    key_func -> function(Thing Tv) {
        return Tv->get();
    }

/**
 * Returns a new dict sorted by the values of the given KeyedTraversable. If the
 * optional comparator function isn't provided, the values will be sorted in
 * ascending order.
 *
 * - To sort by some computable property of each value, see `Dict\sort_by()`.
 * - To sort by the keys of the KeyedTraversable, see `Dict\sort_by_key()`.
 *
 * Time complexity: O((n log n) * c), where c is the complexity of the
 * comparator function (which is O(1) if not provided explicitly)
 * Space complexity: O(n)
 */
/*
<<__Rx, __AtMostRxAsArgs, __ProvenanceSkipFrame>>
function sort<Tk as arraykey, Tv>(

        <<__MaybeMutable, __OnlyRxIfImpl(\HH\Rx\KeyedTraversable::class)>> KeyedTraversable<Tk, Tv> $traversable,

        <<__AtMostRxAsFunc>>                                               ?(function(Tv, Tv): int) $value_comparator = null,

    )
    :
        dict<Tk, Tv> {
        $result = dict($traversable);
        if ($value_comparator) {
            \uasort(inout $result, $value_comparator);
        } else {
            \asort(inout $result);
        }
        return dict($result);
    }

    
    arraykey
        union of int string, or valid keys
        https://docs.hhvm.com/hack/built-in-types/arrays

    __Rx
    __AtMostRxAsArgs
    __ProvenanceSkipFrame
    __MaybeMutable
    __OnlyRxIfImpl

*/
