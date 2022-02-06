use namespace HH\Lib\Dict;
use namespace HH\Lib\Str;

function Experiences(): (vec<Experience>, vec<Skill>, vec<Education>) {

    $exp = vec<Experience> [

        new Experience(19900101, 19941231, "Sun Microsystems", "Member of Technical Staff", "sun.png", vec<string> [
            "Sybase Sql Server report writer",
            "NetISAM programmer",
            "SQR writer",
            "Customer Return for Credit, sqr app",
        ]),

        new Experience(19950101, 19950831, "Network General (acquired by McAfee)", "Member of Technical Staff", "ng.jpg", vec<string> [
            "Sybase DBA",
            "Sybase Replication Server",
            "Expect PAC-Bell Paging System",
        ]),

        new Experience(19950901, 19980931, "Baystone Software (acquired by Remedy)", "Principle Engineer", "remedy.jpg", vec<string> [
            "CORA Biz Rules Generator",
            "CRUD windows binaries using remedy API",
            "Data migration using perl",
        ]),

        new Experience(19980901, 20041031, "TiVo", "Member of Technical Staff", "tivo.png", vec<string> [
            "EISA vbi caption reader, (linux device driver)",
            "IR Database parser and distribution tools", 
            "Tribune Media Service Content Distribution Service",
            "Senior Manager, Showcase Content Services",
            "TiVo Tags caption insertion for NBC/Disney",
        ]),

        new Experience(20010101, 20060731, "Avvenu (acquired by Nokia)", "Member of Technical Staff", "nokia.jpg", vec<string> [
            "Streaming A/V proxy service over WAP",
            "NTLMv2 Biz Proxy service",
            "Adobe Elements plugin",
        ]),

        new Experience(20060801, 20100231, "Mobilygen (acquired by Maxim)", "Member of Technical Staff", "mobi.jpg", vec<string> [
            "Storage Driver for CF/IDE",
            "Lua extensions for motion tracking",
            "USB Driver",
        ]),

        new Experience(20100101, 20100231, "Blueberry Video", "Founder", "blue.jpg", vec<string> [
            "Board bring up",
            "Investor presentations",
            "AV device driver rewrite in support of 16 cores"
        ]),

        new Experience(20100901, 20150831, "Dell", "Senior Manager", "dell.png", vec<string> [
            "Custom Inventory Rules Parser on four platforms, win, osx, linux, sparc",
            "Managed the K2000 team delivering multicast and L10N",
            "Jenkins to Atlassian Bamboo migration",
        ]),

        new Experience(20150901, 20181131, "Los Altos Research Center", "Architect", "larc.png", vec<string> [
            "GO(lang) server for mesh network",
            "Patent #15/208,509 for mesh network awarded",
            "BLE/Accelerometer motion control for proprietary AV system, tinyduino hardware",
            "Network Administration",
            "iOS/tvOS media services utilizing dead drop network",
            "arm go server/circuit supporting fast LAN service of video",
            "Arduino, TinyDuino, RF, BLE, accelerometer to support remote tuner control using physical gestures",
        ]),

        new Experience(20180301, 20210104, "Viziapps", "Principle Engineer", "viziapps.png", vec<string> [
            "ASPX application",
            "Cordova plugin developer, (ios, android)",
            "AWS Administration: S3, EC2, Elastic Beanstalk, RDS"
        ]),

        new Experience(20200501, 0, "Realtime Innovation", "Build/Release Engineer", "rti_logo.jpeg", vec<string> [
            "Jenkins Automation",
            "Perl and Groovy scripting",
            "Sales Force Automation User",
            "Atlassian Bamboo to Jenkins migration",
        ])
    ];

    $skill = vec<Skill>[
        new Skill("Linux", 1998, 100, "linux.jpg", vec<string> [
            "Several projects up and down the stack from drivers to servers",
            "Familiar with several flavors including: redhat, centos, suse, ubuntu",
            "Familiar with several package managers",
            "Comfortable with administration",
            "Familiar with iX86, arm, ppc",
        ]),
        new Skill("Windows", 1995, 70, "windows.png", vec<string> [
            "Server programs",
            "System development",
            "UI, aspx, C#",
        ]),
        new Skill("OSX", 2010, 70, "osx.jpg", vec<string> [
            "Comfortable with IDE",
            "Release product using swift and objective-C",
            "iOS and tvOS",
        ]),
        new Skill("C++", 1998, 90, "cplus.png", vec<string>[
            "Many projects",
            "TiVo is (was?) a C++ shop",
        ]),
        new Skill("C", 1990, 90, "c.png", vec<string>[
            "Started with K&R",
            "Favorite libraries: libevent2, libxml, libexpat",
        ]),
        new Skill("C#", 2016, 70, "c-sharp.png", vec<string>[
            "Viziapps service is written in aspx",
            "Several modal applications written for LARC",
        ]),
        new Skill("swift", 2018,  70, "swift.png", vec<string>[
            "All iOS, tvOS and OSX applications for LARC were written in swift",
            "Worked through three major releases",
        ]),
        new Skill("device drivers",2000, 80, "dd.jpg", vec<string>[
            "CF/IDE Driver for arm",
            "Infrared Driver for mips/broadcom",
            "Closed Caption decoder for i686",
            "i2c", "spi", "pci", "pcie",
        ]),
        new Skill("java", 2000, 70, "java.png", vec<string>[
            "SGI StudioCentral extensions written for collateral collection",
            "applets", "server code for data migration",
        ]),
        new Skill("perl", 1990, 90, "perl.jpg", vec<string>[
            "Discovered perl when awk could not handle very large input",
            "My go to tool to handle any kind of data culling",
            "Created several extension.",
        ]),
        new Skill("lua", 2008, 50, "lua.jpg", vec<string>[
            "extended LUA to support motion tracking",
        ]),
        new Skill("shell scripting", 1990, 90, "shell.jpg", vec<string>[
            "so many scripts",
            "zsh, favorite interactive shell",
        ]),
        new Skill("make", 1996, 90, "make.png", vec<string>[
            "use make's essentials to build sofware used to distribute media",
        ]),
        new Skill("hudson/jenkins", 2010, 90, "jenkins.png", vec<string> [
            "create build, package pipeline for Dell",
            "Enjoying new pipeline support for CI/CD with groovy scripting",
            "Bye bye Atlassian",
        ]),
        new Skill("cmake", 2011, 70, "cmake.png", vec<string> [
            "used to build binaries and packages on three arch and 6 os releases",
        ]),
        new Skill("cordova", 2018, 70, "cordova.png", vec<string> [
            "plugin development",
            "maintenance of non-plugin viziapps container both ios and android",
        ]),
        new Skill("awk", 1990, 90, "awk.jpg", vec<string> [
            "my go to inline parser",
        ]),
        new Skill("php", 1999, 90, "php.png", vec<string> [
            "with imagemagick created updateable drawsheet for tennis tournaments",
            "the Dell K*000 service was written in php, made many modifications and bug fixes",
        ]),
        new Skill("gdb", 1998, 90, "gdb.jpg", vec<string> [
            "debugging",
        ]),
        new Skill("git", 2015, 90, "git.png", vec<string> [
            "Administration",
            "merge support",
            "server creation",
        ]),
        new Skill("aws ec2", 2018, 70, "ec2.png", vec<string> [
            "for viziapps",
        ]),
        new Skill("aws s3", 2018, 70, "s3.png", vec<string> [
            "for viziapps",
        ]),
        new Skill("aws elastic beanstalk", 2018, 70, "eb.png", vec<string> [
            "for viziapps",
        ]),
        new Skill("aws lambda", 2018, 70, "lambda.jpg", vec<string> [
            "javascript",
            "golang",
        ]),
        new Skill("aws aurora", 2018, 90, "aurora.png", vec<string> [
            "for viziapps",
        ]),
        new Skill("tcl/tk, incr tcl", 1999, 80, "tcl.png", vec<string> [
            "TiVo's first CDN, written in tcl for both client (the tivo box) and the service",
        ]),
        new Skill("sql", 1990, 70, "sql.png", vec<string> [
            "Many years of sql experience",
            "Stored procedure and Triggers",
            "create SQR reports for SUNW sales",
            "Oracle, MySql, RDS, sqlite3",
        ]),
        new Skill("javascript", 2010, 80, "javascript.png", vec<string> [
            "enjoying javascript as of late.",
            "enjoy the promise object",
            "still think it's hard to debug",
        ]),
        new Skill("mongodb", 2010, 80, "mongo.png", vec<string> [
            "Coupled with Google's Breakpad, mongodb was used to hold pdb files for released software",
            "Coupled with mango (go's mongo extension) support dead drop indexing",
        ]),
        new Skill("quickbase", 2018, 70, "quickbase.png", vec<string> [
            "AWS Lambda connector for Viziapps",
        ]),
        new Skill("lex/yacc", 1996, 90, "bison.jpg", vec<string> [
            "CORA Remedy Business Rule Writer",
            "IR Database generation",
            "K1000 Custom Rules Parser",
        ]),
        new Skill("go", 2015, 90, "go.png", vec<string> [
            "Serial Infrared motion detector",
            "MXTP mesh network service",
            "Many smallish binaries",
        ]),
        new Skill("hhvm/hacklang", 2020, 10, "hhvm.jpg", vec<string> [
            "Since I already knew php, I thought learning hack/hhvm would be easy",
            "It's not easy",
            "This html page is generated by Docker hhvm/hhvm-proxygen:latest and xhp-4.",
            "Migrated from xhp-3",
        ]),
        new Skill("Atlassian Bamboo, Confluence, etc", 2015, 70, "atlassian.png", vec<string> [
            "Migration of jenkins to Bamboo",
            "Job definition",
            "Worflow",
        ]),
    ];

    $edu = vec<Education>[
        new Education(19830901, 19890801, "University California at Davis", "Economics", "ucd.png", vec<string> [ "Bachelors of Science" ]),
        new Education(19920901, 19980601, "Santa Clara University", "Engineering", "scu.png", vec<string> [ "Masters of Science" ]),
    ];

    return tuple(sort_vec_exp($exp), sort_vec_skill($skill), sort_vec_edu($edu));

}
function sort_vec_skill(vec<Skill> $vec): vec<Skill> {
    $d = dict[];
    foreach ($vec as $k => $v) {
        $d[$v->key()] = $v->get();
    }
    $ordered = Dict\sort($d, function($a, $b): num { return (-1 * ($a->iKey() - $b->iKey())) + Str\compare($a->get_skill(), $b->get_skill()); } );
    $sorted_vec = vec[];
    foreach ($ordered as $k => $v) {
        $sorted_vec[] = $v->get();
    }
    return $sorted_vec;
}
/*
    Called just before returning to "main". 
    TIL: We can sort any which way using the $comparator argument of sort.

*/
function sort_vec_exp(vec<Experience> $vec): vec<Experience> {
    $d = dict[];
    foreach ($vec as $k => $v) {
        $d[$v->key()] = $v->get();
    }
    $ordered = Dict\sort($d, function($a, $b): int { return $b->ikey() - $a->ikey() ; });
    $sorted_vec = vec[];
    foreach ($ordered as $k => $v) {
        $sorted_vec[] = $v->get();
    }
    return $sorted_vec;
}
function sort_vec_edu(vec<Education> $vec): vec<Education> {
    $d = dict[];
    foreach ($vec as $k => $v) {
        $d[$v->key()] = $v->get();
    }
    $ordered = Dict\sort($d, function($a, $b): int { return $b->ikey() - $a->ikey() ; });
    $sorted_vec = vec[];
    foreach ($ordered as $k => $v) {
        $sorted_vec[] = $v->get();
    }
    return $sorted_vec;
}
