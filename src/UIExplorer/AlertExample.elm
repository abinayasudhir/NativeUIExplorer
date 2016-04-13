module UIExplorer.AlertExample (..) where

import NativeUi exposing (NativeUi, node, Property, string, style)
import NativeUi.Elements exposing (..)
import NativeUi.Style exposing (..)
import UIExplorer.UIExplorerBlock exposing (..)


type alias Model =
  { pressed : Bool }


type Action
  = NoOp
  | Press


update : Action -> Model -> Model
update action model =
  case action of
    NoOp ->
      model

    Press ->
      model


alertMainView : Signal.Address Action -> Model -> List NativeUi
alertMainView address model =
  [ alertExample address model
  , simpleAlertExampleBlock address model
  ]


alertDefaultButton : Signal.Address Action -> Model -> NativeUi
alertDefaultButton address model =
  touchableHighlight
    [ style wrapperStyle ]
    [ view
        [ style buttonStyle ]
        [ text [] [ string "Alert with message and default button" ]
        ]
    ]


alertOneButton : Signal.Address Action -> Model -> NativeUi
alertOneButton address model =
  touchableHighlight
    [ style wrapperStyle ]
    [ view
        [ style buttonStyle ]
        [ text [] [ string "Alert with one button" ]
        ]
    ]


alertTwoButton : Signal.Address Action -> Model -> NativeUi
alertTwoButton address model =
  touchableHighlight
    [ style wrapperStyle ]
    [ view
        [ style buttonStyle ]
        [ text [] [ string "Alert with Two buttons" ]
        ]
    ]


alertThreeButton : Signal.Address Action -> Model -> NativeUi
alertThreeButton address model =
  touchableHighlight
    [ style wrapperStyle ]
    [ view
        [ style buttonStyle ]
        [ text [] [ string "Alert with Three buttons" ]
        ]
    ]


alertManyButton : Signal.Address Action -> Model -> NativeUi
alertManyButton address model =
  touchableHighlight
    [ style wrapperStyle ]
    [ view
        [ style buttonStyle ]
        [ text [] [ string "Alert with too Many buttons" ]
        ]
    ]


alertExample : Signal.Address Action -> Model -> NativeUi
alertExample address model =
  uIExplorerBlock "Alert" "Alerts" [ simpleAlertExampleBlock address model ]


simpleAlertExampleBlock : Signal.Address Action -> Model -> NativeUi
simpleAlertExampleBlock address model =
  view
    []
    [ alertDefaultButton address model
    , alertOneButton address model
    , alertTwoButton address model
    , alertThreeButton address model
    , alertManyButton address model
    ]


wrapperStyle : List Style
wrapperStyle =
  [ borderRadius 5
  , marginBottom 5
  ]


buttonStyle : List Style
buttonStyle =
  [ backgroundColor "#eeeeee"
  , padding 10
  ]
