--repeated vars
local Width = 256
local Height = 384 --MUST BE AN INTEGER WHEN DIVIDED BY 2 - untested!

return {
    --details--
    GameTitle = "eCrew Development Program",
    Identity = "openecdp",
    Version = {
        Major = 0,
        Minor = 1,
        Patch = 0,
        Label = nil,
        Candidate = 0
    },
    --window options--
    Width = Width,
    Height = Height,
    WindowFlags = {
        fullscreen = false,
        fullscreentype = "desktop",
        vsync = 1,
        msaa = 0,
        stencil = true,
        depth = 0,
        resizable = false,
        borderless = false,
        centered = true,
        display = 1,
        minwidth = 0,
        minheight = 0
    },
    --scenes--
    SceneDefault = 1, --what scene should be active by default?
    SceneTitle = 1,
    SceneCount = 1, --special enum that should be incremented based on the amount of scenes
    --orientations--
    OriDefault = 1, --which orientation should be default?
    OriVertical = 1,
    OriHorizontal = 2,
    OriVerticalInverted = 3,
    OriHorizontalInverted = 4,
    OriCount = 4, --special enum, ditto
    --love potion scaling--
    Scale3DSDefault = 3,
    Scale3DSOriginal = 1,
    Scale3DSStretched = 2,
    Scale3DSAspect = 3,
    Scale3DSHighDefinition = 4,
    Scale3DSCount = 4
}
