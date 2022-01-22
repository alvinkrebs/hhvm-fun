<<__EntryPoint>>
function main_resume(): void {

    \Facebook\AutoloadMap\initialize();
    
    $expSkill = Experiences();

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
                    <td>{get_skill($expSkill[1][$i+2]->get(), true)}</td>
                    <td></td>
               </tr>
            );
            break;

        default:
            $skill_tab->appendChild(
                <tr class="tt_row">
                    <td>{get_skill($expSkill[1][$i  ]->get())}</td>
                    <td>{get_skill($expSkill[1][$i+1]->get())}</td>
                    <td>{get_skill($expSkill[1][$i+2]->get(), true)}</td>
                    <td>{get_skill($expSkill[1][$i+3]->get(), true)}</td>
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

    $crd_tab = <<<_crd_tab
        <table>
            <tr><td class="crd_hdr">Brought to you by ...</td></tr>
            <tr><td class="crd_line"><a target="_blank" href=http://www.menucool.com>http://www.menucool.com</a></td></tr>
            <tr><td class="crd_line"><a target="_blank" href=https://dl.hhvm.com/ubuntu>https://dl.hhvm.com/ubuntu</a></td></tr>
            <tr><td class="crd_line"><a target="_blank" href=http://www.qrcode-monkey.com>http://www.qrcode-monkey.com</a></td></tr>
            <tr><td class="crd_line"><a target="_blank" href=https://github.com/alvinkrebs/hhvm-fun.git>https://github.com/alvinkrebs/hhvm-fun.git</a></td></tr>
        </table>

_crd_tab;

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

    echo $crd_tab;

    return;

}
