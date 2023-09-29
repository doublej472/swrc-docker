NOTE: This mod includes a System.ini file for convenience. However, using it will default the game's text language to English. If your game is in a different language, you can either not copy the ini file and start the game via CT.exe or edit the ini.
      Change the 'Language' entry under the 'Engine.Engine' section from int to the value for your language. It can be one of the following:
	  - German:   det
	  - French:   frt
	  - Spanish:  est
	  - Italian:  ita

Installation:
Copy all files to the Game's 'GameData\System' directory.
The location depends on where the game is installed. For steam it is "C:\Program Files(x86)\Steam\SteamApps\common\Star Wars Republic Commando\GameData\System"

This is a mod for Star Wars Republic Commando that fixes the infamous bumpmapping crash when loading a map or when looking at textures in the Unreal Editor.
It does not only fix the crash but also removes the visual artifacts on characters and other meshes that use bumpmaps. This also fixes the editor crash at startup or when scrolling through the texture browser.
Since no original game packages were modified multiplayer will still work just fine.

Additionally, the mod adds native resolution support as well as a fps limit option to deal with mouse sensitivity and an FOV slider.
The FOV slider allows setting the field of view in steps of 5 degrees. If you want finer control, you can use the 'set SWRCFix FOV' console command.
There also is another menu option called 'Weapon FOV Factor' which controls how much the FOV will affect the weapons since it can look rather strange if the FOV is very high.

The mod also restores the multiplayer server browser by providing a modified GameSpyMgr.dll with an alternative master server ip.

If the game is started via CT.exe it will automatically enable the fixes if Mod.dll is present. You can of course still use the original executable. Just make sure that 'RenderDevice' is set to
'Mod.ModRenderDevice' in System.ini. The only difference between CT.exe and the original exe is the automatic initialization of the fixes and the more accurate fps limiter. If you only care about the bumpmapping fix you don't need to use it and can just set the render device in the ini.
NOTE: CT.exe does not work with the amazon prime gaming version of the game due to DRM.

A custom ucc.exe is included as well since SWRC shipped without one. It works just like it does with other unreal games.

OpenGLDrv.dll is a custom OpenGL 4.5 renderer. It is still a work in progress but already usable. It is included for people who want to try it out. In order to use it you need to modify System.ini
and set 'RenderDevice' to 'OpenGLDrv.OpenGLRenderDevice'. Or alternatively when using CT.exe you can enter the 'userendev' console command to change it dynamically.
e.g. 'userendev opengl' and to switch back 'userendev mod' or 'userendev d3d'

The following UnrealEd issues were fixed as well:
 - Selecting an object is instant and doesn't take up to multiple seconds
 - Crash when placing a FluidSurfaceInfo
 - Crash when creating a new HardwareShader
 - Crash when editing properties (especially those of menu classes)

General note about ini files:
The game will create a copy of all ini files in the 'Save' directory with most values commented out. Any changes in there will override the default values from the ini files in 'System'.
If you change a value in one of the default ini files and don't see any effect ingame, you probably need to change the ini file in 'Save' as well. The intended usage is to treat the ini files in System as read-only and only modify the ones in Save.

###############################################################################################################################################################################################

Version 2.9
 - Added option to automatically adapt field of view based on the aspect ratio (set it to 'Auto' in game options which is the default)
 - Drastically reduced UnrealEd memory usage by preventing it from loading all textures at startup
 - Added the 'flushresources' console command to clear asset memory (mostly useful for UnrealEd in case it fills up after a while)
 - Improved OpenGL renderer performance for automatic shader reloading if the source files have changed on disk
 - Added config option for UCC to load specific objects or classes. This helps with 'Superclass not found' errors which can't always be fixed with `#exec OBJ LOAD ...` in the .uc file.
   In order to use it, create a section called 'UCC.Make' in `System.ini` and add values like this: `AutoLoad+=<class name>`

Version 2.8
 - Greatly improved accuracy of fps limiter (CT.exe)
 - CT.exe now automatically loads bumpmapping fix if System.ini still uses the D3D render device
 - OpenGL renderer mostly complete now (Can be used by setting `RenderDevice=OpenGLDrv.OpenGLRenderDevice` under the `Engine.Engine` section in System.ini or ingame with `userendev opengl` when using CT.exe)
 - Added a commandlet for UCC to export the game's bumpmaps as normal maps

Version 2.7
 - Updated GameSpyMgr.dll with new master server address (Restores server browser)
 - Minor improvements

Version 2.6
 - Added menu option to set a custom factor for the view shake (0.0 = no shake, 1.0 = vanilla)
 - OpenGL renderer improvements

Version 2.5
 - Small fixes and improvements
 - Added custom game executable (CT.exe)
 - Added experimental OpenGL renderer
 - Added UCC.exe

Version 2.4
 - Fixed crash when spawning in a multiplayer game
 - Improved accuracy of editor selection by making it possible to select stuff that is behind an object which has a texture with alpha channel

Version 2.3
 - Fixed slow performance when selecting stuff in the Editor (can be disabled using the "FIXSELECT" console command)

Version 2.2
 - Disabled FpsLimit option in Multiplayer as it has no effect there because the engine sets its own limit
 - Fixed Battle Droids using clone weapons in first mission
 - Fixed crash that could happen when leaving MP and starting a campaign map or vice versa
 - Fixed UnrealEd crash when placing a FluidSurfaceInfo
 - Fixed UnrealEd crash when editing object properties (mostly happened with menu classes)

Version 2.1
 - Fixed crash in UnrealEd when opening the StaticMesh browser
 - Added fps limit menu option. Limiting the fps can help with the menu mouse sensitivity and other fps bound problems like the extreme Helmet shaking. The limit can also be set using the `SetFpsLimit <number>` console command

made by Leon0628

swrc-modding.net
https://www.youtube.com/channel/UCD7BHhdtWyBQ8HNr6xg4OxQ
