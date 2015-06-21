var gulp = require("gulp"),
  webpack = require("gulp-webpack"),
  jade = require("gulp-jade");

var jadeSrc = "src/jade/*.jade",
  jsxSrc = "src/jsx/*.cjsx";

gulp.task("webpack", function() {
  gulp.src("src/js/main.js")
    .pipe(webpack({
      output: {
        filename: "main.js"
      }
    }))
    .pipe(gulp.dest("./www"));
});

gulp.task("jade", function() {
  gulp.src([jadeSrc])
    .pipe(jade({
      pretty: true
    }))
    .pipe(gulp.dest("./www"));
});

gulp.task("watch", function() {
  gulp.watch([jsxSrc, "src/coffee/*.coffee"], ["webpack"]);
  gulp.watch(jadeSrc, ["jade"]);
});

gulp.task("default", ["webpack", "jade"]);