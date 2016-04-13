module UIExplorer.ImageExample (..) where

import NativeUi exposing (NativeUi, node, Property, string, style, imageSource)
import NativeUi.Elements exposing (..)
import NativeUi.Style as Style exposing (..)
import NativeUi.Properties as NP exposing (..)


-- import UIExplorer.ImageCapInsetsExample exposing (..)


type alias Model =
  { loading : Bool
  , error : Bool
  , progress : Int
  , width : Int
  , height : Int
  }


networkImageCallbackExample : ImageSource -> NativeUi
networkImageCallbackExample src =
  view
    []
    [ image [ NP.source src, style (baseStyle ++ [ overflow Visible ]) ] []
    , text [ style [ marginTop 20 ] ] []
    ]


loadingView : Model -> NativeUi
loadingView model =
  if model.loading then
    view
      [ style progressStyle ]
      [ text [] [ string (toString model.progress) ]
      ]
  else
    view [] []


networkImageExample : Model -> ImageSource -> NativeUi
networkImageExample model src =
  if model.error then
    text [] [ string (toString model.error) ]
  else
    image [ NP.source src, style (baseStyle ++ [ overflow Visible ]) ] [ loadingView model ]


imageSizeExample : Model -> NativeUi
imageSizeExample model =
  view
    [ style [ flexDirection Row ] ]
    [ image [ style imageStyle, NP.source (Uri "") ] []
    , text
        []
        [ string "Actual dimensions:{'\n'}"
        , string ("Width :" ++ (toString model.width))
        , string ("Height :" ++ (toString model.height))
        ]
    ]


plainStaticImage : NativeUi
plainStaticImage =
  view
    [ style horizontal ]
    [ image [ style iconStyle, NP.source (Uri "./uie_thumb_normal.png") ] []
    , image [ style iconStyle, NP.source (Uri "./uie_thumb_selected.png") ] []
    , image [ style iconStyle, NP.source (Uri "./uie_comment_normal.png") ] []
    , image [ style iconStyle, NP.source (Uri "./uie_comment_highlighted.png") ] []
    ]


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


mainView : Model -> List Example
mainView model =
  [ { example
      | title = "Plain Network Image"
      , elements =
          [ image [ style baseStyle, NP.source (Uri "http://facebook.github.io/react/img/logo_og.png") ] []
          ]
    }
  , { example
      | title = "Plain Static Image"
      , elements =
          [ plainStaticImage
          ]
    }
  , { example
      | title = "Image Loading Events"
      , elements =
          [ networkImageCallbackExample (Uri "http://facebook.github.io/origami/public/images/blog-hero.jpg?r=1")
          ]
    }
  , { example
      | title = "Error Handler"
      , elements =
          [ networkImageExample model (Uri "http://TYPO_ERROR_facebook.github.io/react/img/logo_og.png")
          ]
      , platform = Ios
    }
  , { example
      | title = "Image Download Progress"
      , elements =
          [ networkImageExample model (Uri "http://facebook.github.io/origami/public/images/blog-hero.jpg?r=1")
          ]
      , platform = Ios
    }
  , { example
      | title = "defaultSource"
      , elements =
          [ image [ style baseStyle, NP.source (Uri "http://facebook.github.io/origami/public/images/birds.jpg"), NP.defaultSource (Uri "./bunny.png") ] []
          ]
      , platform = Ios
    }
  , { example
      | title = "Border Color"
      , elements =
          [ borderColorView ]
    }
  , { example
      | title = "Border Width"
      , elements =
          [ borderColorWidth
          ]
    }
  , { example
      | title = "Border Radius"
      , elements =
          [ borderRadiusView
          ]
    }
  , { example
      | title = "Background Color"
      , elements =
          [ backgroundColorView
          ]
    }
  , { example
      | title = "Opacity"
      , elements =
          [ opacityView
          ]
    }
  , { example
      | title = "Nesting"
      , elements =
          [ nestingView
          ]
    }
  ]


borderColorView : NativeUi
borderColorView =
  view
    [ style horizontal ]
    [ image
        [ style
            (baseStyle
              ++ backgroundStyle
              ++ [ borderWidth 3, borderColor "#f099f0" ]
            )
        , NP.source (Uri "http://facebook.github.io/react/img/logo_small_2x.png")
        ]
        []
    ]


borderColorWidth : NativeUi
borderColorWidth =
  view
    [ style horizontal ]
    [ image
        [ style
            (baseStyle
              ++ backgroundStyle
              ++ [ borderWidth 5, borderColor "#f099f0" ]
            )
        , NP.source (Uri "http://facebook.github.io/react/img/logo_small_2x.png")
        ]
        []
    ]


