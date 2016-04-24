module UIExplorer.AssetScaledImageExample (..) where

import NativeUi exposing (NativeUi, node, Property, string, style)
import NativeUi.Elements exposing (..)
import NativeUi.Style exposing (..)
import NativeUi.Properties as NP exposing (..)


mainView : NativeUi
mainView =
  assetScaledImageExample


assetScaledImageExample : NativeUi
assetScaledImageExample =
  scrollView
    []
    [ view [ style rowStyle ] [ image [ style imageWide, NP.source (Uri "") ] [] ]
    , view
        [ style rowStyle ]
        [ image [ style imageThumb, NP.source (Uri "") ] []
        , image [ style imageThumb, NP.source (Uri "") ] []
        , image [ style imageThumb, NP.source (Uri "") ] []
        ]
    , view
        [ style rowStyle ]
        [ image [ style imageT1, NP.source (Uri "") ] []
        , image [ style imageT2, NP.source (Uri "") ] []
        ]
    ]


rowStyle : List Style
rowStyle =
  [ padding 5
  , flex 1
  , flexDirection Row
  , alignSelf AlignCenter
  ]


textColumnStyle : List Style
textColumnStyle =
  [ flex 1
  , flexDirection Column
  ]


imageWide : List Style
imageWide =
  [ borderWidth 1
  , borderColor "black"
  , width 320
  , height 240
  , margin 5
  ]


imageThumb : List Style
imageThumb =
  [ borderWidth 1
  , borderColor "black"
  , width 100
  , height 100
  , margin 5
  ]


imageT1 : List Style
imageT1 =
  [ borderWidth 1
  , borderColor "black"
  , width 212
  , height 320
  , margin 5
  ]


imageT2 : List Style
imageT2 =
  [ borderWidth 1
  , borderColor "black"
  , width 100
  , height 320
  , margin 5
  ]
