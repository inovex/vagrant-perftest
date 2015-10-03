module.exports = function(grunt) {
  grunt.loadNpmTasks('grunt-contrib-watch');

  // Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),

    watch: {
      build: {
        files: ['src/**/*.coffee', 'src/**/*.hbs', 'src/**/*.html', 'Gruntfile.js'],
        tasks: ['logmillisecs'],
        options: {
        },
      }
    }
  });

  grunt.registerTask('logmillisecs', function() {
    millis = (new Date).getTime();
    left  = millis.toString().substring(0,millis.toString().length - 3)
    right = millis.toString().substring(millis.toString().length - 3, millis.toString().length)
    whole = left + "." + right
    grunt.log.write(whole + "\n");
  });

  grunt.registerTask('w', ['watch:build']);
};
