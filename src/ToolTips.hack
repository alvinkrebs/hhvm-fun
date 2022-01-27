use namespace HH\Lib\Dict;
use namespace Facebook\XHP\Core as x;
use type Facebook\XHP\HTML\{script, table, tr, td, img, ul, div, h3, p, li, i};

/*
    called by get_experience() when it constructs the experience tooltip
    TIL: how to call hack inside {}, see the img src tag.
*/
final xhp class experience_tooltip extends x\element {
    attribute string title @required;
    attribute string company @required;
    attribute string badge @required;
    attribute string daterange  @required;
    attribute vec<string> highlights @required;
    protected async function renderAsync(): Awaitable<x\node> {
        $ul = <ul />;
        foreach ($this->:highlights as $h) {
            $ul->appendChild(<li>{$h}</li>);
        }
        return
            <div class="tooltip"><div class="tab_line">{$this->:company}</div>
                <div class="left">
                    <img src={"images/" . $this->:badge} />
                    <h3>{$this->:title}</h3>
                    <p>{$this->:daterange}</p>
                    {$ul}
                    <i></i>
                </div>
            </div>
        ;
    }
}
function get_experience(Experience $e): x\element {
    $tt = <experience_tooltip />;
    $tt->setAttribute("title", $e->get_title());
    $tt->setAttribute("company", $e->get_company());
    $tt->setAttribute("badge", $e->get_badge());
    $tt->setAttribute("daterange", $e->get_daterange());
    $tt->setAttribute("highlights", $e->get_accomplishments());
    return $tt;
}

final xhp class education_tooltip extends x\element {
    attribute string degree @required;
    attribute string school @required;
    attribute string badge @required;
    attribute string daterange  @required;
    attribute vec<string> highlights @required;
    protected async function renderAsync(): Awaitable<x\node> {
        $ul = <ul />;
        foreach ($this->:highlights as $h) {
            $ul->appendChild(<li>{$h}</li>);
        }
        return
            <div class="tooltip"><div class="tab_line">{$this->:school}</div>
                <div class="left">
                    <img src={"images/" . $this->:badge} />
                    <h3>{$this->:degree}</h3>
                    <p>{$this->:daterange}</p>
                    {$ul}
                    <i></i>
                </div>
            </div>
        ;
    }
}
function get_education(Education $e): x\element {
    $tt = <education_tooltip />;
    $tt->setAttribute("degree", $e->get_degree());
    $tt->setAttribute("school", $e->get_school());
    $tt->setAttribute("badge", $e->get_badge());
    $tt->setAttribute("daterange", $e->get_daterange());
    $tt->setAttribute("highlights", $e->get_accomplishments());
    return $tt;
}
/*
    called by get_skill() when it constructs the skill tooltip
*/
final xhp class skill_tooltip extends x\element {
    attribute string desc @required;
    attribute string title @required;
    attribute string short @required;
    attribute string badge @required;
    attribute vec<string> notable  @required;
    attribute bool on_the_right;
    protected async function renderAsync(): Awaitable<x\node> {
        $ul = <ul />;
        foreach ($this->:notable as $h) {
            $ul->appendChild(<li>{$h}</li>);
        }
        return
            <div class="tooltip"><div class="tab_line">{$this->:short}</div>
                <div class={$this->:on_the_right ? "right" : "left"}>
                    <img src={"images/" . $this->:badge} />
                    <h3>{$this->:title}</h3>
                    <p>{$this->:desc}</p>
                    {$ul}
                    <i></i>
                </div>
            </div>
        ;
    }
}
function get_skill(Skill $s, bool $on_the_right = false): x\element {
    $tt = <skill_tooltip />;
    $tt->setAttribute("on_the_right", $on_the_right);
    $tt->setAttribute("title", $s->nice_skill());
    $tt->setAttribute("desc",  $s->tool_tip());
    $tt->setAttribute("short", $s->get_skill());
    $tt->setAttribute("badge", $s->get_badge());
    $tt->setAttribute("notable", $s->get_notable());
    return $tt;
}
/*
    generate qr codes with http://www.qrcode-monkey.com/
*/
function get_address(AnAddress  $a): x\node {
    $ary = Shapes::toArray($a);
    $addr = <table align="center" id="contact"/>;
    $addr->appendChild(<tr><td colspan="3" align="center">{$ary["Name"  ]}</td></tr>);
    $addr->appendChild(
        <tr>
            <td rowspan="4"><img align="left" class="qr_img" src="images/qr-cntc.png" /></td>
            <td align="center">{$ary["Street"]}</td>
            <td rowspan="4"><img align="right" class="qr_img" src="images/qr-http.png" /></td>
        </tr>);
    $addr->appendChild(<tr><td colspan="1" align="center">{$ary["City"  ]}</td></tr>);
    $addr->appendChild(<tr><td colspan="1" align="center">{$ary["State" ]}</td></tr>);
    $addr->appendChild(<tr><td colspan="1" align="center">{$ary["Phone" ]}</td></tr>);
    $addr->appendChild(<tr><td id="vcard_page">vcard</td><td></td></tr>);
    return $addr;
}