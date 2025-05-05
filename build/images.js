const imgPath = 'img/**/*.+(png|jpg|gif|svg)';
const destPath = '_site/img';

module.exports = gulp => {
  gulp.task('images', async () => {
    const imagemin = (await import('gulp-imagemin')).default;
    return gulp
      .src(imgPath)
      .pipe(imagemin())
      .pipe(gulp.dest(destPath));
  });
};
