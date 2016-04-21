module UIExplorer.ImageExample (..) where

import NativeUi exposing (NativeUi, node, Property, string, style, imageSource)
import NativeUi.Elements exposing (..)
import NativeUi.Style as Style exposing (..)
import NativeUi.Properties as NP exposing (..)
import UIExplorer.ImageCapInsetsExample as ImageCapInsetsExample exposing (..)


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


imageSizeExample : Model -> String -> NativeUi
imageSizeExample model src =
  view
    [ style [ flexDirection Row ] ]
    [ image [ style imageStyle, NP.source (Uri src) ] []
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
      , description = "If the `source` prop `uri` property is prefixed with ' +\n'http , then it will be downloaded from the network."
      , elements =
          [ image [ style baseStyle, NP.source (Uri fullImage) ] []
          ]
    }
  , { example
      | title = "Plain Static Image"
      , description = "Static assets should be placed in the source code tree, and ' +\n    'required in the same way as JavaScript modules."
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
      , description = "Show a placeholder image when a network image is loading"
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
  , { example
      | title = "Tint Color"
      , description = "The `tintColor` style prop changes all the non-alpha ' +\n      'pixels to the tint color."
      , elements =
          [ tintColorView
          ]
    }
    -- TODO Resize Mode
  , { example
      | title = "Animated GIF"
      , elements =
          [ image [ style gifStyle, NP.source (Uri "http://38.media.tumblr.com/9e9bd08c6e2d10561dd1fb4197df4c4e/tumblr_mfqekpMktw1rn90umo1_500.gif") ] []
          ]
      , platform = Ios
    }
  , { example
      | title =
          "Base64 image"
      , elements =
          [ image [ style base64Style, NP.source (Uri base64Icon), NP.source (Num 3) ] []
          ]
      , platform = Ios
    }
  , { example
      | title =
          "Cap Insets"
      , description =
          "When the image is resized, the corners of the size specified"
            ++ "by capInsets will stay a fixed size, but the center content and "
            ++ "borders of the image will be stretched. This is useful for creating "
            ++ "resizable rounded buttons, shadows, and other resizable assets."
      , elements =
          [ ImageCapInsetsExample.mainView ]
      , platform = Ios
    }
  , { example
      | title =
          "Image Size"
      , elements =
          [ imageSizeExample model fullImage
          ]
      , platform = Ios
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
        , NP.source (Uri smallImage)
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
        , NP.source (Uri smallImage)
        ]
        []
    ]


borderRadiusView : NativeUi
borderRadiusView =
  view
    [ style horizontal ]
    [ image
        [ style (baseStyle ++ [ borderRadius 5 ])
        , NP.source (Uri fullImage)
        ]
        []
    , image
        [ style (baseStyle ++ leftMargin ++ [ borderRadius 19 ])
        , NP.source (Uri fullImage)
        ]
        []
    ]


backgroundColorView : NativeUi
backgroundColorView =
  view
    [ style horizontal ]
    [ image
        [ style baseStyle
        , NP.source (Uri smallImage)
        ]
        []
    , image
        [ style (baseStyle ++ leftMargin ++ [ backgroundColor "rgba(0, 0, 100, 0.25)" ])
        , NP.source (Uri smallImage)
        ]
        []
    , image
        [ style (baseStyle ++ leftMargin ++ [ backgroundColor "red" ])
        , NP.source (Uri smallImage)
        ]
        []
    , image
        [ style (baseStyle ++ leftMargin ++ [ backgroundColor "black" ])
        , NP.source (Uri smallImage)
        ]
        []
    ]


opacityView : NativeUi
opacityView =
  view
    [ style horizontal ]
    [ image
        [ style (baseStyle ++ [ opacity 1 ])
        , NP.source (Uri fullImage)
        ]
        []
    , image
        [ style (baseStyle ++ leftMargin ++ [ opacity 0.8 ])
        , NP.source (Uri fullImage)
        ]
        []
    , image
        [ style (baseStyle ++ leftMargin ++ [ opacity 0.6 ])
        , NP.source (Uri fullImage)
        ]
        []
    , image
        [ style (baseStyle ++ leftMargin ++ [ opacity 0.4 ])
        , NP.source (Uri fullImage)
        ]
        []
    , image
        [ style (baseStyle ++ leftMargin ++ [ opacity 0.2 ])
        , NP.source (Uri fullImage)
        ]
        []
    , image
        [ style (baseStyle ++ leftMargin ++ [ opacity 0 ])
        , NP.source (Uri fullImage)
        ]
        []
    ]


nestingView : NativeUi
nestingView =
  image
    [ style nestingViewStyle
    , NP.source (Uri fullImage)
    ]
    [ text [ style nestedText ] [ string "React" ] ]


