require __DIR__."/../vendor/hh_autoload.php";

use namespace HH\Lib\Dict;

class tool_tip_h3 implements XHPUnsafeRenderable {

    private string $html;
    public function __construct(string $title, $desc) {
        $onmouseover = "onmouseover=\"tooltip.pop(this, '<h3>$title</h3>$desc')\">";
        $this->html  = "<span class=\"tooltip\" " . $onmouseover . $title . "</span>";
    }
    public function toHTMLString(): string {
        return $this->html;
    }
}
class :tool_tip extends :x:element {

    attribute string general_desc @required;
    attribute string general_title @required;

    // this is dumb, you have to have some element, like <div> to get this thing to render
    // leaving them out causes an innocuous error. And since the whole point was to circumvent
    // the innards of the span tags, we have to use div.
    //
    protected function render(): \XHPRoot {
        return <div>{new tool_tip_h3($this->:general_title, $this->:general_desc)}</div>;
    }
}
function echo_tooltip(string $title, string $desc) {
    $tt = <tool_tip />;
    $tt->setAttribute("general_desc", $desc);
    $tt->setAttribute("general_title", $title);
    echo $tt;
}
function button_tip(string $title, string $desc): XHPRoot {
    $cool = <span class="tooltip">{$title}</span>;
    $cool->setAttribute("title", "tooltip.pop(this, '<h3>{$title}</h3>$desc')");
    return $cool;
}
function xhp_build_stacked_exp(vec<Experience> $exps): XHPRoot {
    $stacked_exp = <div id="stacked_exp" />;
    foreach ($exps as $v) {
        $stacked_exp->appendChild(
            <button title={button_tip("A", "aaaaaaa")} class="button button_exp" type="button">{$v->nice_exp()}</button>);
    }
    return $stacked_exp;
}
function xhp_build_stacked_skill(vec<Skill> $skills): XHPRoot {
    $list = <div id="stacked_skills" />;
    foreach ($skills as $v) {
        $list->appendChild(
            <button title={$v->tool_tip()} class="button button_skill" type="button">{$v->nice_skill()}</button>);
    }
    return $list;
}
function xhp_build_address(AnAddress $a): XHPRoot {
    $ary = Shapes::toArray($a);
    $address_block = <div id="address" />;
    $address_block->appendChild(<h1>{$ary["Name"]}</h1>);
    $address_block->appendChild(<h1>{$ary["Street"]}</h1>);
    $address_block->appendChild(<h1>{$ary["City"]}</h1>);
    $address_block->appendChild(<h1>{$ary["State"]}</h1>);
    return $address_block;
}
function sort_vec_skill(vec<Skill> $vec): vec<Skill> {
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
function cv(): (vec<Experience>, vec<Skill>) {

    $exp = vec<Experience> [
        new Experience(19950101, 19981231, "Baystone Software", "Principle Engineer"),
        new Experience(19990101, 20041231, "TiVo Inc.", "Member of Technical Staff"),
        new Experience(20050101, 20061231, "Avvenu Inc.", "Media Engineer"),
        new Experience(20060101, 20101231, "Mobyligen", "Member of Technical Staff"),
        new Experience(20100101, 20101231, "Blueberry Video", "Founder"),
        new Experience(20110101, 20215231, "Dell Inc.", "Senior Manager"),
        new Experience(20160101, 20181231, "LARC Inc.", "Architect"),
        new Experience(20150101,        0, "Viziapps", "Principle Engineer"),
    ];

    $skill = vec<Skill>[
        new Skill("Linux", 1998, 100),
        new Skill("Windows", 1995, 70),
        new Skill("OSX", 2010, 70),
        new Skill("C++", 1998, 90),
        new Skill("C", 1990, 90),
        new Skill("C*", 2016, 70),
        new Skill("swift",2018,  70),
        new Skill("java", 2000, 70),
        new Skill("perl", 1990, 90),
        new Skill("shell scripting", 1990, 90),
        new Skill("make", 1996, 90),
        new Skill("cmake", 2011, 70),
        new Skill("cordova", 2018, 70),
        new Skill("awk", 1990, 90),
        new Skill("php", 1990, 90),
        new Skill("gdb", 1998, 90),
        new Skill("git", 2015, 90),
        new Skill("aws ec2", 2018, 70),
        new Skill("aws s3", 2018, 70),
        new Skill("aws elastic beanstalk", 2018, 70),
        new Skill("aws lambda", 2018, 70),
        new Skill("aws aurora", 2018, 90),
        new Skill("sql", 1990, 70),
        new Skill("javascript", 2010, 80),
        new Skill("mongodb", 2010, 80),
        new Skill("sql", 1990, 90),
        new Skill("quickbase", 2018, 70),
        new Skill("php", 1999, 90),
        new Skill("hhvm/hacklang", 2020, 10),
    ];

    $ordered = sort_vec_skill($skill);

    return tuple($exp, $ordered);

}
<<__EntryPoint>>
function xhp_object_methods_run(): void {

    \Facebook\AutoloadMap\initialize();
    
    echo
        <head>
            <link rel="stylesheet" href="bin/form-fun.css" />
            <link rel="stylesheet" href="third-party/tooltip/themes/1/tooltip.css" />
            <script src="third-party/tooltip/themes/1/tooltip.js" type="text/javascript"></script>
        </head>
    ;

    $where_i_live = new StreetAddress();

    echo xhp_build_address($where_i_live->all());

    $expSkill = cv();

    echo_tooltip("Title X", "This is the 10th time of visiting this POS");

    $exp_stacked_list = xhp_build_stacked_exp($expSkill[0]);
    foreach ($exp_stacked_list->getChildren() as $child) {
        /* HH_FIXME[4067] implicit __toString() is now deprecated */
        echo <div class="btn-group">{$child}</div> . "\n";
    }

    $skill_list = xhp_build_stacked_skill($expSkill[1]);
    foreach ($skill_list->getChildren() as $child) {
        /* HH_FIXME[4067] implicit __toString() is now deprecated */
        echo <div class="btn-group">{$child}</div> . "\n";
    }
}
