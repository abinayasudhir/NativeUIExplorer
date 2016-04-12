module UIExplorer.UIExplorerPage (..) where

import NativeUi exposing (NativeUi, node, Property)
import NativeUi.Elements exposing (..)
import NativeUi.Style exposing (..)
import UIExplorer.UIExplorerTitle exposing (uIExplorerTitle)


contentWrapper : Bool -> List Property -> List NativeUi -> NativeUi
contentWrapper noScroll =
  if noScroll then
    scrollView
  else
    view


titleComp : Maybe String -> List NativeUi
titleComp title =
  case title of
    Just t ->
      [ uIExplorerTitle t ]

    Nothing ->
      []


spacer : Bool -> List NativeUi
spacer nospacer =
  if nospacer then
    []
  else
    [ view [] [] ]


uIExplorerPage : Bool -> Bool -> Bool -> Maybe String -> List NativeUi -> NativeUi
uIExplorerPage persistTaps noScroll noSpacer title children =
  view
    []
    (List.concat
      [ (titleComp title)
      , [ (contentWrapper noScroll) [] (List.concat [ children, spacer noSpacer ]) ]
      ]
    )


containerStyle : List Style
containerStyle =
  [ backgroundColor "#e9eaed"
  , flex 1
  ]


spacerStyle : List Style
spacerStyle =
  [ height 270
  ]


wrapperStyle : List Style
wrapperStyle =
  [ flex 1
  , paddingTop 10
  ]



--
--   render: function() {
--     var ContentWrapper;
--     var wrapperProps = {};
--     if (this.props.noScroll) {
--       ContentWrapper = (View: ReactClass<any>);
--     } else {
--       ContentWrapper = (ScrollView: ReactClass<any>);
--       wrapperProps.automaticallyAdjustContentInsets = !this.props.title;
--       wrapperProps.keyboardShouldPersistTaps = true;
--       wrapperProps.keyboardDismissMode = 'interactive';
--     }
--     var title = this.props.title ?
--       <UIExplorerTitle title={this.props.title} /> :
--       null;
--     var spacer = this.props.noSpacer ? null : <View style={styles.spacer} />;
--     return (
--       <View style={styles.container}>
--         {title}
--         <ContentWrapper
--           style={styles.wrapper}
--           {...wrapperProps}>
--             {this.props.children}
--             {spacer}
--         </ContentWrapper>
--       </View>
--     );
--   },
-- });
