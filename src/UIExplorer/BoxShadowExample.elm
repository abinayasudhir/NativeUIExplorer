module UIExplorer.BoxShadowExample (..) where

import NativeUi exposing (NativeUi, node, Property, string, style)
import NativeUi.Elements exposing (..)
import NativeUi.Style exposing (..)
import NativeUi.Properties as NP exposing (..)


boxShadowView : List NativeUi
boxShadowView =
  [ string "Basic shadow"
  , view [ style (box ++ shadow1) ] []
  , string "Colored shadow"
  , view [ style (box ++ shadow2) ] []
  , string "Shaped shadow"
  , view [ style (box ++ shadow1 ++ [ borderRadius 50 ]) ] []
  , string "Image shadow"
  , image [ style (box ++ shadow1 ++ imageShadow), NP.source (Uri "./hawk.png") ] []
  , string "Child Shadow"
  , view
      [ style (box ++ shadow1 ++ [ backgroundColor "transparent" ]) ]
      [ view [ style (box ++ childShadow) ] [] ]
  ]


box : List Style
box =
  [ width 100
  , height 100
  , borderWidth 2
  ]


childShadow : List Style
childShadow =
  [ width 80
  , height 80
  , borderRadius 40
  , margin 8
  , backgroundColor "red"
  ]


imageShadow : List Style
imageShadow =
  [ borderWidth 0
  , overflow Visible
  ]


shadow1 : List Style
shadow1 =
  [ shadowOpacity 0.5
  , shadowRadius 3
  , shadowOffset 2 2
  ]


shadow2 : List Style
shadow2 =
  [ shadowOpacity 1.0
  , shadowColor "red"
  , shadowRadius 0
  , shadowOffset 3 3
  ]
