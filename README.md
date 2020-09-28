# Processing GUI System

# THIS IS A WORK IN PROGRESS.

<br />

This is a set of classes you can use in Processing that allows you to easily create GUIs. This was designed in Processing 3.5.3, so you should be using at least that. It might work with earier versions, but I don't know.

The main file is GUISystem/GUISystem.pde, which shows how to use the classes. All other files in GUISystem will need to be copied into your own project in order to be used. Not all files have to be copied, though. If you only need some classes, then you can just copy the files for those classes, the files for their super classes, and GUI_Functions.pde (which always needs to be copied).

### YOU NEED TO HAVE "GUI_Functions GUI_Functions = new GUI_Functions();" AT THE START OF YOUR PROGRAM FOR THIS TO WORK!



<br />
<br />



### Classes:

- GUI_Frame
  - GUI_TextFrame
  - GUI_Button
    - GUI_TextButton
    - GUI_ImageButton



<br />
<br />



### GUI_Frame:

This is the most basic class. You pretty much just place other GUI elements into this.

<br />

Vars:

- String Name

- float XPos (0 - 1) (default 0.25)
- float YPos (0 - 1) (default 0.25)
- float XSize (0 - 1) (default 0.5)
- float YSize (0 - 1) (default 0.5)

- color BackgroundColor (default 127)
- color EdgeColor (default 0)
- int EdgeSize (default 1)

- boolean Draggable (default false)
- boolean Visible (default true) (sets whether this frame is visible)
- boolean Enabled (default true) (sets whether this frame and all children are visible)

- ArrayList <GUI_Frame> Children
- GUI_Frame Parent

<br />

Functions:

- void Render ()
- void AddChild (GUI_Frame NewChild)
- GUI_Frame Child (String ChildName)
- GUI_Frame Descendant (String DescendantName)
- boolean HasMouseHovering ()

<br />

Constructors:

- GUI_Frame (String Name)
- GUI_Frame (String Name, float XPos, float YPos)
- GUI_Frame (String Name, float XPos, float YPos, float XSize, float YSize)
- GUI_Frame (String Name, ArrayList <GUI_Frame> Children)
- GUI_Frame (String[] Settings)
- GUI_Frame (String[] Settings, GUI_Frame[] Children)



<br />
<br />



### GUI_TextFrame

GUI_TextFrame is like a frame, but with text.

<br />

Vars:

- String Text (default "")
- color TextColor (default 0)
- float TextSize (default 1 (1/100 of width))

- int TextAlignX (-1 = LEFT, 0 = CENTER, 1 = RIGHT; default = 0)
- int TextAlignY (-1 = TOP, 0 = CENTER, 1 = BOTTM; default = 0)

<br />

No new functions.

<br />

Constructors:

- GUI_TextFrame (String Name)
- GUI_TextFrame (String Name, String Text)
- GUI_TextFrame (String Name, float XPos, float YPos, String Text)
- GUI_TextFrame (String Name, float XPos, float YPos, float XSize, float YSize, String Text)
- GUI_TextFrame (String Name, ArrayList <GUI_Frame> Children)
- GUI_TextFrame (String Name, ArrayList <GUI_Frame> Children, String Text)
- GUI_TextFrame (String[] Settings)
- GUI_TextFrame (String[] Settings, GUI_Frame[] Children)



<br />
<br />



### GUI_Button

GUI_Button is the most basic button. You should prabably use GUI_TextButton instead of this.

Vars:

- boolean UsePressedColor (default true)
- color PressedBackgroundColor (default: 63)
- float XMove (default: 0)
- float YMove (default: 1)
- boolean Pressed (read only)

<br />

Functions:

- boolean JustClicked()

<br />

Constructors:

- GUI_Frame (String Name)
- GUI_Frame (String Name, float XPos, float YPos)
- GUI_Frame (String Name, float XPos, float YPos, float XSize, float YSize)
- GUI_Frame (String Name, ArrayList <GUI_Frame> Children)
- GUI_Frame (String[] Settings)
- GUI_Frame (String[] Settings, GUI_Frame[] Children)



<br />
<br />



### GUI_TextButton

GUI_TextButton is like a button, but with text.

<br />

Vars:

- String Text (default "")
- color TextColor (default 0)
- float TextSize (default 1 (1/100 of width))

- int TextAlignX (-1 = LEFT, 0 = CENTER, 1 = RIGHT; default = 0)
- int TextAlignY (-1 = TOP, 0 = CENTER, 1 = BOTTM; default = 0)

<br />

No new functions.

<br />

Constructors:

- GUI_TextButton (String Name)
- GUI_TextButton (String Name, String Text)
- GUI_TextButton (String Name, float XPos, float YPos, String Text)
- GUI_TextButton (String Name, float XPos, float YPos, float XSize, float YSize, String Text)
- GUI_TextButton (String Name, ArrayList <GUI_Frame> Children)
- GUI_TextButton (String Name, ArrayList <GUI_Frame> Children, String Text)
- GUI_TextButton (String[] Settings)
- GUI_TextButton (String[] Settings, GUI_Frame[] Children)



<br />
<br />



### GUI_ImageButton

GUI_ImageButton is like a button, but with an image.

<br />

Vars:

- PImage Image (default: null)
- boolean RenderFrame (default: true)

<br />

No new functions.

<br />

Constructors:

- GUI_Frame (String Name)
- GUI_Frame (String Name, PImage Image)
- GUI_Frame (String Name, float XPos, float YPos, PImage Image)
- GUI_Frame (String Name, float XPos, float YPos, float XSize, float YSize, PImage Image)
- GUI_Frame (String Name, ArrayList <GUI_Frame> Children)
- GUI_Frame (String Name, ArrayList <GUI_Frame> Children, PImage Image)
- GUI_Frame (String[] Settings)
- GUI_Frame (String[] Settings, GUI_Frame[] Children)



<br />
<br />



### GUI_ImageFrame

GUI_ImageFrame is like a frame, but with an image.

<br />

Vars:

- PImage Image (default: null)
- boolean RenderFrame (default: true)

<br />

No new functions.

<br />

Constructors:

- GUI_Frame (String Name)
- GUI_Frame (String Name, PImage Image)
- GUI_Frame (String Name, float XPos, float YPos, PImage Image)
- GUI_Frame (String Name, float XPos, float YPos, float XSize, float YSize, PImage Image)
- GUI_Frame (String Name, ArrayList <GUI_Frame> Children)
- GUI_Frame (String Name, ArrayList <GUI_Frame> Children, PImage Image)
- GUI_Frame (String[] Settings)
- GUI_Frame (String[] Settings, GUI_Frame[] Children)





<br />

Last updated 09/28/20
