use namespace HH\Lib\Vec;

class StackUnderflowException extends \Exception {}

class Stack<T> {
    // vec is short for Vector
    //
    private vec<T> $stack;
    private int $stackPtr;
    public function __construct() {
        // this->stack = new vec<T>
        // this->stack = vec<T>
        // $this->stack[0] = 1;
        $this->stackPtr = 0;
        $this->stack = vec[];
    }

    public function dmp(): void {
        echo "crnt: $this->stackPtr\n";
        \var_dump($this->stack);
    }
    public function push(T $value): void {
        echo "pushing ".(int)$value."\n";
        // $this->stack[$this->stackPtr] = $value;
        $this->stack[] = $value;
        $this->stackPtr++;
    }

    public function pop(): T {
        if ($this->stackPtr > 0) {
            $this->stackPtr--;
            return $this->stack[$this->stackPtr];
        } else {
            throw new StackUnderflowException();
        }
    }
}
function swap<T>(inout T $i1, inout T $i2): void {
    $temp = $i1;
    $i1 = $i2;
    $i2 = $temp;
}
function square_vec(vec<num> $numbers): vec<num> {
    return Vec\map($numbers, $number ==> $number * $number);
}
