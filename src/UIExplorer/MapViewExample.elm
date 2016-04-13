module UIExplorer.MapViewExample (..) where

import NativeUi exposing (NativeUi, node, Property, style, string)
import NativeUi.Elements exposing (..)
import NativeUi.Style exposing (..)


-- import NativeUi.Properties exposing (..)

import NativeUi.Handlers exposing (onPress)


type alias Model =
  { pressed : Bool
  }


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


mapStructure : Signal.Address Action -> Model -> List NativeUi
mapStructure address model =
  [ string "MAP"
  , mapViewExample address model
  , string "showsUserLocation + followUserLocation"
  , mapView [] []
  , string "Callout example"
  , annotationExample
  , string "Annotation focus example"
  , annotationExample
  , string "Draggable pin"
  , annotationExample
  , string "Custom pin color"
  , annotationExample
  , string "Custom pin image"
  , annotationExample
  , string "Custom pin view"
  , annotationExample
  , string "Custom overlay"
  , mapView [] []
  ]


annotationExample : NativeUi
annotationExample =
  mapView [] []


mapViewExample : Signal.Address Action -> Model -> NativeUi
mapViewExample address model =
  view [] [ mapView [ style mapStyle ] [], mapRegionInput address model ]


mapRegionInput : Signal.Address Action -> Model -> NativeUi
mapRegionInput address model =
  view
    []
    [ view [ style rowStyle ] [ text [] [ string "Latitude" ], textInput [ style textInputStyle ] [] ]
    , view [ style rowStyle ] [ text [] [ string "Longitude" ], textInput [ style textInputStyle ] [] ]
    , view [ style rowStyle ] [ text [] [ string "Latitude Delta" ], textInput [ style textInputStyle ] [] ]
    , view [ style rowStyle ] [ text [] [ string "Longitude Delta" ], textInput [ style textInputStyle ] [] ]
    , view [ style changeButtonStyle ] [ text [ onPress address Press ] [ string "change (for Button)" ] ]
    ]