borderRadiusView : NativeUi
borderRadiusView =
  view
    [ style horizontal ]
    [ image
        [ style (baseStyle ++ [ borderRadius 5 ])
        , NP.source (Uri "http://facebook.github.io/react/img/logo_og.png")
        ]
        []
    , image
        [ style (baseStyle ++ leftMargin ++ [ borderRadius 19 ])
        , NP.source (Uri "http://facebook.github.io/react/img/logo_og.png")
        ]
        []
    ]


backgroundColorView : NativeUi
backgroundColorView =
  view
    [ style horizontal ]
    [ image
        [ style baseStyle
        , NP.source (Uri "http://facebook.github.io/react/img/logo_small_2x.png")
        ]
        []
    , image
        [ style (baseStyle ++ leftMargin ++ [ backgroundColor "rgba(0, 0, 100, 0.25)" ])
        , NP.source (Uri "http://facebook.github.io/react/img/logo_small_2x.png")
        ]
        []
    , image
        [ style (baseStyle ++ leftMargin ++ [ backgroundColor "red" ])
        , NP.source (Uri "http://facebook.github.io/react/img/logo_small_2x.png")
        ]
        []
    , image
        [ style (baseStyle ++ leftMargin ++ [ backgroundColor "black" ])
        , NP.source (Uri "http://facebook.github.io/react/img/logo_small_2x.png")
        ]
        []
    ]


opacityView : NativeUi
opacityView =
  view
    [ style horizontal ]
    [ image
        [ style (baseStyle ++ [ opacity 1 ])
        , NP.source (Uri "http://facebook.github.io/react/img/logo_og.png")
        ]
        []
    , image
        [ style (baseStyle ++ leftMargin ++ [ opacity 0.8 ])
        , NP.source (Uri "http://facebook.github.io/react/img/logo_og.png")
        ]
        []
    , image
        [ style (baseStyle ++ leftMargin ++ [ opacity 0.6 ])
        , NP.source (Uri "http://facebook.github.io/react/img/logo_og.png")
        ]
        []
    , image
        [ style (baseStyle ++ leftMargin ++ [ opacity 0.4 ])
        , NP.source (Uri "http://facebook.github.io/react/img/logo_og.png")
        ]
        []
    , image
        [ style (baseStyle ++ leftMargin ++ [ opacity 0.2 ])
        , NP.source (Uri "http://facebook.github.io/react/img/logo_og.png")
        ]
        []
    , image
        [ style (baseStyle ++ leftMargin ++ [ opacity 0 ])
        , NP.source (Uri "http://facebook.github.io/react/img/logo_og.png")
        ]
        []
    ]


nestingView : NativeUi
nestingView =
  image
    [ style nestingViewStyle
    , NP.source (Uri "http://facebook.github.io/react/img/logo_og.png")
    ]
    [ text [ style nestedText ] [ string "React" ] ]


imageStyle : List Style
imageStyle =
  [ width 60
  , height 60
  , backgroundColor "transparent"
  , marginRight 10
  ]


nestingViewStyle : List Style
nestingViewStyle =
  [ width 60
  , height 60
  , backgroundColor "transparent"
  ]


baseStyle : List Style
baseStyle =
  [ width 38
  , height 38
  ]


progressStyle : List Style
progressStyle =
  [ flex 1
  , alignItems AlignCenter
  , flexDirection Row
  , width 100
  ]


leftMargin : List Style
leftMargin =
  [ marginLeft 10
  ]


backgroundStyle : List Style
backgroundStyle =
  [ backgroundColor "#222222"
  ]


sectionText : List Style
sectionText =
  [ marginVertical 6
  ]


nestedText : List Style
nestedText =
  [ marginLeft 12
  , marginTop 20
  , backgroundColor "transparent"
  , Style.color "white"
  ]


resizeModeStyle : List Style
resizeModeStyle =
  [ width 90
  , height 60
  , borderWidth 0.5
  , borderColor "black"
  ]


resizeModeText : List Style
resizeModeText =
  [ fontSize 11
  , marginBottom 3
  ]


iconStyle : List Style
iconStyle =
  [ width 15
  , height 15
  ]


horizontal : List Style
horizontal =
  [ flexDirection Row
  ]


gifStyleStyle : List Style
gifStyleStyle =
  [ flex 1
  , height 200
  ]


base64StyleStyle : List Style
base64StyleStyle =
  [ flex 1
  , height 50
  , Style.resizeMode "contain"
  ]
