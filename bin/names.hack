require __DIR__."/../vendor/hh_autoload.php";

use namespace HH\Lib\Dict;

/*
    called by get_experience() when it constructs the experience tooltip
    TIL: how to call hack inside {}, see the img src tag.
*/
class :experience_tooltip extends :x:element {
    attribute string title @required;
    attribute string company @required;
    attribute string badge @required;
    attribute string daterange  @required;
    attribute vec<string> highlights @required;
    protected function render(): \XHPRoot {
        $ul = <ul />;
        foreach ($this->:highlights as $h) {
            $ul->appendChild(<li>{$h}</li>);
        }
        return
            <div class="tooltip"><div class="tab_line">{$this->:company}</div>
                <div class="bottom">
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
function get_experience(Experience $e): XHPRoot {
    $tt = <experience_tooltip />;
    $tt->setAttribute("title", $e->get_title());
    $tt->setAttribute("company", $e->get_company());
    $tt->setAttribute("badge", $e->get_badge());
    $tt->setAttribute("daterange", $e->get_daterange());
    $tt->setAttribute("highlights", $e->get_accomplishments());
    return $tt;
}
/*
    called by get_skill() when it constructs the skill tooltip
*/
class :skill_tooltip extends :x:element {
    attribute string desc @required;
    attribute string title @required;
    attribute string short @required;
    attribute string badge @required;
    attribute vec<string> notable  @required;
    protected function render(): \XHPRoot {
        $ul = <ul />;
        foreach ($this->:notable as $h) {
            $ul->appendChild(<li>{$h}</li>);
        }
        return
            <div class="tooltip"><div class="tab_line">{$this->:short}</div>
                <div class="bottom">
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
function get_skill(Skill $s): XHPRoot {
    $tt = <skill_tooltip />;
    $tt->setAttribute("title", $s->nice_skill());
    $tt->setAttribute("desc",  $s->tool_tip());
    $tt->setAttribute("short", $s->get_skill());
    $tt->setAttribute("badge", $s->get_badge());
    $tt->setAttribute("notable", $s->get_notable());
    return $tt;
}
function get_address(AnAddress  $a):  XHPRoot {
    $ary = Shapes::toArray($a);
    $addr = <table align="center" id="contact"/>;
    $addr->appendChild(<tr><td align="center">{$ary["Name"  ]}</td></tr>);
    $addr->appendChild(<tr><td align="center">{$ary["Street"]}</td></tr>);
    $addr->appendChild(<tr><td align="center">{$ary["City"  ]}</td></tr>);
    $addr->appendChild(<tr><td align="center">{$ary["State" ]}</td></tr>);
    $addr->appendChild(<tr><td align="center">{$ary["Phone" ]}</td></tr>);
    return $addr;
}
<<__EntryPoint>>
function main_resume(): void {

    \Facebook\AutoloadMap\initialize();
    
    $expSkill = cv();

    //
    // table of links with tooltips
    //
    $skill_tab = <table class="tt_table"/>;
    for ($i = 0; $i < count($expSkill[1]); $i += 4) {
        switch (count($expSkill[1]) - $i) {

        case 1:
            $skill_tab->appendChild(
                <tr class="tt_row">
                    <td>{get_skill($expSkill[1][$i  ]->get())}</td>
                    <td></td>
                    <td></td>
                    <td></td>
               </tr>
            );
            break;

        case 2:
            $skill_tab->appendChild(
                <tr class="tt_row">
                    <td>{get_skill($expSkill[1][$i  ]->get())}</td>
                    <td>{get_skill($expSkill[1][$i+1]->get())}</td>
                    <td></td>
                    <td></td>
               </tr>
            );
            break;

        case 3:
            $skill_tab->appendChild(
                <tr class="tt_row">
                    <td>{get_skill($expSkill[1][$i  ]->get())}</td>
                    <td>{get_skill($expSkill[1][$i+1]->get())}</td>
                    <td>{get_skill($expSkill[1][$i+2]->get())}</td>
                    <td></td>
               </tr>
            );
            break;

        default:
            $skill_tab->appendChild(
                <tr class="tt_row">
                    <td>{get_skill($expSkill[1][$i  ]->get())}</td>
                    <td>{get_skill($expSkill[1][$i+1]->get())}</td>
                    <td>{get_skill($expSkill[1][$i+2]->get())}</td>
                    <td>{get_skill($expSkill[1][$i+3]->get())}</td>
               </tr>
            );
        }
    }

    $exp_tab = <table id="ex_table" class="ex_table"/>;
    for ($i = 0; $i < count($expSkill[0]); $i++) {
        $exp_tab->appendChild(
            <tr class="tt_row">
                <td>{get_experience($expSkill[0][$i]->get())}</td>
                <td class="tab_line">{$expSkill[0][$i]->get_exprange()}</td>
            </tr>
       );
    }

    $edu_tab = <<<_edu_tab
        <table id="ed_table" class="ed_table"/>
            <tr><td class="tab_line">Santa Clara University, MSCE</td><td class="tab_line">1998</td></tr>
            <tr><td class="tab_line">University of California, Davis, BS Economics</td><td class="tab_line">1989</td></tr>
        </table>
_edu_tab;

    echo
        <head>
            <link rel="stylesheet" href="bin/form-fun.css" />
            <link rel="stylesheet" href="third-party/tooltip/themes/1/tooltip.css" />
            <script src="third-party/tooltip/themes/1/tooltip.js"></script>
        </head>;

    echo get_address(new StreetAddress()->all());

    echo <h2>Work Experience</h2>;
    echo $exp_tab;

    echo <h2>Skills</h2>;
    echo $skill_tab;

    echo <h2>Education</h2>;
    echo $edu_tab;

    return;

}
