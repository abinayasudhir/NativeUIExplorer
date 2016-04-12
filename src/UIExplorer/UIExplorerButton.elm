module UIExplorer.UIExplorerButton (..) where

import NativeUi exposing (..)
import NativeUi.Elements exposing (..)
import NativeUi.Style exposing (..)
import NativeUi.Properties exposing (underlayColor)
import NativeUi.Handlers exposing (onPress)


type alias Model =
  { pressed : Bool }


type Action
  = NoOp
  | Press


update : Action -> a -> a
update action model =
  case action of
    NoOp ->
      model

    Press ->
      model


view : Signal.Address Action -> Model -> List NativeUi.NativeUi -> NativeUi.NativeUi
view address model children =
  touchableHighlight
    [ onPress address Press
    , style buttonStyle
    , underlayColor "grey"
    ]
    [ text [] children ]


buttonStyle : List Style
buttonStyle =
  [ borderColor "#696969"
  , borderRadius 8
  , borderWidth 1
  , padding 10
  , margin 5
  , alignItems AlignCenter
  , justifyContent Center
  , backgroundColor "#d3d3d3"
  ]
