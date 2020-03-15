require __DIR__."/../vendor/hh_autoload.php";

use namespace HH\Lib\Dict;

function xhp_build_exp(vec<Experience> $exps): XHPRoot {
    $list = <ul id="exps" />;
    foreach ($exps as $exp) {
        $list->appendChild(<li><p>{$exp->nice_exp()}</p></li>);
    }
    return $list;
}
function xhp_build_skill(vec<Skill> $skills): XHPRoot {
    $list = <ul id="skills" />;
    foreach ($skills as $skill) {
        $list->appendChild(<li><p>{$skill->nice_skill()}</p></li>);
    }
    return $list;
}
function show_shape(AnAddress $a) : void {
    $ary = Shapes::toArray($a);
    echo $ary["Street"] . "<br>";
    echo $ary["City"] . "<br>";
    echo $ary["State"] . "<br><br>";
    return;
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
        new Experience(19950101, 19981231, "Baystone Software"),
        new Experience(19990101, 20041231, "TiVo Inc."),
        new Experience(20050101, 20061231, "Avvenu Inc."),
        new Experience(20060101, 20101231, "Mobyligen"),
        new Experience(20100101, 20101231, "Blueberry Video"),
        new Experience(20110101, 20215231, "Dell Inc."),
        new Experience(20160101, 20181231, "LARC Inc."),
        new Experience(20150101,        0, "Viziapps"),
    ];

    $skill = vec<Skill>[
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
        new Skill("javascript", 2010, 90),
        new Skill("mongodb", 2010, 90),
        new Skill("sql", 1990, 90),
        new Skill("quickbase", 2018, 90),
        new Skill("php", 1999, 90),
        new Skill("hhvm/hacklang", 2020, 10),
    ];

    $ordered = sort_vec_skill($skill);

    return tuple($exp, $ordered);

}
final class :a:post extends :x:element {
  attribute :a;

  use XHPHelpers;

  protected function render(): XHPRoot {
    $id = $this->getID();

    $anchor = <a>{$this->getChildren()}</a>;
    $form = (
      <form
        id={$id}
        method="post"
        action={$this->:href}
        target={$this->:target}
        class="postLink">
        {$anchor}
      </form>
    );

    $this->transferAllAttributes($anchor);
    $anchor->setAttribute(
      'onclick',
      'document.getElementById("'.$id.'").submit(); return false;',
    );
    $anchor->setAttribute('href', '#');

    return $form;
  }
}
<<__EntryPoint>>
function xhp_object_methods_run(): void {

    \Facebook\AutoloadMap\initialize();
    
    echo
        <head>
            <link rel="stylesheet" href="bin/form-fun.css" />
        </head>
    ;
    echo <h1>samples</h1>;
    echo me() . "<br>";
    $where_i_live = new StreetAddress();
    show_shape($where_i_live->all());

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
    echo <a:post href="http://www.example.com">I make a POST REQUEST</a:post>;

}
