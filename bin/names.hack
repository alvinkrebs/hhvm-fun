require __DIR__."/../vendor/hh_autoload.php";

use namespace HH\Lib\Dict;

class experience_tool_tip  implements XHPUnsafeRenderable {

    private string $html;

    public function __construct(string $title, string $company, string $badge, string $daterange, vec<string> $highlights) {
        $ul = "<ul>";
        foreach ($highlights as $h) {
            $ul .= "<li>" . $h . "</li>";
        }
        $ul .= "</ul>";
        $html_sample = <<<h_sample
            <div class="tooltip">$company
                <div class="bottom">
                    <img src="images/$badge" />
                    <h3>$title</h3>
                    <p>$daterange</p>
                    $ul
                    <i></i>
                </div>
            </div>
h_sample;
        $this->html = $html_sample;
    }
    public function toHTMLString(): string {
        return $this->html;
    }
}
class skill_tool_tip implements XHPUnsafeRenderable {

    private string $html;

    public function __construct(string $title, string $desc, string $short_desc, string $badge, vec<string> $highlights) {
        $ul = "<ul>";
        foreach ($highlights as $h) {
            $ul .= "<li>" . $h . "</li>";
        }
        $ul .= "</ul>";
        $html_sample = <<<h_sample
            <div class="tooltip">$short_desc
                <div class="bottom">
                    <img src="images/$badge" />
                    <h3>$title</h3>
                    <p>$desc</p>
                    $ul
                    <i></i>
                </div>
            </div>
h_sample;
        $this->html = $html_sample;
    }
    public function toHTMLString(): string {
        return $this->html;
    }
}
class :tool_tip extends :x:element {

    attribute string desc @required;
    attribute string title @required;
    attribute string short @required;
    attribute string badge @required;
    attribute vec<string> notable  @required;

    // this is dumb, you have to have some element, like <div> to get this thing to render
    // leaving them out causes an innocuous error. And since the whole point was to circumvent
    // the innards of the span tags, we have to use div.
    //
    protected function render(): \XHPRoot {
        return <div>{new skill_tool_tip ($this->:title, $this->:desc, $this->:short, $this->:badge, $this->:notable )}</div>;
    }
}
class :exp_tool_tip extends :x:element {
    attribute string title @required;
    attribute string company @required;
    attribute string badge @required;
    attribute string daterange  @required;
    attribute vec<string> highlights @required;
    protected function render(): \XHPRoot {
        return <div>{new experience_tool_tip ($this->:title, $this->:company, $this->:badge, $this->:daterange, $this->:highlights)}</div>;
    }
}
function get_tooltip(Skill $s): XHPRoot {
    $tt = <tool_tip />;
    $tt->setAttribute("title", $s->nice_skill());
    $tt->setAttribute("desc",  $s->tool_tip());
    $tt->setAttribute("short", $s->get_skill());
    $tt->setAttribute("badge", $s->get_badge());
    $tt->setAttribute("notable", $s->get_notable());

    return $tt;
}
function get_experience(Experience $e): XHPRoot {
    $tt = <exp_tool_tip />;
    $tt->setAttribute("title", $e->get_title());
    $tt->setAttribute("company", $e->get_company());
    $tt->setAttribute("badge", $e->get_badge());
    $tt->setAttribute("daterange", $e->get_daterange());
    $tt->setAttribute("highlights", $e->get_accomplishments());

    return $tt;
}
function xhp_build_address(AnAddress $a): XHPRoot {
    $ary = Shapes::toArray($a);
    $address_block = <div id="address" />;
    $address_block->appendChild(<p>{$ary["Name"]}</p>);
    $address_block->appendChild(<p>{$ary["Street"]}</p>);
    $address_block->appendChild(<p>{$ary["City"]}</p>);
    $address_block->appendChild(<p>{$ary["State"]}</p>);
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

    //
    // table of links with tooltips
    //
    $skill_tab = <table id="tt_table" class="tt_table"/>;
    for ($i = 0; $i < count($expSkill[1]); $i += 4) {
        switch (count($expSkill[1]) - $i) {

        case 1:
            $skill_tab->appendChild(
                <tr class="left">
                    <td>{get_tooltip($expSkill[1][$i  ]->get())}</td>
                    <td></td>
                    <td></td>
                    <td></td>
               </tr>
            );
            break;

        case 2:
            $skill_tab->appendChild(
                <tr class="left">
                    <td>{get_tooltip($expSkill[1][$i  ]->get())}</td>
                    <td>{get_tooltip($expSkill[1][$i+1]->get())}</td>
                    <td></td>
                    <td></td>
               </tr>
            );
            break;

        case 3:
            $skill_tab->appendChild(
                <tr class="left">
                    <td>{get_tooltip($expSkill[1][$i  ]->get())}</td>
                    <td>{get_tooltip($expSkill[1][$i+1]->get())}</td>
                    <td>{get_tooltip($expSkill[1][$i+2]->get())}</td>
                    <td></td>
               </tr>
            );
            break;

        default:
            $skill_tab->appendChild(
                <tr class="tt_row">
                    <td>{get_tooltip($expSkill[1][$i  ]->get())}</td>
                    <td>{get_tooltip($expSkill[1][$i+1]->get())}</td>
                    <td>{get_tooltip($expSkill[1][$i+2]->get())}</td>
                    <td>{get_tooltip($expSkill[1][$i+3]->get())}</td>
               </tr>
            );
        }
    }
    echo <h2>Skills</h2>;
    echo $skill_tab;

    $exp_tab = <table id="ex_table" class="ex_table"/>;
    for ($i = 0; $i < count($expSkill[0]); $i++) {
        $exp_tab->appendChild(
            <tr class="left">
                <td>{get_experience($expSkill[0][$i]->get())}</td>
            </tr>
       );
    }
    echo <h2>Experience</h2>;
    echo $exp_tab;

    return;

}
