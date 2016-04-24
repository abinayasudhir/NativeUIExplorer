module UIExplorer.ListViewExample (..) where

import NativeUi exposing (NativeUi, node, Property, string, style, imageSource)
import NativeUi.Elements exposing (..)
import NativeUi.Style as Style exposing (..)
import NativeUi.Properties as NP exposing (..)
import UIExplorer.UIExplorerPage exposing (..)


listViewExample : NativeUi
listViewExample =
  listView [] []


listViewSimpleExample : NativeUi
listViewSimpleExample =
  uIExplorerPage False True True (Just "") [ listViewExample ]



-- <UIExplorerPage
-- title={this.props.navigator ? null : '<ListView>'}
-- noSpacer={true}
-- noScroll={true}>
--   <ListView
--   dataSource={this.state.dataSource}
--   renderRow={this._renderRow}
--   renderScrollComponent={props => <RecyclerViewBackedScrollView {...props} />}
--   renderSeparator={(sectionID, rowID) => <View key={`${sectionID}-${rowID}`} style={styles.separator} />}
--   />
--     </UIExplorerPage>


renderRowView : NativeUi
renderRowView =
  touchableHighlight
    []
    [ view
        []
        [ view
            [ style rowStyle ]
            [ image [ style thumbStyle, NP.source (Uri "") ] []
            , text [ style textStyle ] [ string "" ]
            ]
        ]
    ]


rowStyle : List Style
rowStyle =
  [ flexDirection Row
  , justifyContent Center
  , padding 10
  , backgroundColor "#F6F6F6"
  ]


separator : List Style
separator =
  [ height 1
  , backgroundColor "#CCCCCC"
  ]


thumbStyle : List Style
thumbStyle =
  [ width 64
  , height 64
  ]


textStyle : List Style
textStyle =
  [ flex 1
  ]
