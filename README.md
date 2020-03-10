# odo-godot-integration

This repo contains instructions, scripts and examples needed to integrate ODO and Godot together. One important note - as of this time Godot v3+ only works on ODO and Android whereas Godot v2+ works cross platform (ODO + iOS or Android).

## Integrating Into an Existing Project

1. Create a scene in Godot called "bootscene"
2. Attach a new script and copy over the contents of the bootscene.gd script
3. You'll need some other scene to be your actual game we've called this scene "mainscene.tscn". In the [\_process](https://github.com/storyforj/odo-godot-integration/blob/master/bootscene.gd#L13) function of bootscene.gd make sure to specify the correct scene to switch to once a "player has started"
4. In the top right corner switch over to "GLES2" instead of "GLES3"
5. Download the (ODO Godot HTML Template)[https://raw.githubusercontent.com/storyforj/odo-godot-integration/master/odo-godot-template.html] into your project folder.
6. Under Project > Export, add the preset for HTML5. Under the setting "Custom HTML Shell" select the ODO Godot HTML Template. Lastly, select "For Mobile" and "For Desktop" under Vram Texture Compression
7. In Project > Project Settings > Rendering > Vram Compression select "Import Etc"

That's it!

**Running**: Now you can click the "5" icon in the top right hand of the window to launch the game in a browser.

## Saving/Loading Data

For an example of how to save and load data. Take a look at our ["saving/loading.gd"](https://github.com/storyforj/odo-godot-integration/blob/master/saving_loading.gd) script example.

## Handling Replays

The ["mainscene.gd"](https://github.com/storyforj/odo-godot-integration/blob/master/mainscene.gd) file shows can pretty much be copied added as a "script node" for your main scene. It effectively waits for a "restart" event to be fired, and uses a "SHIFT + R" key press as an example "finish" event trigger.
