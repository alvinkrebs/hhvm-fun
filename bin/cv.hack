function cv(): (vec<Experience>, vec<Skill>) {

    $exp = vec<Experience> [

        new Experience(19900101, 19941231, "Sun Microsystems", "Member of Technical Staff", "sun.png", vec<string> [
            "Sybase Sql Server report writer",
            "NetISAM programmer",
            "SQR writer",
        ]),

        new Experience(19950101, 19951231, "Network General", "Member of Technical Staff", "ng.jpg", vec<string> [
            "First real parser to implement CORA Biz Rules Tool",
            "First real windows server application"
        ]),

        new Experience(19960101, 19981231, "Baystone Software", "Principle Engineer", "remedy.jpg", vec<string> [
            "First real parser to implement CORA Biz Rules Tool",
            "First real windows server application"
        ]),

        new Experience(19990101, 20041231, "TiVo Inc.", "Member of Technical Staff", "tivo.png", vec<string> [
            "First linux device driver, EISA vbi caption reader",
            "IR Database parser and distribution", 
            "Tribune Media Service Content Distribution Service",
            "Senior Manager, Showcase Content Services"
        ]),

        new Experience(20050101, 20061231, "Avvenu Inc.", "Media Engineer", "nokia.jpg", vec<string> [
            "Streaming A/V proxy service",
            "NTLMv2 Biz Proxy service",
        ]),

        new Experience(20060101, 20101231, "Mobilygen", "Member of Technical Staff", "mobi.jpg", vec<string> [
            "Storage Driver for CF/IDE",
            "Lua extensions for motion tracking",
            "USB Driver",
        ]),

        new Experience(20100101, 20101231, "Blueberry Video", "Founder", "what.jpg", vec<string> [
            "Board bring up",
            "Investor presentations",
            "AV device driver rewrite in support of 16 cores"
        ]),

        new Experience(20110101, 20215231, "Dell Inc.", "Senior Manager", "dell.png", vec<string> [
            "Parser on four platforms, win, osx, linux, sparc",
            "Managed the K2000 team delivering the top 5 customer requests",
            "Multicast image distribution",
        ]),

        new Experience(20160101, 20181231, "LARC Inc.", "Architect", "what.jpg", vec<string> [
            "Go server for mesh network",
            "Several arm projects",
            "BLE/Accelerometer motion control for proprietary AV system",
            "Network Administration"
        ]),

        new Experience(20150101,        0, "Viziapps", "Principle Engineer", "viziapps.png", vec<string> [
            "ASPX application",
            "Cordova plugin developer",
            "AWS Administration: S3, EC2, Elastic Beanstalk, RDS"
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
        ]),
        new Skill("OSX", 2010, 70, "osx.jpg", vec<string> [
            "Comfortable with IDE",
            "Release product using swift and objective-C",
        ]),
        new Skill("C++", 1998, 90, "cplus.png", vec<string>[
            "Many projects",
            "TiVo is (was?) a C++ shop",
        ]),
        new Skill("C", 1990, 90, "c.png", vec<string>[
            "My first 3rd GL language, starting with K&R",
            "Favorite libraries: libevent2, libxml, libexpat",
        ]),
        new Skill("C#", 2016, 70, "c-sharp.png", vec<string>[
            "Viziapps service is written in aspx",
            "Several modal applications written for LARC",
        ]),
        new Skill("swift", 2018,  70, "swift.png", vec<string>[
            "All iOS an OSX applications for LARC were written in swift",
            "Worked through three major releases",
        ]),
        new Skill("device drivers",2000, 80, "dd.jpg", vec<string>[
            "CF/IDE Driver for arm",
            "Infrared Driver for mips/broadcom",
            "Closed Caption decoder for i686",
        ]),
        new Skill("java", 2000, 70, "java.png", vec<string>[
            "SGI StudioCentral extensions written for collateral collection",
            "Several applets",
        ]),
        new Skill("perl", 1990, 90, "perl.jpg", vec<string>[
            "Discovered perl when awk could not handle very large input",
            "My go to tool to handle any kind of data culling",
        ]),
        new Skill("lua", 2008, 50, "lua.jpg", vec<string>[
            "extended LUA to support motion tracking",
        ]),
        new Skill("shell scripting", 1990, 90, "shell.jpg", vec<string>[
            "so many scripts",
        ]),
        new Skill("make", 1996, 90, "make.png", vec<string>[
            "use make's essentials to build sofware used to distribute media",
        ]),
        new Skill("hudson/jenkins", 2010, 90, "jenkins.png", vec<string> [
            "create build, package pipeline for Dell",
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
        new Skill("sql", 1990, 70, "sql.jpg", vec<string> [
            "Many years of sql experience",
            "Stored procedure and Triggers",
            "create SQR reports for SUNW sales",
            "Oracle, MySql, RDS",
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
            "Here is my persoal answer to linked in",
        ]),
    ];

    $ordered = sort_vec_skill($skill);

    return tuple($exp, $ordered);

}
