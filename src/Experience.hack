use namespace HH\Lib\Str;

type AnAddress = shape(
    "State"  => string,
    "City"   => string,
    "Street" => string,
    "Phone"  => string
);

function nice_date(int $d, string $fmt = "Y-m-d"): string {

    if (0 == $d) {
        return date($fmt);
    }

    $year   = (int)($d / 10000);
    $day    = (int)($d % 100);
    $month  = $d - (10000 * $year);
    $month /= 100;

    // note: don't lead namespace'd with \\
    //
    return "Y-m-d" == $fmt ?
        Str\format("%d-%02d-%02d", $year, (int)$month, $day) : Str\format("%d/%02d", $year, (int)$month);
}

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
    public function iKey(): int {
        return $this->comfort_level;
    }
    public function key(): string {
        return Str\format("%d-%s", $this->comfort_level, $this->skill);
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
            return "Proficient";
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
class Experience {

    private int $start;
    private int $stop;
    private string $company;
    private string $web;
    private string $title;
    private string $badge;
    private vec<string> $accomplishments;

    public function __construct(int $start, int $stop, string $company, string $web, string $title, string $badge, vec<string> $accomplishments) {
        $this->start    = $start;
        $this->stop     = $stop;
        $this->company  = $company;
        $this->web      = $web;
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
    public function nice_start_date(): string {
        return nice_date($this->start);
    }
    public function nice_stop_date(): string {
        return nice_date($this->stop);
    }
    public function get_daterange(): string {
        return $this->nice_start_date() . " to " . $this->nice_stop_date();
    }
    public function get_exprange(): string {
        return nice_date($this->start, "Y/m") . " to " . nice_date($this->stop, "Y/m");
    }
    public function get_badge(): string { return $this->badge; }
    public function get_title(): string { return $this->title; }
    public function get_company(): string { return $this->company; }
    public function get_web(): string { return $this->web; }
    public function get_accomplishments(): vec<string> { return $this->accomplishments; }

    public function get(): Experience {
        return $this;
    }
}
class Education {
    private int $start;
    private int $stop;
    private string $school;
    private string $degree;
    private string $badge;
    private vec<string> $accomplishments;

    public function __construct(int $start, int $stop, string $school, string $degree, string $badge, vec<string> $accomplishments) {
        $this->start    = $start;
        $this->stop     = $stop;
        $this->school  = $school;
        $this->degree    = $degree ;
        $this->badge    = $badge ;
        $this->accomplishments = $accomplishments;
    }
    public function ikey(): int {
        return $this->start;
    }
    public function key(): string {
        return (string)$this->start;
    }
    private function edu_date(int $d): string {
        if (0 == $d) {
            return date("Y/m");
        }
        $year   = (int)($d / 10000);
        $month  = $d - (10000 * $year);
        $month /= 100;
        return Str\format("%d/%02d", $year, (int)$month);
    }
    public function nice_start_date(): string {
        return nice_date($this->start);
    }
    public function nice_stop_date(): string {
        return nice_date($this->stop);
    }
    public function get_daterange(): string {
        return $this->nice_start_date() . " to " . $this->nice_stop_date();
    }
    public function get_edurange(): string {
        return $this->edu_date($this->start) . " to " . $this->edu_date($this->stop);
    }
    public function get_badge(): string { return $this->badge; }
    public function get_degree(): string { return $this->degree; }
    public function get_school(): string { return $this->school; }
    public function get_accomplishments(): vec<string> { return $this->accomplishments; }

    public function get(): Education {
        return $this;
    }
}
function me(): string {
    return "Bob";
}
