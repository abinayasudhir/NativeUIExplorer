module UIExplorer.TouchableExample (..) where

import NativeUi exposing (NativeUi, node, Property, string, style, imageSource)
import NativeUi.Elements exposing (..)
import NativeUi.Style as Style exposing (..)
import NativeUi.Properties as NP exposing (..)


type alias Model =
  { timesPressed : Int
  , force : Int
  , platform : Platform
  }


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


examples : Model -> List Example
examples model =
  [ { example
      | title = "<TouchableHighlight>"
      , description =
          "TouchableHighlight works by adding an extra view with a "
            ++ "black background under the single child view.  This works best when the "
            ++ "child view is fully opaque, although it can be made to work as a simple "
            ++ "background color change as well with the activeOpacity and "
            ++ "underlayColor props."
      , elements =
          [ touchableHighlightView ]
    }
  , { example
      | title = "<Text onPress={fn}> with highlight"
      , elements = [ textOnPressBox model ]
    }
  , { example
      | title = "Touchable feedback events"
      , description =
          "<Touchable*> components accept onPress, onPressIn, "
            ++ "onPressOut, and onLongPress as props."
      , elements = [ touchableFeedbackEvents ]
    }
  , { example
      | title = "Touchable delay for events"
      , description =
          "<Touchable*> components also accept delayPressIn, "
            ++ "delayPressOut, and delayLongPress as props. These props impact the "
            ++ "timing of feedback events."
      , elements = [ touchableDelayEvents ]
    }
  , { example
      | title = "3D Touch / Force Touch"
      , description =
          "iPhone 6s and 6s plus support 3D touch, which adds a force property to touches"
      , elements = [ forceTouchExample ]
      , platform = Ios
    }
  , { example
      | title = "Touchable Hit Slop"
      , description =
          "<Touchable*> components accept hitSlop prop which extends the touch area "
            ++ "without changing the view bounds."
      , elements = [ touchableHitSlop model ]
    }
  , { example
      | title = "Disabled Touchable*"
      , description =
          "<Touchable*> components accept disabled prop which prevents "
            ++ "any interaction with component"
      , elements = [ touchableDisabled model ]
    }
  ]


textOnPressBox : Model -> NativeUi
textOnPressBox model =
  let
    textLog =
      if (model.timesPressed > 1) then
        text [] [ string (toString model.timesPressed ++ "x text onPress") ]
      else if (model.timesPressed > 0) then
        text [] [ string "text onPress" ]
      else
        string ""
  in
    view
      []
      [ text [ style textBlock ] [ string "Text has built-in onPress handling" ]
      , view
          [ style logBox ]
          [ textLog
          ]
      ]


touchableFeedbackEvents : NativeUi
touchableFeedbackEvents =
  view
    []
    [ view
        [ style (rowStyle ++ [ justifyContent Center ]) ]
        [ touchableOpacity
            [ style wrapper ]
            [ text [ style buttonStyle ] [ string "Press Me" ]
            ]
        ]
    , view [ style eventLogBox ] []
    ]


touchableDelayEvents : NativeUi
touchableDelayEvents =
  view
    []
    [ view
        [ style (rowStyle ++ [ justifyContent Center ]) ]
        [ touchableOpacity
            [ style wrapper ]
            [ text [ style buttonStyle ] [ string "Press Me" ]
            ]
        ]
    , view [ style eventLogBox ] []
    ]


forceTouchExample : NativeUi
forceTouchExample =
  view
    []
    [ view
        [ style forceTouchBox ]
        [ text [] []
        ]
    , view
        [ style (rowStyle ++ [ justifyContent Center ]) ]
        [ view
            [ style wrapper ]
            [ text [ style buttonStyle ] [ string "Press Me" ]
            ]
        ]
    ]


touchableHitSlop : Model -> NativeUi
touchableHitSlop model =
  let
    log =
      if (model.timesPressed > 1) then
        text [] [ string (toString model.timesPressed ++ "x  onPress") ]
      else if (model.timesPressed > 0) then
        text [] [ string "onPress" ]
      else
        string ""
  in
    view
      []
      [ view
          [ style (rowStyle ++ [ justifyContent Center ]) ]
          [ touchableOpacity
              [ style hitSlopWrapper ]
              [ text [ style hitSlopButton ] [ string "Press Outside This View" ]
              ]
          ]
      , view [ style logBox ] [ text [] [ log ] ]
      ]


