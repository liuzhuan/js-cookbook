<map version="freeplane 1.6.0">
<!--To view this file, download free mind mapping software Freeplane from http://freeplane.sourceforge.net -->
<node TEXT="TypeScript" FOLDED="false" ID="0j6t1vmlrbcegijmm0nbpr7fkh" CREATED="1505401972947" MODIFIED="1505401972947"><hook NAME="MapStyle">
    <properties edgeColorConfiguration="#808080ff,#ff0000ff,#0000ffff,#00ff00ff,#ff00ffff,#00ffffff,#7c0000ff,#00007cff,#007c00ff,#7c007cff,#007c7cff,#7c7c00ff" fit_to_viewport="false" show_note_icons="true"/>

<map_styles>
<stylenode LOCALIZED_TEXT="styles.root_node" STYLE="oval" UNIFORM_SHAPE="true" VGAP_QUANTITY="24.0 pt">
<font SIZE="24"/>
<stylenode LOCALIZED_TEXT="styles.predefined" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="default" ICON_SIZE="12.0 pt" COLOR="#000000" STYLE="fork">
<font NAME="SansSerif" SIZE="10" BOLD="false" ITALIC="false"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.details"/>
<stylenode LOCALIZED_TEXT="defaultstyle.attributes">
<font SIZE="9"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.note" COLOR="#000000" BACKGROUND_COLOR="#ffffff" TEXT_ALIGN="LEFT"/>
<stylenode LOCALIZED_TEXT="defaultstyle.floating">
<edge STYLE="hide_edge"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.user-defined" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="styles.topic" COLOR="#18898b" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subtopic" COLOR="#cc3300" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subsubtopic" COLOR="#669900">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.important">
<icon BUILTIN="yes"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.AutomaticLayout" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="AutomaticLayout.level.root" COLOR="#000000" STYLE="oval" SHAPE_HORIZONTAL_MARGIN="10.0 pt" SHAPE_VERTICAL_MARGIN="10.0 pt">
<font SIZE="18"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,1" COLOR="#0033ff">
<font SIZE="16"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,2" COLOR="#00b439">
<font SIZE="14"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,3" COLOR="#990000">
<font SIZE="12"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,4" COLOR="#111111">
<font SIZE="10"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,5"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,6"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,7"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,8"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,9"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,10"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,11"/>
</stylenode>
</stylenode>
</map_styles>
</hook>
<node TEXT="https://www.typescriptlang.org/" POSITION="right" ID="4apiutl9j4r5ikt62i5tll6mr6" CREATED="1505401972947" MODIFIED="1505401972948" LINK="https://www.typescriptlang.org/"/>
<node TEXT="gulp" POSITION="right" ID="6o88iim5m454fph2uv6o8m8a4f" CREATED="1505401972948" MODIFIED="1505401972948">
<node TEXT="https://www.typescriptlang.org/docs/handbook/gulp.html" ID="79votusroof30cidnnvth4tqba" CREATED="1505401972948" MODIFIED="1505401972948" LINK="https://www.typescriptlang.org/docs/handbook/gulp.html"/>
<node TEXT="project structure" ID="66ev25361n6n5fo3a0odped1tl" CREATED="1505401972948" MODIFIED="1505401972948">
<node TEXT="proj/&#xa;    +-- src/&#xa;    +-- dist/" ID="6dfnikal9cnhtd96tsk7krkt59" CREATED="1505401972948" MODIFIED="1505401972948"/>
</node>
<node TEXT="install dependencies" ID="6vrrpt10bnucav3bvbpg5qgi17" CREATED="1505401972948" MODIFIED="1505401972948">
<node TEXT="npm install -g gulp-cli" ID="4sdtjbabljd5h3obds4e22iot2" CREATED="1505401972948" MODIFIED="1505401972948"/>
<node TEXT="npm install --save-dev typescript gulp gulp-typescript" ID="6gudice4e4upf87qduj9jo8te1" CREATED="1505401972948" MODIFIED="1505401972948"/>
</node>
<node TEXT="create file" ID="1cj9s8679tuge4esmus9q0q261" CREATED="1505401972948" MODIFIED="1505401972948">
<node TEXT="src/main.ts" ID="1ovsdnqrep4m3tbigd1qcgu5p3" CREATED="1505401972948" MODIFIED="1505402563452"><richcontent TYPE="NOTE">

<html>
  <head>
    
  </head>
  <body>
    <p align="left">
      function hello(compiler: string) {
    </p>
    <p align="left">
      &#160;&#160;&#160;&#160;console.log(`Hello from ${compiler}`);
    </p>
    <p align="left">
      }
    </p>
    <p align="left">
      
    </p>
    <p align="left">
      hello(&quot;TypeScript&quot;);
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="tsconfig.json" ID="48td9haphgin5p6tus9qthdecc" CREATED="1505401972948" MODIFIED="1505401972948"><richcontent TYPE="NOTE">

<html><head/><body><p align="left">{
    "files": [
        "src/main.ts"
    ],
    "compilerOptions": {
        "noImplicitAny": true,
        "target": "es5"
    }
}</p></body></html>
</richcontent>
<node TEXT="files[]" ID="3epjnj9t797apor9a372g8c9oh" CREATED="1505401972949" MODIFIED="1505401972949"/>
<node TEXT="compilerOptions" ID="5ote67j2utgvba190ob9ang4gb" CREATED="1505401972949" MODIFIED="1505401972949">
<node TEXT="noImplictAny" ID="6i88m1tljd1edflpldo4np9ns3" CREATED="1505401972949" MODIFIED="1505401972949"/>
<node TEXT="target" ID="2ktnfk12isfgd44a70psati2j0" CREATED="1505401972949" MODIFIED="1505401972949"/>
</node>
</node>
<node TEXT="gulpfile.js" ID="1d85cic7086aepmqnfjuqq5619" CREATED="1505401972949" MODIFIED="1505401972949"><richcontent TYPE="NOTE">