-- var MapRegionInput = React.createClass({
--
--   propTypes: {
--     region: PropTypes.shape({
--       latitude: PropTypes.number.isRequired,
--       longitude: PropTypes.number.isRequired,
--       latitudeDelta: PropTypes.number,
--       longitudeDelta: PropTypes.number,
--     }),
--     onChange: PropTypes.func.isRequired,
--   },
--
--   getInitialState() {
--     return {
--       region: {
--         latitude: 0,
--         longitude: 0,
--       }
--     };
--   },
--
--   componentWillReceiveProps: function(nextProps) {
--     this.setState({
--       region: nextProps.region || this.getInitialState().region
--     });
--   },
--
--   render: function() {
--     var region = this.state.region || this.getInitialState().region;
--     return (
--       <View>
--          <View style={styles.row}>
--           <Text>
--             {'Latitude'}
--           </Text>
--           <TextInput
--             value={'' + region.latitude}
--             style={styles.textInput}
--             onChange={this._onChangeLatitude}
--             selectTextOnFocus={true}
--           />
--         </View>
--         <View style={styles.row}>
--           <Text>
--             {'Longitude'}
--           </Text>
--           <TextInput
--             value={'' + region.longitude}
--             style={styles.textInput}
--             onChange={this._onChangeLongitude}
--             selectTextOnFocus={true}
--           />
--         </View>
--         <View style={styles.row}>
--           <Text>
--             {'Latitude delta'}
--           </Text>
--           <TextInput
--             value={
--               region.latitudeDelta == null ? '' : String(region.latitudeDelta)
--             }
--             style={styles.textInput}
--             onChange={this._onChangeLatitudeDelta}
--             selectTextOnFocus={true}
--           />
--         </View>
--         <View style={styles.row}>
--           <Text>
--             {'Longitude delta'}
--           </Text>
--           <TextInput
--             value={
--               region.longitudeDelta == null ? '' : String(region.longitudeDelta)
--             }
--             style={styles.textInput}
--             onChange={this._onChangeLongitudeDelta}
--             selectTextOnFocus={true}
--           />
--         </View>
--         <View style={styles.changeButton}>
--           <Text onPress={this._change}>
--             {'Change'}
--           </Text>
--         </View>
--       </View>
--     );
--   },
--


mapStyle : List Style
mapStyle =
  [ height 150
  , margin 10
  , borderWidth 1
  , borderColor "#000000"
  ]


rowStyle : List Style
rowStyle =
  [ flexDirection Row
  , justifyContent SpaceBetween
  ]


textInputStyle : List Style
textInputStyle =
  [ width 150
  , height 20
  , borderWidth 0.5
  , borderColor "#aaaaaa"
  , fontSize 13
  , padding 4
  ]


changeButtonStyle : List Style
changeButtonStyle =
  [ alignSelf AlignCenter
  , marginTop 5
  , padding 3
  , borderWidth 0.5
  , borderColor "#777777"
  ]



-- var React = require('react');
-- var ReactNative = require('react-native');
-- var { PropTypes } = React;
-- var {
--   Image,
--   MapView,
--   StyleSheet,
--   Text,
--   TextInput,
--   TouchableOpacity,
--   View,
-- } = ReactNative;
--
-- var regionText = {
--   latitude: '0',
--   longitude: '0',
--   latitudeDelta: '0',
--   longitudeDelta: '0',
-- };
--
--
--   _onChangeLatitude: function(e) {
--     regionText.latitude = e.nativeEvent.text;
--   },
--
--   _onChangeLongitude: function(e) {
--     regionText.longitude = e.nativeEvent.text;
--   },
--
--   _onChangeLatitudeDelta: function(e) {
--     regionText.latitudeDelta = e.nativeEvent.text;
--   },
--
--   _onChangeLongitudeDelta: function(e) {
--     regionText.longitudeDelta = e.nativeEvent.text;
--   },
--
--   _change: function() {
--     this.setState({
--       region: {
--         latitude: parseFloat(regionText.latitude),
--         longitude: parseFloat(regionText.longitude),
--         latitudeDelta: parseFloat(regionText.latitudeDelta),
--         longitudeDelta: parseFloat(regionText.longitudeDelta),
--       },
--     });
--     this.props.onChange(this.state.region);
--   },
--
-- });
--
-- var MapViewExample = React.createClass({
--
--   getInitialState() {
--     return {
--       isFirstLoad: true,
--       mapRegion: undefined,
--       mapRegionInput: undefined,
--       annotations: [],
--     };
--   },
--
--   render() {
--     return (
--       <View>
--         <MapView
--           style={styles.map}
--           onRegionChange={this._onRegionChange}
--           onRegionChangeComplete={this._onRegionChangeComplete}
--           region={this.state.mapRegion}
--           annotations={this.state.annotations}
--         />
--         <MapRegionInput
--           onChange={this._onRegionInputChanged}
--           region={this.state.mapRegionInput}
--         />
--       </View>
--     );
--   },
--
--   _getAnnotations(region) {
--     return [{
--       longitude: region.longitude,
--       latitude: region.latitude,
--       title: 'You Are Here',
--     }];
--   },
--
--   _onRegionChange(region) {
--     this.setState({
--       mapRegionInput: region,
--     });
--   },
--
--   _onRegionChangeComplete(region) {
--     if (this.state.isFirstLoad) {
--       this.setState({
--         mapRegionInput: region,
--         annotations: this._getAnnotations(region),
--         isFirstLoad: false,
--       });
--     }
--   },
--
--   _onRegionInputChanged(region) {
--     this.setState({
--       mapRegion: region,
--       mapRegionInput: region,
--       annotations: this._getAnnotations(region),
--     });
--   },
--
-- });
--
-- var AnnotationExample = React.createClass({
--
--   getInitialState() {
--     return {
--       isFirstLoad: true,
--       annotations: [],
--       mapRegion: undefined,
--     };
--   },
--
--   render() {
--     if (this.state.isFirstLoad) {
--       var onRegionChangeComplete = (region) => {
--         this.setState({
--           isFirstLoad: false,
--           annotations: [{
--             longitude: region.longitude,
--             latitude: region.latitude,
--             ...this.props.annotation,
--           }],
--         });
--       };
--     }
--
--     return (
--       <MapView
--         style={styles.map}
--         onRegionChangeComplete={onRegionChangeComplete}
--         region={this.state.mapRegion}
--         annotations={this.state.annotations}
--       />
--     );
--   },
--
-- });
--
--
--
-- exports.displayName = (undefined: ?string);
-- exports.title = '<MapView>';
-- exports.description = 'Base component to display maps';
-- exports.examples = [
--   {
--     title: 'Map',
--     render() {
--       return <MapViewExample />;
--     }
--   },
--   {
--     title: 'showsUserLocation + followUserLocation',
--     render() {
--       return (
--         <MapView
--           style={styles.map}
--           showsUserLocation={true}
--           followUserLocation={true}
--         />
--       );
--     }
--   },
--   {
--     title: 'Callout example',
--     render() {
--       return <AnnotationExample style={styles.map} annotation={{
--         title: 'More Info...',
--         rightCalloutView: (
--           <TouchableOpacity
--             onPress={() => {
--               alert('You Are Here');
--             }}>
--             <Image
--               style={{width:30, height:30}}
--               source={require('./uie_thumb_selected.png')}
--             />
--           </TouchableOpacity>
--         ),
--       }}/>;
--     }
--   },
--   {
--     title: 'Annotation focus example',
--     render() {
--       return <AnnotationExample style={styles.map} annotation={{
--         title: 'More Info...',
--         onFocus: () => {
--           alert('Annotation gets focus');
--         },
--         onBlur: () => {
--           alert('Annotation lost focus');
--         }
--       }}/>;
--     }
--   },
--   {
--     title: 'Draggable pin',
--     render() {
--       return <AnnotationExample style={styles.map} annotation={{
--         draggable: true,
--         onDragStateChange: (event) => {
--           console.log('Drag state: ' + event.state);
--         },
--       }}/>;
--     }
--   },
--   {
--     title: 'Custom pin color',
--     render() {
--       return <AnnotationExample style={styles.map} annotation={{
--         title: 'You Are Purple',
--         tintColor: MapView.PinColors.PURPLE,
--       }}/>;
--     }
--   },
--   {
--     title: 'Custom pin image',
--     render() {
--       return <AnnotationExample style={styles.map} annotation={{
--         title: 'Thumbs Up!',
--         image: require('image!uie_thumb_big'),
--       }}/>;
--     }
--   },
--   {
--     title: 'Custom pin view',
--     render() {
--       return <AnnotationExample style={styles.map} annotation={{
--         title: 'Thumbs Up!',
--         view: <View style={{
--           alignItems: 'center',
--         }}>
--           <Text style={{fontWeight: 'bold', color: '#f007'}}>
--             Thumbs Up!
--           </Text>
--           <Image
--             style={{width: 90, height: 65, resizeMode: 'cover'}}
--             source={require('image!uie_thumb_big')}
--           />
--         </View>,
--       }}/>;
--     }
--   },
--   {
--     title: 'Custom overlay',
--     render() {
--       return <MapView
--         style={styles.map}
--         region={{
--           latitude: 39.06,
--           longitude: -95.22,
--         }}
--         overlays={[{
--           coordinates:[
--             {latitude: 32.47, longitude: -107.85},
--             {latitude: 45.13, longitude: -94.48},
--             {latitude: 39.27, longitude: -83.25},
--             {latitude: 32.47, longitude: -107.85},
--           ],
--           strokeColor: '#f007',
--           lineWidth: 3,
--         }]}
--       />;
--     }
--   },
-- ];
