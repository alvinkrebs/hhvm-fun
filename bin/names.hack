require __DIR__."/../vendor/hh_autoload.php";

use namespace HH\Lib\Dict;

function xhp_build_exp(Vector<Experience> $exps): XHPRoot {
    $list = <ul id="exps" />;
    foreach ($exps as $exp) {
        $list->appendChild(<li>{$exp->nice_exp()}</li>);
    }
    return $list;
}
function xhp_build_skill(Vector<Skill> $skills): XHPRoot {
    $list = <ul id="skills" />;
    foreach ($skills as $skill) {
        $list->appendChild(<li>{$skill->nice_skill()}</li>);
    }
    return $list;
}
function show_shape(AnAddress $a) : void {
    $ary = Shapes::toArray($a);
    echo $ary["Street"] . "<br>";
    echo $ary["City"] . "<br>";
    echo $ary["State"] . "<br>";
    return;
}
/*
function order_it(Vector<Skill>  $unordered): dict<string, Skill> {
    $try1 = dict[];
    foreach ($unordered as $skill) {
        $try1[$skill->skill_key()] = $skill->get();
    }
    return Dict\sort_by_key($try1);
}
*/
function cv(): (Vector<Experience>, Vector<Skill>) {

    $exp = Vector {
        new Experience(19980101, 20081231, "I was at TiVo"),
        new Experience(20090101, 20141231, "I was not at TiVo"),
        new Experience(20150101,        0, "Current Position"),
    };

    $skill = Vector {
        new Skill("Linux", 1998, 100),
        new Skill("Windows", 1995, 80),
        new Skill("OSX", 2010, 90),
        new Skill("C++", 1998, 90),
        new Skill("C", 1990, 90),
        new Skill("C*", 2016, 90),
        new Skill("swift",2018,  90),
        new Skill("java", 2000, 90),
        new Skill("perl", 1990, 90),
        new Skill("shell scripting", 1990, 90),
        new Skill("make", 1996, 90),
        new Skill("cmake", 2011, 90),
        new Skill("cordova", 2018, 90),
        new Skill("awk", 1990, 90),
        new Skill("php", 1990, 90),
        new Skill("gdb", 1998, 90),
        new Skill("git", 2015, 90),
        new Skill("aws ec2", 2018, 90),
        new Skill("aws s3", 2018, 90),
        new Skill("aws elastic beanstalk", 2018, 90),
        new Skill("aws lambda", 2018, 90),
        new Skill("aws aurora", 2018, 90),
        new Skill("sql", 1990, 90),
    };

    // $ordered_skills = order_it($skill);
    // return shape("Experience" => $exp, "Skill" => $skill);
    return tuple($exp, $skill);

}
<<__EntryPoint>>
function xhp_object_methods_run(): void {

    echo me() . "<br>";
    $where_i_live = new StreetAddress();
    show_shape($where_i_live->all());

    // $aboutMe = Shapes::toArray(cv());
    // tuple($exp, $skl) = cv();
    // ($exp, $skl) = cv();
    $expSkill = cv();

    $exp_list = xhp_build_exp($expSkill[0]);
    foreach ($exp_list->getChildren() as $child) {
        /* HH_FIXME[4067] implicit __toString() is now deprecated */
        echo <ul>{$child}</ul>."\n";
    }

    $skill_list = xhp_build_skill($expSkill[1]);
    foreach ($skill_list->getChildren() as $child) {
        /* HH_FIXME[4067] implicit __toString() is now deprecated */
        echo <ul>{$child}</ul>."\n";
    }

}
