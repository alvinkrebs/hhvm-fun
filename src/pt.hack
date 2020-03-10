use namespace HH\Lib\Vec;

class Point {
    private float $x; // instance property
    private float $y; // instance property

    public function __construct(num $x = 0, num $y = 0) { // instance method
        $this->x = (float)$x; // access instance property
        $this->y = (float)$y; // access instance property
    }

    public function move(num $x, num $y): void { // instance method
        $this->x = (float)$x;
        $this->y = (float)$y;
    }

    public function __toString(): string { // instance method
        return '('.$this->x.','.$this->y.')';
    }
}
