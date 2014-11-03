html5-scaffolding
=================

This is a very simple scaffolding project for html5 projects. While there are various scaffolding tools out there that do a great job (like yeoman, etc.) they don't actually produce scaffolds that we find suitable. So we created our own sample project that can be used as a template when developing html5 applications.

Use it
===
No git, npm, grunt, yo, whatever needed, simply do

```sh
wget https://raw.githubusercontent.com/cismet/html5-scaffolding/v0.1.3/installer.sh && \
chmod u+x installer.sh && \
./installer.sh && \
npm install && \
grunt run
```

Currently, Windows users will have to install manually which basically means downloading the content of the example folder of the repo and editing the relevant files, like <code>bower.json</code>, etc. Additionally, the actual build has not been tested on Windows so far...

Project properties
===
The scaffolded project uses:
* <code>npm</code> to pull in devDependencies used during build, mainly grunt modules
* <code>grunt</code> to actually build the project
* <code>bower</code> to pull in dependencies
* <code>karma/jasmine</code> to test the project during build
 
Coming from a Java world where we use maven based projects nearly all of the time the build process realised in this project aims at recreating some of the properties of maven, mainly a static lifecycle.

## Dist lifecycle (default)
* _validate_: first we check if the project is nicely configured
* _generateSources_: we auto-generate new sources and process existing ones, depends on _validate_
* _test_: runs the unit tests, depends on _generateSources_
* _build_: builds the actual runnable page, depends on _test_
* _package_: builds the actual minified version of the page, depends on _build_
* _dist_: creates distributions, depends on _package_

## Run lifecycle
* _run_: runs the application (alias _serve_), depends on _build_

## Clean lifecycle
* _clean_: cleans working files, depends on _validate_

## Configure
Basically you won't have to configure anything as long as you stick to the [rules](https://github.com/cismet/html5-scaffolding/wiki/cismet-HTML5-projects:-rules-and-recommendations). However:

* If you use directives with templates you will have to provide the name of your directives module in the <code>Gruntfile</code> that the processed templates (they are put in the <code>$templateCache</code>) shall be attached to. A variable is available right at the beginning of the <code>Gruntfile</code> so you won't have to search for the appropriate place
* If you have any special files that shall be included in the minified version of the application (and thus any phase that builds on top of the package task) you may use the <code>customCopy</code> variable to actually configure a copy target of the <code>grunt-contrib-copy</code> plugin.
* If you need any other task for special processing during build please use the appropriate lifecycle task to register with. That way you can be sure that every process in done correctly and you work with proper files.

Future
===
Maybe some time we will produce a more advanced "installer", e.g. a yeoman generator, etc. However, for now the simple "installer.sh" script does what we need. If we figure that we need more flexible "generators" because we want to actually have options this is going to change.