touchableDisabled : Model -> NativeUi
touchableDisabled model =
  view
    []
    [ touchableOpacity
        [ style (rowStyle ++ blockStyle), disabled True ]
        [ text [ style disabledButton ] [ string "Disabled TouchableOpacity" ]
        ]
    , touchableOpacity
        [ style (rowStyle ++ blockStyle), disabled False ]
        [ text [ style buttonStyle ] [ string "Enabled TouchableOpacity" ]
        ]
    , touchableHighlight
        [ disabled True
        , style (rowStyle ++ blockStyle)
        , underlayColor "rgb(210, 230, 255)"
        , activeOpacity 1
          -- TODO animationVelocity property
        ]
        [ text [ style disabledButton ] [ string "Disabled TouchableHighlight" ] ]
    , touchableHighlight
        [ style (rowStyle ++ blockStyle)
        , underlayColor "rgb(210, 230, 255)"
        , activeOpacity 1
          -- TODO animationVelocity property
        ]
        [ text [ style disabledButton ] [ string "Disabled TouchableHighlight" ] ]
    , if model.platform == Android then
        touchableNativeFeedback
          [ style (rowStyle ++ blockStyle) ]
          [ view
              []
              [ text
                  [ style (buttonStyle ++ nativeFeedbackButton) ]
                  [ string "Enabled TouchableNativeFeedback" ]
              ]
          ]
      else
        view [] []
    , if model.platform == Android then
        touchableNativeFeedback
          [ style (rowStyle ++ blockStyle), disabled True ]
          [ view
              []
              [ text
                  [ style (disabledButton ++ nativeFeedbackButton) ]
                  [ string "Disabled TouchableNativeFeedback" ]
              ]
          ]
      else
        view [] []
    ]


touchableHighlightView : NativeUi
touchableHighlightView =
  view
    []
    [ view
        [ style rowStyle ]
        [ touchableHighlight
            [ style wrapper ]
            [ image [ NP.source (Uri heartImage) ] []
            ]
        , touchableHighlight
            [ style wrapper
            , underlayColor "rgb(210, 230, 255)"
            , activeOpacity 1
              -- TODO animatedVelocity
            ]
            [ view
                [ style wrapperCustom ]
                [ text [ style textStyle ] [ string " Tap Here For Custom Highlight!" ] ]
            ]
        ]
    ]


heartImage : String
heartImage =
  "https://pbs.twimg.com/media/BlXBfT3CQAA6cVZ.png:small"



-- Styles


rowStyle : List Style
rowStyle =
  [ justifyContent Center
  , flexDirection Row
  ]


iconStyle : List Style
iconStyle =
  [ width 24
  , height 24
  ]


imageStyle : List Style
imageStyle =
  [ width 50
  , height 50
  ]


textStyle : List Style
textStyle =
  [ fontSize 16
  ]


blockStyle : List Style
blockStyle =
  [ padding 10
  ]


buttonStyle : List Style
buttonStyle =
  [ Style.color "#007AFF"
  ]


disabledButton : List Style
disabledButton =
  [ Style.color "#007AFF"
  , opacity 0.5
  ]


nativeFeedbackButton : List Style
nativeFeedbackButton =
  [ textAlign TextAlignCenter
  , margin 10
  ]


hitSlopButton : List Style
hitSlopButton =
  [ Style.color "white"
  ]


wrapper : List Style
wrapper =
  [ borderRadius 8
  ]


wrapperCustom : List Style
wrapperCustom =
  [ borderRadius 8
  , padding 6
  ]


hitSlopWrapper : List Style
hitSlopWrapper =
  [ backgroundColor "red"
  , marginVertical 30
  ]


logBox : List Style
logBox =
  [ padding 20
  , margin 10
  , -- borderWidth StyleSheet.hairlineWidth,
    borderColor "#f0f0f0"
  , backgroundColor "#f9f9f9"
  ]


eventLogBox : List Style
eventLogBox =
  [ padding 10
  , margin 10
  , height 120
  , -- borderWidth StyleSheet.hairlineWidth,
    borderColor "#f0f0f0"
  , backgroundColor "#f9f9f9"
  ]


forceTouchBox : List Style
forceTouchBox =
  [ padding 10
  , margin 10
  , -- borderWidth StyleSheet.hairlineWidth,
    borderColor "#f0f0f0"
  , backgroundColor "#f9f9f9"
  , alignItems AlignCenter
  ]


textBlock : List Style
textBlock =
  [ fontWeight FontWeight500
  , Style.color "blue"
  ]
