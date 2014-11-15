# Generated on 2014-09-15 using generator-bower 0.0.1
'use strict'

mountFolder = (connect, dir) ->
    connect.static require('path').resolve(dir)

module.exports = (grunt) ->
  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks)

  options =
    src: 'src/css'
    dist : 'dist/css'
  
  grunt.initConfig
    config: options
    
    coffee:
      compile:
        files:
          'dist/js/page.js':['src/js/page.coffee']

    stylus: 
      compile: 
        options:
          urlfunc: 'embedurl'
        
        files: 
          '<%=config.dist %>/hipsterbg.css': [
            '<%=config.src %>/index.styl'
          ],
          '<%=config.dist %>/base.css': [
            '<%=config.src %>/base.styl'
          ]

    jade:
        compile:
            options:
                client: false,
                pretty: true
            files: [ {
              cwd: './src/views',
              src: '**/*.jade',
              dest: 'dist/',
              expand: true,
              ext: '.html'
            } ]

    cssmin:
      add_banner:
        options:
          banner: '/* Hipsterbg */'
        files:
          '<%=config.dist %>/hipsterbg.min.css': ['<%=config.dist %>/hipsterbg.css']
    
    mochaTest:
      test: 
        options: 
          reporter: 'spec'
          compilers: 'coffee:coffee-script'
        src: ['test/**/*.coffee']
    
    connect: 
      server:
        options:
          port: 8000,
          base: './dist'
          livereload: true
    
    watch:
      options:
        livereload: true

      stylus:
        files:['<%=config.src %>/**/*.styl']
        tasks: 'stylus'

      jade:
        files:['src/views/**/*.jade']
        tasks: 'jade'

      coffee:
        files: ['src/js/**/*.coffee']
        tasks: 'coffee'

    grunt.registerTask 'default', [
      'jade'
      'coffee'
      'stylus'
      'cssmin'
      'connect'
      'watch'
    ]
    grunt.registerTask 'deploy', [
      'jade'
      'coffee'
      'stylus'
      'cssmin'
    ]