require __DIR__."/../vendor/hh_autoload.php";

use namespace HH\Lib\Dict;

class :safe_exp_tool_tip extends :x:element {

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
            <div class="tooltip">{$this->:company}
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
class :safe_tool_tip extends :x:element {

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
            <div class="tooltip">{$this->:short}
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
    $tt = <safe_tool_tip />;
    $tt->setAttribute("title", $s->nice_skill());
    $tt->setAttribute("desc",  $s->tool_tip());
    $tt->setAttribute("short", $s->get_skill());
    $tt->setAttribute("badge", $s->get_badge());
    $tt->setAttribute("notable", $s->get_notable());

    return $tt;
}
function get_experience(Experience $e): XHPRoot {
    $tt = <safe_exp_tool_tip />;
    $tt->setAttribute("title", $e->get_title());
    $tt->setAttribute("company", $e->get_company());
    $tt->setAttribute("badge", $e->get_badge());
    $tt->setAttribute("daterange", $e->get_daterange());
    $tt->setAttribute("highlights", $e->get_accomplishments());

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
function xhp_object_methods_run(): void {

    \Facebook\AutoloadMap\initialize();
    
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

    $exp_tab = <table id="ex_table" class="ex_table"/>;
    for ($i = 0; $i < count($expSkill[0]); $i++) {
        $exp_tab->appendChild(
            <tr class="left">
                <td>{get_experience($expSkill[0][$i]->get())}</td>
                <td>{$expSkill[0][$i]->get_exprange()}</td>
            </tr>
       );
    }

    $edu_tab = <table id="ed_table" class="ed_table"/>;
    $edu_tab->appendChild(<tr><td>Santa Clara University, MSCE</td><td>1998</td></tr>);
    $edu_tab->appendChild(<tr><td>University of California, Davis, BS Economics</td><td>1989</td></tr>);

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
