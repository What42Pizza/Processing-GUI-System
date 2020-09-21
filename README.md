# Processing GUI System

# THIS IS A WORK IN PROGRESS.

<br />

Last updated 09/21/20

This is a set of classes you can use in Processing that allows you to easily create GUIs. This was designed in Processing 3.5.3, so you should be using at least that. It might work with earier versions, but I don't know.

The main file is GUISystem/GUISystem.pde, which shows how to use the classes. All other files in GUISystem will need to be copied into your own project in order to be used. Not all files have to be copied, though. If you only need some classes, then you can just copy the files for those classes, the files for their super classes, and GUI_Functions.pde (which always needs to be copied).


<br />
<br />


### Classes:

- GUI_Element
  - GUI_Frame
    - GUI_TextFrame


<br />
<br />


### GUI_Element:

This is the most basic class. It doesn't have any use.

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

- ArrayList <GUI_Element> Children
- GUI_Element Parent

<br />

Functions:

- void AddChild (GUI_Element NewChild)
- GUI_Element Child (String ChildName)
- GUI_Element Descendant (String DescendantName)
- boolean HasMouseHovering ()

<br />

Constructors:

- GUI_Element (String Name)
- GUI_Element (String Name, float XPos, float YPos)
- GUI_Element (String Name, float XPos, float YPos, float XSize, float YSize)
- GUI_Element (String Name, ArrayList <GUI_Element> Children)


<br />
<br />


### GUI_Frame:

GUI_Frame is the only usable class so far. It is used to create a frame in which you will place other GUI elements.

No new vars.

No new constructors.

<br />

Functions:

- void Render ()


<br />
<br />


### GUI_TextFrame

GUI_TextFrame is like a frame, but with text.

No new functions.

Vars:

- String Text (default "")
- color TextColor (default 0)
- float TextSize (default 1 (1/100 of width))

Constructors:

- GUI_TextFrame (String Name)
- GUI_TextFrame (String Name, String Text)
- GUI_TextFrame (String Name, float XPos, float YPos, String Text)
- GUI_TextFrame (String Name, float XPos, float YPos, float XSize, float YSize, String Text)
- GUI_TextFrame (String Name, ArrayList <GUI_Element> Children)
- GUI_TextFrame (String Name, ArrayList <GUI_Element> Children, String Text)