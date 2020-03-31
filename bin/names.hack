require __DIR__."/../vendor/hh_autoload.php";

use namespace HH\Lib\Dict;

/*
    <div class="tooltip">
        bottom
        <div class="bottom">
            <img src="cssttp/css-tooltip-image.jpg" />
            <h3>CSS Tooltip</h3>
            <p>The CSS tooltip appears when user moves the mouse over an element, or when user tap the element with a mobile device.</p>
            <i></i>
        </div>
    </div>

    <div class="tooltip">
        Left
        <div class="left">
            <h3>Lorem Ipsum</h3>
            <ul>
                <li>Aliquam ac odio ut est aliquet tempor vitae sed arcu</li>
                <li>Cras porttitor orci ac porta gravida</li>
            </ul>
            <i></i>
        </div>
    </div>

*/
class skill_tool_tip  implements XHPUnsafeRenderable {

    private string $html;

    public function __construct(string $title, string $desc, string $short_desc, string $badge, vec<string> $highlights) {

        
        $ul = "<ul>";
        foreach ($highlights as $h) {
            $ul .= "<li>" . $h . "</li>";
        }
        $ul .= "</ul>";

        $html_sample = <<<h_sample
                <div class="tooltip">
                    $short_desc
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
    attribute vec<string> highlights @required;

    // this is dumb, you have to have some element, like <div> to get this thing to render
    // leaving them out causes an innocuous error. And since the whole point was to circumvent
    // the innards of the span tags, we have to use div.
    //
    protected function render(): \XHPRoot {
        return <div>{new skill_tool_tip ($this->:title, $this->:desc, $this->:short, $this->:badge, $this->:highlights)}</div>;
    }
}
function get_tooltip(Skill $s): XHPRoot {
    $tt = <tool_tip />;
    $tt->setAttribute("title", $s->nice_skill());
    $tt->setAttribute("desc",  $s->tool_tip());
    $tt->setAttribute("short", $s->get_skill());
    $tt->setAttribute("badge", $s->get_badge());

    $highlights = vec<string> [
        "a little coding",
        "a little debugging",
        "a little lunching"
    ];

    $tt->setAttribute("highlights", $highlights);

    return $tt;
}
function get_experience(Experience $e): XHPRoot {
    $tt = <tool_tip />;
    $tt->setAttribute("title", $e->nice_exp());
    $tt->setAttribute("desc",  $e->tool_tip());
    $tt->setAttribute("short", $e->nice_exp());
    $tt->setAttribute("badge", $e->get_badge());

    $highlights = vec<string> [
        "a lot of coding",
        "a lot of debugging",
        "a lot of lunching"
    ];

    $tt->setAttribute("highlights", $highlights);

    return $tt;

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
        new Experience(19950101, 19981231, "Baystone Software", "Principle Engineer", "remedy.jpg"),
        new Experience(19990101, 20041231, "TiVo Inc.", "Member of Technical Staff", "tivo.png"),
        new Experience(20050101, 20061231, "Avvenu Inc.", "Media Engineer", "nokia.jpg"),
        new Experience(20060101, 20101231, "Mobyligen", "Member of Technical Staff", "mobi.jpg"),
        new Experience(20100101, 20101231, "Blueberry Video", "Founder"),
        new Experience(20110101, 20215231, "Dell Inc.", "Senior Manager", "dell.png"),
        new Experience(20160101, 20181231, "LARC Inc.", "Architect"),
        new Experience(20150101,        0, "Viziapps", "Principle Engineer", "viziapps.png"),
    ];

    $skill = vec<Skill>[
        new Skill("Linux", 1998, 100, "linux.jpg"),
        new Skill("Windows", 1995, 70, "windows.png"),
        new Skill("OSX", 2010, 70, "osx.jpg"),
        new Skill("C++", 1998, 90, "cplus.png"),
        new Skill("C", 1990, 90, "c.png"),
        new Skill("C#", 2016, 70, "c-sharp.png"),
        new Skill("swift",2018,  70, "swift.png"),
        new Skill("device drivers",2000, 80, "dd.jpg"),
        new Skill("java", 2000, 70, "java.png"),
        new Skill("perl", 1990, 90, "perl.jpg"),
        new Skill("shell scripting", 1990, 90, "shell.jpg"),
        new Skill("make", 1996, 90, "make.png"),
        new Skill("hudson/jenkins", 2010, 90, "jenkins.png"),
        new Skill("cmake", 2011, 70, "cmake.png"),
        new Skill("cordova", 2018, 70, "cordova.png"),
        new Skill("awk", 1990, 90, "awk.jpg"),
        new Skill("php", 1990, 90, "php.png"),
        new Skill("gdb", 1998, 90, "gdb.jpg"),
        new Skill("git", 2015, 90, "git.png"),
        new Skill("aws ec2", 2018, 70, "ec2.png"),
        new Skill("aws s3", 2018, 70, "s3.png"),
        new Skill("aws elastic beanstalk", 2018, 70, "eb.png"),
        new Skill("aws lambda", 2018, 70, "lambda.jpg"),
        new Skill("aws aurora", 2018, 90, "aurora.png"),
        new Skill("sql", 1990, 70, "sql.jpg"),
        new Skill("javascript", 2010, 80, "javascript.png"),
        new Skill("mongodb", 2010, 80, "mongo.png"),
        new Skill("quickbase", 2018, 70, "quickbase.png"),
        new Skill("lex/yacc", 1996, 90, "bison.jpg"),
        new Skill("hhvm/hacklang", 2020, 10, "hhvm.jpg"),
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
               </tr>
            );
            break;

        case 2:
            $skill_tab->appendChild(
                <tr class="left">
                    <td>{get_tooltip($expSkill[1][$i  ]->get())}</td>
                    <td>{get_tooltip($expSkill[1][$i+1]->get())}</td>
               </tr>
            );
            break;

        case 3:
            $skill_tab->appendChild(
                <tr class="left">
                    <td>{get_tooltip($expSkill[1][$i  ]->get())}</td>
                    <td>{get_tooltip($expSkill[1][$i+1]->get())}</td>
                    <td>{get_tooltip($expSkill[1][$i+2]->get())}</td>
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
    echo $skill_tab;

    $exp_tab = <table id="ex_table" class="ex_table"/>;
    for ($i = 0; $i < count($expSkill[0]); $i++) {
        $exp_tab->appendChild(
            <tr class="left">
                <td>{get_experience($expSkill[0][$i]->get())}</td>
            </tr>
       );
    }
    echo $exp_tab;

    return;

}
