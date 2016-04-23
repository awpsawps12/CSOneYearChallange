var gulp = require('gulp');
var imageResize = require('gulp-image-resize');

gulp.task('default', function() {
  gulp.src('./_images/*.{jpg,png,gif}')
  .pipe(imageResize({
    width: 740,
    upscale: false
  }))
  .pipe(gulp.dest('./images'));
});
