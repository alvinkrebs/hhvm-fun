use namespace HH\Lib\Str;

type AnAddress = shape(
    "State"  => string,
    "City"   => string,
    "Street" => string
);

type Cv = shape("Experience" => Vector<Experience>, "Skill" => Vector<Skill>);

class StreetAddress {

    private string $name_str;
    private string $city_str;
    private string $state_str;
    private string $street_str;

    const DEF_NAME = "Bob Garrow";
    const DEF_CITY = "Los Altos Hills";
    const DEF_STATE = "California";
    const DEF_STREET = "13914 Mir Mirou";

    public function __construct(
        string $name = StreetAddress::DEF_NAME,
        string $city = StreetAddress::DEF_CITY,
        string $state = StreetAddress::DEF_STATE,
        string $street = StreetAddress::DEF_STREET) {
        $this->name_str = $name;
        $this->city_str = $city;
        $this->state_str = $state;
        $this->street_str = $street;
    }
    public function street(): string {
        return $this->street_str;
    }
    public function city(): string {
        return $this->city_str;
    }
    public function state(): string {
        return $this->state_str;
    }
    public function name(): string {
        return $this->name_str;
    }
    public function all(): AnAddress {
        return shape(
            "Name"   => $this->name(),
            "State"  => $this->state(),
            "City"   => $this->city(),
            "Street" => $this->street()
        );
    }
}
class DatedThing {
    private int $a_date;
    public function __construct(int $a_date) {
        $this->a_date = $a_date;
    }
    public function nice_date(): string {
        if (0 == $this->a_date) {
            return date("Y-m-d");
        }
        $year   = (int)($this->a_date / 10000);
        $day    = (int)($this->a_date % 100);
        $month  = $this->a_date - (10000 * $year);
        $month /= 100;
        return Str\format("%d-%02d-%02d", $year, (int)$month, $day);
    }
}
class Skill {
    private int $start;
    private int $comfort_level;
    private string $skill;
    public function __construct(string $skill, int $start, int $comfort_level = 100) {
        $this->skill = $skill;
        $this->start = $start;
        $this->comfort_level = $comfort_level;
    }
    public function get(): Skill {
        return $this;
    }
    public function key(): string {
        return $this->start . $this->skill;
    }
    public function nice_skill(): string {
        return $this->skill . " (since " . $this->start . ")";
    }
    public function tool_tip(): string {

        if ($this->comfort_level >= 90) {
            return "Expert";
        }
        if ($this->comfort_level >= 80) {
            return "Adept";
        }
        if ($this->comfort_level >= 70) {
            return "Comfortable";
        }
        if ($this->comfort_level >= 60) {
            return "Intermediate";
        }
        return "Learning";

    }
}
class Education {}
class Experience {

    private string $desc;
    private string $tip;
    private int $start;
    private int $stop;

    public function __construct(int $start, int $stop, string $desc, string $tip) {
        $this->start = $start;
        $this->stop = $stop;
        $this->desc = $desc;
        $this->tip  = $tip ;
    }
    private function nice_date(int $d): string {
        if (0 == $d) {
            return date("Y-m-d");
        }

        $year   = (int)($d / 10000);
        $day    = (int)($d % 100);
        $month  = $d - (10000 * $year);
        $month /= 100;

        // note: don't lead namespace'd with \\
        //
        return Str\format("%d-%02d-%02d", $year, (int)$month, $day);
    }
    public function nice_start_date(): string {
        return $this->nice_date($this->start);
    }
    public function nice_stop_date(): string {
        return $this->nice_date($this->stop);
    }
    public function nice_exp(): string {
        return $this->nice_start_date() . " to " . $this->nice_stop_date() . ", " . $this->desc;
    }
    //
    // The &#013; combined with the style white-space: pre-line; worked for me.
    //
    public function tool_tip(): string {
        $hdr   = vec[];
        $hdr[] = Str\repeat("X", 30);
        $hdr[] = Str\repeat("Z", 20);
        $hdr[] = Str\repeat("Q", 20);
        // return $hdr . "&#010;" . $this->tip . "&#010;" . $ftr;
        // return $hdr . "<br>" . $this->tip . "<br>" . $ftr;
        // return $hdr . "&#013;" . $this->tip . "&#013;" . $ftr;
        return $hdr[0] . "\n" . $this->tip . "\n" . $hdr[1] . "\n" . $hdr[2];
    }
}
function me(): string {
    return "Bob";
}
