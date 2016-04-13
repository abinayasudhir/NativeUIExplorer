module UIExplorer.ModalExample (..) where

import NativeUi exposing (NativeUi, node, Property, style, string)
import NativeUi.Elements exposing (..)
import NativeUi.Style exposing (..)
import NativeUi.Properties exposing (..)
import NativeUi.Handlers exposing (onPress)


type alias Model =
  { pressed : Bool }


type Action
  = NoOp
  | Press
  | OnUnhighlight
  | OnHighlight


update : Action -> a -> a
update action model =
  case action of
    NoOp ->
      model

    Press ->
      model

    OnUnhighlight ->
      model

    OnHighlight ->
      model


button : Signal.Address Action -> Model -> List NativeUi.NativeUi -> NativeUi.NativeUi
button address model children =
  touchableHighlight
    [ onPress address Press
    , style buttonStyle
    , underlayColor "grey"
    ]
    [ text [ style buttonTextStyle ] [] ]


modalExample : Signal.Address Action -> Model -> List NativeUi -> NativeUi
modalExample address model children =
  view
    []
    [ modal
        []
        [ view
            [ style containerStyle ]
            [ view
                [ style innerContainerStyle ]
                [ (button address model children), text [] [] ]
            ]
        ]
    , view [ style rowStyle ] [ text [ style rowTitleStyle ] [ string "Animated" ], switch [] [] ]
    , view [ style rowStyle ] [ text [ style rowTitleStyle ] [ string "Transparent" ], switch [] [] ]
    , button address model children
    ]


modalStructure : Signal.Address Action -> Model -> List NativeUi -> NativeUi
modalStructure address model children =
  modalExample address model children


containerStyle : List Style
containerStyle =
  [ flex 1
  , justifyContent Center
  , padding 20
  ]


innerContainerStyle : List Style
innerContainerStyle =
  [ borderRadius 10
  , alignItems AlignCenter
  ]


rowStyle : List Style
rowStyle =
  [ alignItems AlignCenter
  , flex 1
  , flexDirection Row
  , marginBottom 20
  ]


rowTitleStyle : List Style
rowTitleStyle =
  [ flex 1
  , fontWeight FontWeightBold
  ]


buttonStyle : List Style
buttonStyle =
  [ borderRadius 5
  , flex 1
  , height 44
  , alignSelf AlignStretch
  , justifyContent Center
  , overflow Hidden
  ]


buttonTextStyle : List Style
buttonTextStyle =
  [ fontSize 18
  , margin 5
  , textAlign TextAlignCenter
  ]


modalButtonStyle : List Style
modalButtonStyle =
  [ marginTop 10
  ]



-- exports.displayName = (undefined: ?string);
-- exports.framework = 'React';
-- exports.title = '<Modal>';
-- exports.description = 'Component for presenting modal views.';
--
-- var Button = React.createClass({
--   getInitialState() {
--     return {
--       active: false,
--     };
--   },
--
--   _onHighlight() {
--     this.setState({active: true});
--   },
--
--   _onUnhighlight() {
--     this.setState({active: false});
--   },
--
--   render() {
--     var colorStyle = {
--       color: this.state.active ? '#fff' : '#000',
--     };
--     return (
--       <TouchableHighlight
--         onHideUnderlay={this._onUnhighlight}
--         onPress={this.props.onPress}
--         onShowUnderlay={this._onHighlight}
--         style={[styles.button, this.props.style]}
--         underlayColor="#a9d9d4">
--           <Text style={[styles.buttonText, colorStyle]}>{this.props.children}</Text>
--       </TouchableHighlight>
--     );
--   }
-- });
--
-- var ModalExample = React.createClass({
--   getInitialState() {
--     return {
--       animated: true,
--       modalVisible: false,
--       transparent: false,
--     };
--   },
--
--   _setModalVisible(visible) {
--     this.setState({modalVisible: visible});
--   },
--
--   _toggleAnimated() {
--     this.setState({animated: !this.state.animated});
--   },
--
--   _toggleTransparent() {
--     this.setState({transparent: !this.state.transparent});
--   },
--
--   render() {
--     var modalBackgroundStyle = {
--       backgroundColor: this.state.transparent ? 'rgba(0, 0, 0, 0.5)' : '#f5fcff',
--     };
--     var innerContainerTransparentStyle = this.state.transparent
--       ? {backgroundColor: '#fff', padding: 20}
--       : null;
--
--     return (
--       <View>
--         <Modal
--           animated={this.state.animated}
--           transparent={this.state.transparent}
--           visible={this.state.modalVisible}
--           onRequestClose={() => {this._setModalVisible(false)}}
--           >
--           <View style={[styles.container, modalBackgroundStyle]}>
--             <View style={[styles.innerContainer, innerContainerTransparentStyle]}>
--               <Text>This modal was presented {this.state.animated ? 'with' : 'without'} animation.</Text>
--               <Button
--                 onPress={this._setModalVisible.bind(this, false)}
--                 style={styles.modalButton}>
--                 Close
--               </Button>
--             </View>
--           </View>
--         </Modal>
--
--         <View style={styles.row}>
--           <Text style={styles.rowTitle}>Animated</Text>
--           <Switch value={this.state.animated} onValueChange={this._toggleAnimated} />
--         </View>
--
--         <View style={styles.row}>
--           <Text style={styles.rowTitle}>Transparent</Text>
--           <Switch value={this.state.transparent} onValueChange={this._toggleTransparent} />
--         </View>
--
--         <Button onPress={this._setModalVisible.bind(this, true)}>
--           Present
--         </Button>
--       </View>
--     );
--   },
-- });
--
-- exports.examples = [
--   {
--     title: 'Modal Presentation',
--     description: 'Modals can be presented with or without animation',
--     render: () => <ModalExample />,
--   },
-- ];
--
--
