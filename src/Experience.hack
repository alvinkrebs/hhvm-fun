use namespace HH\Lib\Str;

type AnAddress = shape(
    "State"  => string,
    "City"   => string,
    "Street" => string,
    "Phone"  => string
);

type Cv = shape("Experience" => Vector<Experience>, "Skill" => Vector<Skill>);

class StreetAddress {

    private string $name_str;
    private string $city_str;
    private string $state_str;
    private string $street_str;
    private string $phone;

    const DEF_NAME = "Bob Garrow";
    const DEF_CITY = "Los Altos Hills, 94022";
    const DEF_STATE = "California";
    const DEF_STREET = "13914 Mir Mirou Drive";

    public function __construct(
        string $name = StreetAddress::DEF_NAME,
        string $city = StreetAddress::DEF_CITY,
        string $state = StreetAddress::DEF_STATE,
        string $street = StreetAddress::DEF_STREET) {
        $this->name_str = $name;
        $this->city_str = $city;
        $this->state_str = $state;
        $this->street_str = $street;
        $this->phone = "(408) 921-3413";
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
            "Street" => $this->street(),
            "Phone"  => $this->phone
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
    private string $badge;
    private vec<string> $notable;
    public function __construct(string $skill, int $start, int $comfort_level = 100, string $badge, vec<string> $notable) {
        $this->skill = Str\format("%-16s", $skill);
        $this->start = $start;
        $this->comfort_level = $comfort_level;
        $this->badge = $badge;
        $this->notable = $notable;
    }
    public function get(): Skill {
        return $this;
    }
    public function key(): string {
        return $this->start . $this->skill;
    }
    public function get_badge(): string {
        return $this->badge;
    }
    public function get_skill(): string {
        return $this->skill;
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
    public function get_notable(): vec<string> { return $this->notable; }
}
class Education {}
class Experience {

    private int $start;
    private int $stop;
    private string $company;
    private string $title;
    private string $badge;
    private vec<string> $accomplishments;

    public function __construct(int $start, int $stop, string $company, string $title, string $badge, vec<string> $accomplishments) {
        $this->start    = $start;
        $this->stop     = $stop;
        $this->company  = $company;
        $this->title    = $title ;
        $this->badge    = $badge ;
        $this->accomplishments = $accomplishments;
    }
    public function ikey(): int {
        return $this->start;
    }
    public function key(): string {
        return (string)$this->start;
    }
    private function exp_date(int $d): string {
        if (0 == $d) {
            return date("Y/m");
        }
        $year   = (int)($d / 10000);
        $month  = $d - (10000 * $year);
        $month /= 100;
        return Str\format("%d/%02d", $year, (int)$month);
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
    public function get_daterange(): string {
        return $this->nice_start_date() . " to " . $this->nice_stop_date();
    }
    public function get_exprange(): string {
        return $this->exp_date($this->start) . " to " . $this->exp_date($this->stop);
    }
    public function get_badge(): string { return $this->badge; }
    public function get_title(): string { return $this->title; }
    public function get_company(): string { return $this->company; }
    public function get_accomplishments(): vec<string> { return $this->accomplishments; }

    public function get(): Experience {
        return $this;
    }
}
function me(): string {
    return "Bob";
}
