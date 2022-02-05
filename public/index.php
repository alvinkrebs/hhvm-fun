<?hh

use type Facebook\XHP\HTML\{h2, script, link, head, table, tr, td};

const int EMPLOYMENT = 0;
const int SKILL = 1;
const int EDUCATION = 2;

<<__EntryPoint>>
async function main_resume(): Awaitable<void> {

    require_once(__DIR__.'/../vendor/autoload.hack');

    \Facebook\AutoloadMap\initialize();
    
    $expSkill = Experiences();

    //
    // table of links with tooltips
    //
    $skill_tab = <table class="tt_table"/>;
    for ($i = 0; $i < count($expSkill[SKILL]); $i += 4) {
        switch (count($expSkill[SKILL]) - $i) {

        case 1:
            $skill_tab->appendChild(
                <tr class="tt_row">
                    <td>{get_skill($expSkill[SKILL][$i  ]->get())}</td>
                    <td></td>
                    <td></td>
                    <td></td>
               </tr>
            );
            break;

        case 2:
            $skill_tab->appendChild(
                <tr class="tt_row">
                    <td>{get_skill($expSkill[SKILL][$i  ]->get())}</td>
                    <td>{get_skill($expSkill[SKILL][$i+1]->get())}</td>
                    <td></td>
                    <td></td>
               </tr>
            );
            break;

        case 3:
            $skill_tab->appendChild(
                <tr class="tt_row">
                    <td>{get_skill($expSkill[SKILL][$i  ]->get())}</td>
                    <td>{get_skill($expSkill[SKILL][$i+1]->get())}</td>
                    <td>{get_skill($expSkill[SKILL][$i+2]->get(), true)}</td>
                    <td></td>
               </tr>
            );
            break;

        default:
            $skill_tab->appendChild(
                <tr class="tt_row">
                    <td>{get_skill($expSkill[SKILL][$i  ]->get())}</td>
                    <td>{get_skill($expSkill[SKILL][$i+1]->get())}</td>
                    <td>{get_skill($expSkill[SKILL][$i+2]->get(), true)}</td>
                    <td>{get_skill($expSkill[SKILL][$i+3]->get(), true)}</td>
               </tr>
            );
        }
    }

    $exp_tab = <table id="ex_table" class="ex_table"/>;
    for ($i = 0; $i < count($expSkill[EMPLOYMENT]); $i++) {
        $exp_tab->appendChild(
            <tr class="tt_row">
                <td>{get_experience($expSkill[EMPLOYMENT][$i]->get())}</td>
                <td class="tab_line">{$expSkill[EMPLOYMENT][$i]->get_exprange()}</td>
            </tr>
       );
    }

    $edu_tab = <table id="ex_table" class="ex_table"/>;
    for ($i = 0; $i < count($expSkill[EDUCATION]); $i++) {
        $edu_tab->appendChild(
            <tr class="tt_row">
                <td>{get_education($expSkill[EDUCATION][$i]->get())}</td>
                <td class="tab_line">{$expSkill[EDUCATION][$i]->get_edurange()}</td>
            </tr>
       );
    }

    $crd_tab = <<<_crd_tab
        <table>
            <tr><td class="crd_hdr">Brought to you by ...</td></tr>
            <tr><td class="crd_line"><a target="_blank" href=http://www.menucool.com>http://www.menucool.com</a></td></tr>
            <tr><td class="crd_line"><a target="_blank" href=https://dl.hhvm.com/ubuntu>https://dl.hhvm.com/ubuntu</a></td></tr>
            <tr><td class="crd_line"><a target="_blank" href=http://www.qrcode-monkey.com>http://www.qrcode-monkey.com</a></td></tr>
            <tr><td class="crd_line"><a target="_blank" href=https://github.com/alvinkrebs/hhvm-fun.git>https://github.com/alvinkrebs/hhvm-fun.git</a></td></tr>
        </table>
_crd_tab;

    $head_tab = <<<_head_tab
        <head>
            <link rel="stylesheet" href="form-fun.css" />
            <link rel="stylesheet" href="third-party/tooltip/themes/1/tooltip.css" />
        </head>
_head_tab;

    echo $head_tab;

    echo await get_address(new StreetAddress()->all())->toStringAsync();

    echo "<h2>Work Experience</h2>";
    echo await $exp_tab->toStringAsync();

    echo "<h2>Skills</h2>";
    echo await $skill_tab->toStringAsync();

    echo "<h2>Education</h2>";
    echo await $edu_tab->toStringAsync();

    echo "<h2>Tooltip Credits ...</h2>";
    echo $crd_tab;

    return;

}
