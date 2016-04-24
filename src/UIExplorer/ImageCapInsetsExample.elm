module UIExplorer.ImageCapInsetsExample (..) where

import NativeUi exposing (NativeUi, node, Property, string, style)
import NativeUi.Elements exposing (..)
import NativeUi.Style exposing (..)
import NativeUi.Properties as NP exposing (..)


mainView : NativeUi
mainView =
  imageCapInsetsExample


imageCapInsetsExample : NativeUi
imageCapInsetsExample =
  view
    []
    [ view
        [ style backgroundStyle ]
        [ text [] [ string "capInsets: none" ]
        , image [ NP.source (Uri ""), style storyBackground, capInsets 0 0 0 0 ] []
        ]
    , view
        [ style (backgroundStyle ++ [ paddingTop 10 ]) ]
        [ text [] [ string "capInsets: 15" ]
        , image [ NP.source (Uri ""), style storyBackground, capInsets 15 15 15 15 ] []
        ]
    ]



-- TODO
-- imageResizeMode is not working -- resizeMode={Image.resizeMode.stretch}


backgroundStyle : List Style
backgroundStyle =
  [ backgroundColor "#F6F6F6"
  , justifyContent Center
  , alignItems AlignCenter
  ]


horizontal : List Style
horizontal =
  [ flexDirection Row
  ]


storyBackground : List Style
storyBackground =
  [ width 250
  , height 150
  , borderWidth 1
  ]


textStyle : List Style
textStyle =
  [ fontSize 13.5
  ]