<html><head/><body><p align="left">var gulp = require("gulp");
var ts = require("gulp-typescript");
var tsProject = ts.createProject("tsconfig.json");

gulp.task("default", function () {
    return tsProject.src()
        .pipe(tsProject())
        .js.pipe(gulp.dest("dist"));
});</p></body></html>
</richcontent>
</node>
</node>
<node TEXT="add modules" ID="6vj1nml09r8jmu1s804p5foumi" CREATED="1505401972949" MODIFIED="1505401972949">
<node TEXT="src/greet.ts" ID="7ppjsusrfg4qdr6sgnqdvhujtg" CREATED="1505401972949" MODIFIED="1505401972949">
<node TEXT="export function sayHello(name: string) {&#xa;    return `Hello from ${name}`;&#xa;}" ID="0h9i54o56ps16mq8vkncmlsqg9" CREATED="1505401972949" MODIFIED="1505401972949"/>
</node>
<node TEXT="change src/main.ts" ID="2kmioht9jbnt9f30okoiq1b3oc" CREATED="1505401972949" MODIFIED="1505401972949">
<node TEXT="import { sayHello } from &quot;./greet&quot;;&#xa;&#xa;console.log(sayHello(&quot;TypeScript&quot;));" ID="3snj5flq0svmlov87mp82mcsq4" CREATED="1505401972949" MODIFIED="1505401972949"/>
</node>
<node TEXT="add greet.ts to tsconfig.json" ID="1hfltu7g9hga1t98acil8aqtbg" CREATED="1505401972949" MODIFIED="1505401972949"/>
</node>
<node TEXT="browserify" ID="0m9v4othv215ehljgt3hbq6chj" CREATED="1505401972949" MODIFIED="1505401972949">
<node TEXT="dependencies" ID="6inklg04h2vlpiqrf2bqcfqftv" CREATED="1505401972949" MODIFIED="1505401972949">
<node TEXT="browserify" ID="3uojmqmj71lfpq3vatn87vnhau" CREATED="1505401972949" MODIFIED="1505401972949"/>
<node TEXT="tsify" ID="4th57nb52getbu3kqcg6thfi3g" CREATED="1505401972949" MODIFIED="1505401972949"><richcontent TYPE="NOTE">

<html><head/><body><p align="left">tsify is a Browserify plugin that, like gulp-typescript, gives access to the TypeScript compiler</p></body></html>
</richcontent>
</node>
<node TEXT="vinyl-source-stream" ID="29cppsr9d74p38g5j465dv8hjc" CREATED="1505401972949" MODIFIED="1505401972949"><richcontent TYPE="NOTE">

<html><head/><body><p align="left">vinyl-source-stream lets us adapt the file output of Browserify back into a format that gulp understands called vinyl.</p></body></html>
</richcontent>
</node>
<node TEXT="npm install --save-dev browserify tsify vinyl-source-stream" ID="5flirhudutbjjuvar4c5s7ccks" CREATED="1505401972949" MODIFIED="1505401972949"/>
</node>
<node TEXT="create page" FOLDED="true" ID="5ts50lp9fgkt00drfm6uk683uh" CREATED="1505401972949" MODIFIED="1505401972949">
<node TEXT="src/index.html" FOLDED="true" ID="0pbqbmpjt913q6ec8e4080790p" CREATED="1505401972949" MODIFIED="1505401972949">
<node TEXT="&lt;p id=&quot;greeting&quot;&gt;Loading ...&lt;/p&gt;&#xa;&lt;script src=&quot;bundle.js&quot;&gt;&lt;/script&gt;" ID="2v5a1of51ivknf0d7gbj3u21us" CREATED="1505401972949" MODIFIED="1505401972949"/>
</node>
</node>
<node TEXT="update main.ts" ID="2kh9lamgfjbcvah27g2cl78cqn" CREATED="1505401972949" MODIFIED="1505401972949"><richcontent TYPE="NOTE">

<html><head/><body><p align="left">import { sayHello } from "./greet";

function showHello(divName: string, name: string) {
    const elt = document.getElementById(divName);
    elt.innerText = sayHello(name);
}

showHello("greeting", "TypeScript");</p></body></html>
</richcontent>
</node>
<node TEXT="update gulpfile.js" ID="1tdgdmq523hd2spel901br51p0" CREATED="1505401972950" MODIFIED="1505401972950"><richcontent TYPE="NOTE">

<html><head/><body><p align="left">var gulp = require("gulp");
var browserify = require("browserify");
var source = require('vinyl-source-stream');
var tsify = require("tsify");
var paths = {
    pages: ['src/*.html']
};

gulp.task("copy-html", function () {
    return gulp.src(paths.pages)
        .pipe(gulp.dest("dist"));
});

gulp.task("default", ["copy-html"], function () {
    return browserify({
        basedir: '.',
        debug: true,
        entries: ['src/main.ts'],
        cache: {},
        packageCache: {}
    })
    .plugin(tsify)
    .bundle()
    .pipe(source('bundle.js'))
    .pipe(gulp.dest("dist"));
});</p></body></html>
</richcontent>
</node>
</node>
</node>
</node>
</map>
