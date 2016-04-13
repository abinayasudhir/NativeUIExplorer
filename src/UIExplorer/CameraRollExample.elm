module UIExplorer.CameraRollExample (..) where

import NativeUi exposing (..)
import NativeUi.Elements exposing (..)
import NativeUi.Style exposing (..)
import NativeUi.Properties as Prop exposing (..)
import NativeUi.Handlers exposing (onPress)
import UIExplorer.CameraRollView as CR


type GroupTypes
  = Album
  | All
  | Event
  | Faces
  | Library
  | PhotoStream
  | SavedPhotos


enumGroupTypeToString : a -> String
enumGroupTypeToString name =
  name
    |> toString


cameraRollExample : CR.ViewGroupTypes -> NativeUi
cameraRollExample gt =
  view
    []
    [ switch [] []
    , text [] []
    , sliderIos [] []
    , text [] [ string ("Group Types" ++ enumGroupTypeToString gt) ]
    , CR.cameraRollView gt
    ]


renderImage : NativeUi
renderImage =
  touchableOpacity
    []
    [ view [ style rowStyle ] [ image [] [] ]
    , view
        [ style infoStyle ]
        [ text [] [ string "uri" ]
        , text [] [ string "location" ]
        , text [] [ string "group name" ]
        , text [] [ string "date" ]
        ]
    ]


rowStyle : List Style
rowStyle =
  [ flexDirection Row
  , flex 1
  ]


urlStyle : List Style
urlStyle =
  [ fontSize 9
  , marginBottom 14
  ]


imageStyle : List Style
imageStyle =
  [ margin 4
  ]


infoStyle : List Style
infoStyle =
  [ flex 1
  ]



{- const CameraRollView = require('./CameraRollView');

const AssetScaledImageExampleView = require('./AssetScaledImageExample');

const CAMERA_ROLL_VIEW = 'camera_roll_view';

const CameraRollExample = React.createClass({

  getInitialState() {
    return {
      groupTypes: 'SavedPhotos',
      sliderValue: 1,
      bigImages: true,
    };
  },

  render() {
    return (
      <View>
        <Switch
          onValueChange={this._onSwitchChange}
          value={this.state.bigImages} />
        <Text>{(this.state.bigImages ? 'Big' : 'Small') + ' Images'}</Text>
        <SliderIOS
          value={this.state.sliderValue}
          onValueChange={this._onSliderChange}
        />
        <Text>{'Group Type: ' + this.state.groupTypes}</Text>
        <CameraRollView
          ref={CAMERA_ROLL_VIEW}
          batchSize={20}
          groupTypes={this.state.groupTypes}
          renderImage={this._renderImage}
        />
      </View>
    );
  },

  loadAsset(asset){
    if (this.props.navigator) {
      this.props.navigator.push({
        title: 'Camera Roll Image',
        component: AssetScaledImageExampleView,
        backButtonTitle: 'Back',
        passProps: { asset: asset },
      });
    }
  },

  _renderImage(asset) {
    const imageSize = this.state.bigImages ? 150 : 75;
    const imageStyle = [styles.image, {width: imageSize, height: imageSize}];
    const location = asset.node.location.longitude ?
      JSON.stringify(asset.node.location) : 'Unknown location';
    return (
      <TouchableOpacity key={asset} onPress={ this.loadAsset.bind( this, asset ) }>
        <View style={styles.row}>
          <Image
            source={asset.node.image}
            style={imageStyle}
          />
          <View style={styles.info}>
            <Text style={styles.url}>{asset.node.image.uri}</Text>
            <Text>{location}</Text>
            <Text>{asset.node.group_name}</Text>
            <Text>{new Date(asset.node.timestamp).toString()}</Text>
          </View>
        </View>
      </TouchableOpacity>
    );
  },

  _onSliderChange(value) {
    const options = CameraRoll.GroupTypesOptions;
    const index = Math.floor(value * options.length * 0.99);
    const groupTypes = options[index];
    if (groupTypes !== this.state.groupTypes) {
      this.setState({groupTypes: groupTypes});
    }
  },

  _onSwitchChange(value) {
    this.refs[CAMERA_ROLL_VIEW].rendererChanged();
    this.setState({ bigImages: value });
  }
});

const styles = StyleSheet.create({

});

exports.title = 'Camera Roll';
exports.description = 'Example component that uses CameraRoll to list user\'s photos';
exports.examples = [
  {
    title: 'Photos',
    render(): ReactElement { return <CameraRollExample />; }
  }
];
-}
