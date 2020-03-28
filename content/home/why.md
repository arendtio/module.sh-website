Why should you want to use module.sh?

Module.sh lets you create shell scripts in a modular way while
keeping the code clean and POSIX compliant.

**Modular** means that every module has its own scope and can 
be reused. So if your script keeps growing over time, you can easily
move some function to a seperate module and if you want to use those
same function in another script in the future you will have them
accessable.

Futhermore, creating modules makes function testable and you can
make sure your functions do what you want them to do. And the test
suite that comes with module.sh make it possible to write those test
in a vrey portable way. We did so because it makes it easier for us
to make sure our scripts run on different platforms. That way we can
start a Live-CD and simply enter our command to run the test suite
and it works on wide variety of operating systems.
