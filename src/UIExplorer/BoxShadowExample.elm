module UIExplorer.BoxShadowExample (..) where

import NativeUi exposing (NativeUi, node, Property, string, style)
import NativeUi.Elements exposing (..)
import NativeUi.Style exposing (..)
import NativeUi.Properties as NP exposing (..)


type Platform
  = All
  | Ios
  | Android


type alias Example =
  { title : String
  , description : String
  , elements : List NativeUi
  , platform : Platform
  }


example : Example
example =
  { title = ""
  , description = ""
  , elements = []
  , platform = All
  }


boxShadowView : List Example
boxShadowView =
  [ { example
      | title = "Basic shadow"
      , description = "shadowOpacity: 0.5, shadowOffset: {2, 2}"
      , elements =
          [ view [ style (box ++ shadow1) ] [] ]
    }
  , { example
      | title = "Colored shadow"
      , description = "shadowColor: 'red', shadowRadius: 0"
      , elements =
          [ view [ style (box ++ shadow2) ] [] ]
    }
  , { example
      | title = "Shaped shadow"
      , description = "borderRadius: 50"
      , elements =
          [ view [ style (box ++ shadow1 ++ [ borderRadius 50 ]) ] [] ]
    }
  , { example
      | title = "Image shadow"
      , description = "Image shadows are derived exactly from the pixels."
      , elements =
          [ image [ style (box ++ shadow1 ++ imageShadow), NP.source (Uri "./hawk.png") ] [] ]
    }
  , { example
      | title = "Child Shadow"
      , description = "For views without an opaque background color, shadow will be derived from the subviews."
      , elements =
          [ view
              [ style (box ++ shadow1 ++ [ backgroundColor "transparent" ]) ]
              [ view [ style (box ++ childShadow) ] [] ]
          ]
    }
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
