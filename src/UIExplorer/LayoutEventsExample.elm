module UIExplorer.LayoutEventsExample (..) where

import NativeUi exposing (NativeUi, node, Property, string, style, imageSource)
import NativeUi.Elements exposing (..)
import NativeUi.Style as Style exposing (..)
import NativeUi.Properties as NP exposing (..)


type alias Layout =
  { x : Float
  , y : Float
  , widthValue : Float
  , heightValue : Float
  }


type alias LayoutEvent =
  { nativeEvent :
      { layout : Layout
      }
  }


type alias State =
  { containerStyle : { width : Float }
  , extraText : String
  , imageLayout : Layout
  , textLayout : Layout
  , viewLayout : Layout
  , viewStyle : { margin : Int }
  }


layoutEventExample : State -> NativeUi
layoutEventExample state =
  let
    widthValue =
      state.textLayout.widthValue

    heightValue =
      state.textLayout.heightValue

    dividedAns =
      round (widthValue / heightValue)

    imageAns =
      round (state.imageLayout.x / state.imageLayout.y)
  in
    view
      []
      [ text
          []
          [ string "layout events are called on mount and whenever layout is recalculated. Note that the layout event will typically be received "
          , text [ style italicText ] [ string "before" ]
          , string "the layout has updated on screen, especially when using layout animations.{'  '}"
          , text [ style pressText ] [ string "Press here to change layout." ]
          ]
      , view
          [ style viewStyles ]
          [ image [ style imageStyle, NP.source (Uri "https://fbcdn-dragon-a.akamaihd.net/hphotos-ak-prn1/t39.1997/p128x128/851561_767334496626293_1958532586_n.png") ] []
          , text [] [ string "ViewLayout:" ]
          , text [ style textStyle ] [ string ("A Simple piece of text" ++ state.extraText) ]
          , text
              []
              [ string "{'\n'}"
              , string ("Text w/h:" ++ toString (dividedAns))
              , string ("Image x/y:" ++ toString (imageAns))
              ]
          ]
      ]


viewStyles : List Style
viewStyles =
  [ padding 12
  , borderColor "black"
  , borderWidth 0.5
  , backgroundColor "transparent"
  ]


textStyle : List Style
textStyle =
  [ alignSelf AlignFlexStart
  , borderColor "rgba(0, 0, 255, 0.2)"
  , borderWidth 0.5
  ]


imageStyle : List Style
imageStyle =
  [ width 50
  , height 50
  , marginBottom 10
  , alignSelf AlignCenter
  ]


pressText : List Style
pressText =
  [ fontWeight FontWeightBold
  ]


italicText : List Style
italicText =
  [ fontStyle Italic
  ]
