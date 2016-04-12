module UIExplorer.UIExplorerTitle (..) where

import NativeUi exposing (NativeUi, node, Property, string, style)
import NativeUi.Elements exposing (..)
import NativeUi.Style exposing (..)


uIExplorerTitle : String -> NativeUi
uIExplorerTitle title =
  view
    [ style containerStyle ]
    [ text
        [ style textStyle ]
        [ string title ]
    ]


textStyle : List Style
textStyle =
  [ fontSize 19
  , fontWeight FontWeight900
  ]


containerStyle : List Style
containerStyle =
  [ borderRadius 4
  , borderWidth 0.5
  , borderColor "#d6d7da"
  , margin 10
  , marginBottom 0
  , height 45
  , padding 10
  , backgroundColor "white"
  ]
