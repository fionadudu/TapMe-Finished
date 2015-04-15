# TapMe-Finished

这是Tap Me的终结版。主要加了音乐和背景。
以及Auto Layout.用update frames时，可以先删除之前的限制，回归原来背景图片的实际大小。

### 这是添加音乐的part.
The sound playback will be handled from the view controller code, so open up ViewController.swift. Near the top of your file, you’ll notice this line
import UIKit
You will also need to use an import statement for the AVFoundation framework, which is the Apple framework responsible for playing sound and video. Add the following statement immediately following the previous import statement mentioned.
import AVFoundation
Just as importing UIKit lets you use things like UIButton and UILabel, importing AVFoundation lets you use the very useful AVAudioPlayer class. Next, you’ll need an instance variable for each of the three sounds. Add a line for each instance variable just after the declaration of other instance variables inside the class body.

> var buttonBeep = AVAudioPlayer()

> var secondBeep = AVAudioPlayer()
  
> var backgroundMusic = AVAudioPlayer()
  
* Next, you will need to add this helper method above the viewDidLoad method.

> func setupAudioPlayerWithFile(file:NSString, type:NSString) -> AVAudioPlayer  {

> //1

> var path = NSBundle.mainBundle().pathForResource(file, ofType:type)
  
> var url = NSURL.fileURLWithPath(path!)
 
> //2

> var error: NSError?
 
>//3

> var audioPlayer:AVAudioPlayer?
  
> audioPlayer = AVAudioPlayer(contentsOfURL: url, error: &error)
 
>//4

>return audioPlayer!

> }

* This method will return an AVAudioPlayer object (declared by the ->), and takes two arguments: a file name and type. Let’s look at what it does by section.
You need to know the full path to the sound file, and NSBundle.mainBundle() will tell you where in the project to look. AVAudioPlayer needs to know the path in the form of a URL, so the full path is converted to URL format.
A NSError object will store an error message if something goes wrong when setting up the AVAudioPlayer. Usually nothing will go wrong, but it’s always good practice to check for errors, just in case!
This is the important call to set up AVAudioPlayer. You’re passing in the URL, and the error will get filled in if something goes wrong
If all goes well, the AVAudioPlayer object will be returned!

Now that you have a handy method that will set up AVAudioPlayer objects, it’s time to use it! Add this code to the viewDidLoad() method, at the top of the method before setupGame():

> buttonBeep = self.setupAudioPlayerWithFile("ButtonTap", type:"wav")

> secondBeep = self.setupAudioPlayerWithFile("SecondBeep", type:"wav")

> backgroundMusic = self.setupAudioPlayerWithFile("HallOfTheMountainKing", type:"mp3")

* At this point in viewDidLoad, you’ll have all three sounds ready to be called in your code!

* The first sound, buttonBeep, should play when the button is pressed. Update the buttonPressed method to play the sound by adding this line at the end of its method body:

> buttonBeep.play()

* There are two other sounds to add. The secondBeep sound should be played every second when the timer ticks down. Add the call to play that sound in subtractTime() method by adding this line right before the if statement.

> secondBeep.play()

You’re almost done!

* The final step is to add the background music. To play the music every time a new game is started, add the play code to the setupGame() method. Add these lines to the very bottom of the method body:

> backgroundMusic.volume = 0.3

> backgroundMusic.play()

You can adjust the volume of the background music so the beeps can still be heard. Changing the volume attribute of the backgroundMusic is a good way to do this. It can be set from 0 (off) to 1.0 (full volume), but 0.3 is a good starting point.
