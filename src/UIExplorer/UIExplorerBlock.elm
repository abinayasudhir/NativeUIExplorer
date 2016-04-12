module UIExplorer.UIExplorerBlock (..) where

import NativeUi exposing (..)
import NativeUi.Elements exposing (..)
import NativeUi.Style exposing (..)


uIExplorerBlock : String -> String -> List NativeUi.NativeUi -> NativeUi.NativeUi
uIExplorerBlock title description children =
  view
    [ style containerStyle ]
    [ view
        [ style titleContainerStyle ]
        [ text [ style titleTextStyle ] [ string title ]
        , string description
        ]
    , view [ style childrenStyle ] children
    ]


containerStyle : List Style
containerStyle =
  [ borderRadius 3
  , borderWidth 0.5
  , borderColor "#d6d7da"
  , backgroundColor "#ffffff"
  , margin 10
  , marginVertical 5
  , overflow Hidden
  ]


titleContainerStyle : List Style
titleContainerStyle =
  [ borderBottomWidth 0.5
  , borderTopLeftRadius 3
  , borderTopRightRadius 2.5
  , borderBottomColor "#d6d7da"
  , backgroundColor "#f6f7f8"
  , paddingHorizontal 10
  , paddingVertical 5
  ]


titleTextStyle : List Style
titleTextStyle =
  [ fontSize 14
  , fontWeight FontWeight500
  ]


childrenStyle : List Style
childrenStyle =
  [ margin 10
  ]



-- container :
-- var styles = StyleSheet.create({
--
--
--
--   descriptionText: {
--     fontSize: 14,
--   },
--   disclosure: {
--     position: 'absolute',
--     top: 0,
--     right: 0,
--     padding: 10,
--   },
--   disclosureIcon: {
--     width: 12,
--     height: 8,
--   },
--
-- });
--
-- -- <View style={styles.container}>
-- --     <View style={styles.titleContainer}>
-- --       <Text style={styles.titleText}>
-- --         {this.props.title}
-- --       </Text>
-- --       {description}
-- --     </View>
-- --     <View style={styles.children}>
-- --       {this.props.children}
-- --     </View>
-- --   </View>
