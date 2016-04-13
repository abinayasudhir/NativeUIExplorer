module UIExplorer.BorderExample (..) where

import NativeUi.Style exposing (..)
import NativeUi exposing (NativeUi, node, Property, string, style)
import NativeUi.Elements exposing (..)


borderView : List NativeUi
borderView =
  [ string "Equal-Width / Same-Color"
  , view [ style (box ++ border1) ] []
  , string "Equal-Width / Same-Color"
  , view [ style (box ++ borderRadiusStyle) ] []
  , string "Equal-Width Borders"
  , view [ style (box ++ border2) ] []
  , string "Same-Color Borders"
  , view [ style (box ++ border3) ] []
  , string "Custom Borders"
  , view [ style (box ++ border4) ] []
  , string "Custom Borders"
  , view [ style (box ++ border5) ] []
  , string "Custom Borders"
  , view [ style (box ++ border6) ] []
  , string "Custom Borders"
  , view [ style (box ++ border7) ] [ view [ style border7_inner ] [] ]
  , string "Single Borders"
  , singleBorder
  , string "Corner Radii"
  , view [ style (box ++ border9) ] []
  , string "Corner Radii / Elevation"
  , view [ style (box ++ border10) ] []
  , string "CSS Trick - Triangle"
  , view [ style border11 ] []
  ]


singleBorder : NativeUi
singleBorder =
  view
    [ style [ flexDirection Row ] ]
    [ view [ style (box ++ border8 ++ [ borderTopWidth 5 ]) ] []
    , view [ style (box ++ border8 ++ [ borderLeftWidth 5 ]) ] []
    , view [ style (box ++ border8 ++ [ borderBottomWidth 5 ]) ] []
    , view [ style (box ++ border8 ++ [ borderRightWidth 5 ]) ] []
    ]


box : List Style
box =
  [ width 100
  , height 100
  ]


border1 : List Style
border1 =
  [ borderWidth 10
  , borderColor "brown"
  ]


borderRadiusStyle : List Style
borderRadiusStyle =
  [ borderWidth 10
  , borderRadius 10
  , borderColor "cyan"
  ]


border2 : List Style
border2 =
  [ borderWidth 10
  , borderTopColor "red"
  , borderRightColor "yellow"
  , borderBottomColor "green"
  , borderLeftColor "blue"
  ]


border3 : List Style
border3 =
  [ borderColor "purple"
  , borderTopWidth 10
  , borderRightWidth 20
  , borderBottomWidth 30
  , borderLeftWidth 40
  ]


border4 : List Style
border4 =
  [ borderTopWidth 10
  , borderTopColor "red"
  , borderRightWidth 20
  , borderRightColor "yellow"
  , borderBottomWidth 30
  , borderBottomColor "green"
  , borderLeftWidth 40
  , borderLeftColor "blue"
  ]


border5 : List Style
border5 =
  [ borderRadius 50
  , borderTopWidth 10
  , borderTopColor "red"
  , borderRightWidth 20
  , borderRightColor "yellow"
  , borderBottomWidth 30
  , borderBottomColor "green"
  , borderLeftWidth 40
  , borderLeftColor "blue"
  ]


border6 : List Style
border6 =
  [ borderTopWidth 10
  , borderTopColor "red"
  , borderRightWidth 20
  , borderRightColor "yellow"
  , borderBottomWidth 30
  , borderBottomColor "green"
  , borderLeftWidth 40
  , borderLeftColor "blue"
  , borderTopLeftRadius 100
  ]


border7 : List Style
border7 =
  [ borderWidth 10
  , borderColor "#f007"
  , borderRadius 30
  , overflow Hidden
  ]


border7_inner : List Style
border7_inner =
  [ backgroundColor "blue"
  , width 100
  , height 100
  ]


border8 : List Style
border8 =
  [ width 60
  , height 60
  , borderColor "black"
  , marginRight 10
  , backgroundColor "lightgrey"
  ]


border9 : List Style
border9 =
  [ borderWidth 10
  , borderTopLeftRadius 10
  , borderBottomRightRadius 20
  , borderColor "black"
  ]


border10 : List Style
border10 =
  [ borderWidth 10
  , backgroundColor "white"
  , borderTopLeftRadius 10
  , borderBottomRightRadius 20
  , borderColor "black"
    -- TODO
    -- , elevation 10
  ]


border11 : List Style
border11 =
  [ width 0
  , height 0
  , borderStyle Solid
  , overflow Hidden
  , borderTopWidth 50
  , borderRightWidth 0
  , borderBottomWidth 50
  , borderLeftWidth 100
  , borderTopColor "transparent"
  , borderRightColor "transparent"
  , borderBottomColor "transparent"
  , borderLeftColor "red"
  ]