tintColorView : NativeUi
tintColorView =
  view
    []
    [ view
        [ style horizontal ]
        [ image
            [ style (iconStyle ++ [ borderRadius 5, Style.tintColor "#5ac8fa" ])
            , NP.source (Uri "./uie_thumb_normal.png")
            ]
            []
        , image
            [ style (iconStyle ++ leftMargin ++ [ borderRadius 5, Style.tintColor "#4cd964" ])
            , NP.source (Uri "./uie_thumb_normal.png")
            ]
            []
        , image
            [ style (iconStyle ++ leftMargin ++ [ borderRadius 5, Style.tintColor "#ff2d55" ])
            , NP.source (Uri "./uie_thumb_normal.png")
            ]
            []
        , image
            [ style (iconStyle ++ leftMargin ++ [ borderRadius 5, Style.tintColor "#8e8e93" ])
            , NP.source (Uri "./uie_thumb_normal.png")
            ]
            []
        ]
    , text [ style sectionText ] [ string "It also works with downloaded images:" ]
    , view
        [ style horizontal ]
        [ image
            [ style (baseStyle ++ [ borderRadius 5, Style.tintColor "#5ac8fa" ])
            , NP.source (Uri smallImage)
            ]
            []
        , image
            [ style (baseStyle ++ leftMargin ++ [ borderRadius 5, Style.tintColor "#4cd964" ])
            , NP.source (Uri smallImage)
            ]
            []
        , image
            [ style (baseStyle ++ leftMargin ++ [ borderRadius 5, Style.tintColor "#ff2d55" ])
            , NP.source (Uri smallImage)
            ]
            []
        , image
            [ style (baseStyle ++ leftMargin ++ [ borderRadius 5, Style.tintColor "#8e8e93" ])
            , NP.source (Uri smallImage)
            ]
            []
        ]
    ]


smallImage : String
smallImage =
  "http://facebook.github.io/react/img/logo_small_2x.png"


fullImage : String
fullImage =
  "http://facebook.github.io/react/img/logo_og.png"


base64Icon : String
base64Icon =
  "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEsAAABLCAQAAACSR7JhAAADtUlEQVR4Ac3YA2Bj6QLH0XPT1Fzbtm29tW3btm3bfLZtv7e2ObZnms7d8Uw098tuetPzrxv8wiISrtVudrG2JXQZ4VOv+qUfmqCGGl1mqLhoA52oZlb0mrjsnhKpgeUNEs91Z0pd1kvihA3ULGVHiQO2narKSHKkEMulm9VgUyE60s1aWoMQUbpZOWE+kaqs4eLEjdIlZTcFZB0ndc1+lhB1lZrIuk5P2aib1NBpZaL+JaOGIt0ls47SKzLC7CqrlGF6RZ09HGoNy1lYl2aRSWL5GuzqWU1KafRdoRp0iOQEiDzgZPnG6DbldcomadViflnl/cL93tOoVbsOLVM2jylvdWjXolWX1hmfZbGR/wjypDjFLSZIRov09BgYmtUqPQPlQrPapecLgTIy0jMgPKtTeob2zWtrGH3xvjUkPCtNg/tm1rjwrMa+mdUkPd3hWbH0jArPGiU9ufCsNNWFZ40wpwn+62/66R2RUtoso1OB34tnLOcy7YB1fUdc9e0q3yru8PGM773vXsuZ5YIZX+5xmHwHGVvlrGPN6ZSiP1smOsMMde40wKv2VmwPPVXNut4sVpUreZiLBHi0qln/VQeI/LTMYXpsJtFiclUN+5HVZazim+Ky+7sAvxWnvjXrJFneVtLWLyPJu9K3cXLWeOlbMTlrIelbMDlrLenrjEQOtIF+fuI9xRp9ZBFp6+b6WT8RrxEpdK64BuvHgDk+vUy+b5hYk6zfyfs051gRoNO1usU12WWRWL73/MMEy9pMi9qIrR4ZpV16Rrvduxazmy1FSvuFXRkqTnE7m2kdb5U8xGjLw/spRr1uTov4uOgQE+0N/DvFrG/Jt7i/FzwxbA9kDanhf2w+t4V97G8lrT7wc08aA2QNUkuTfW/KimT01wdlfK4yEw030VfT0RtZbzjeMprNq8m8tnSTASrTLti64oBNdpmMQm0eEwvfPwRbUBywG5TzjPCsdwk3IeAXjQblLCoXnDVeoAz6SfJNk5TTzytCNZk/POtTSV40  NwOFWzw86wNJRpubpXsn60NJFlHeqlYRbslqZm2jnEZ3qcSKgm0kTli3zZVS7y/iivZTweYXJ26Y+RTbV1zh3hYkgyFGSTKPfRVbRqWWVReaxYeSLarYv1Qqsmh1s95S7G+eEWK0f3jYKTbV6bOwepjfhtafsvUsqrQvrGC8YhmnO9cSCk3yuY984F1vesdHYhWJ5FvASlacshUsajFt2mUM9pqzvKGcyNJW0arTKN1GGGzQlH0tXwLDgQTurS8eIQAAAABJRU5ErkJggg=="


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


gifStyle : List Style
gifStyle =
  [ flex 1
  , height 200
  ]


base64Style : List Style
base64Style =
  [ flex 1
  , height 50
  , Style.resizeMode "contain"
  ]
