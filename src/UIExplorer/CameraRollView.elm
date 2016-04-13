module UIExplorer.CameraRollView (..) where

import NativeUi exposing (..)
import NativeUi.Elements exposing (..)
import NativeUi.Style exposing (..)
import NativeUi.Properties as Prop exposing (..)
import NativeUi.Handlers exposing (onPress)


type ViewGroupTypes
  = TypeAlbum
  | TypeAll
  | TypeEvent
  | TypeFaces
  | TypeLibrary
  | TypePhotoStream
  | TypeSavedPhotos


type AssetType
  = AssetPhotos
  | AssetVideos
  | AssetAll


cameraRollView : ViewGroupTypes -> NativeUi
cameraRollView vgt =
  image [ Prop.source (Uri ""), style imageStyle ] []


fetch : NativeUi
fetch =
  listView [ style containerStyle ] []


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
  , width 150
  , height 150
  ]


infoStyle : List Style
infoStyle =
  [ flex 1
  ]


containerStyle : List Style
containerStyle =
  [ flex 1
  ]



{- ar groupByEveryN = require('groupByEveryN');
var logError = require('logError');

var propTypes = {
  /**
   * The group where the photos will be fetched from. Possible
   * values are 'Album', 'All', 'Event', 'Faces', 'Library', 'PhotoStream'
   * and SavedPhotos.
   */
  groupTypes: React.PropTypes.oneOf([
    'Album',
    'All',
    'Event',
    'Faces',
    'Library',
    'PhotoStream',
    'SavedPhotos',
  ]),

  /**
   * Number of images that will be fetched in one page.
   */
  batchSize: React.PropTypes.number,

  /**
   * A function that takes a single image as a parameter and renders it.
   */
  renderImage: React.PropTypes.func,

  /**
   * imagesPerRow: Number of images to be shown in each row.
   */
  imagesPerRow: React.PropTypes.number,

   /**
   * The asset type, one of 'Photos', 'Videos' or 'All'
   */
  assetType: React.PropTypes.oneOf([
    'Photos',
    'Videos',
    'All',
  ]),

};

var CameraRollView = React.createClass({
  propTypes: propTypes,

  getDefaultProps: function(): Object {
    return {
      groupTypes: 'SavedPhotos',
      batchSize: 5,
      imagesPerRow: 1,
      assetType: 'Photos',
      renderImage: function(asset) {
        var imageSize = 150;
        var imageStyle = [styles.image, {width: imageSize, height: imageSize}];
        return (
          <Image
            source={asset.node.image}
            style={imageStyle}
          />
        );
      },
    };
  },

  getInitialState: function() {
    var ds = new ListView.DataSource({rowHasChanged: this._rowHasChanged});

    return {
      assets: ([]: Array<Image>),
      groupTypes: this.props.groupTypes,
      lastCursor: (null : ?string),
      assetType: this.props.assetType,
      noMore: false,
      loadingMore: false,
      dataSource: ds,
    };
  },

  /**
   * This should be called when the image renderer is changed to tell the
   * component to re-render its assets.
   */
  rendererChanged: function() {
    var ds = new ListView.DataSource({rowHasChanged: this._rowHasChanged});
    this.state.dataSource = ds.cloneWithRows(
      groupByEveryN(this.state.assets, this.props.imagesPerRow)
    );
  },

  componentDidMount: function() {
    this.fetch();
  },

  componentWillReceiveProps: function(nextProps: {groupTypes?: string}) {
    if (this.props.groupTypes !== nextProps.groupTypes) {
      this.fetch(true);
    }
  },

  _fetch: function(clear?: boolean) {
    if (clear) {
      this.setState(this.getInitialState(), this.fetch);
      return;
    }

    var fetchParams: Object = {
      first: this.props.batchSize,
      groupTypes: this.props.groupTypes,
      assetType: this.props.assetType,
    };
    if (Platform.OS === "android") {
      // not supported in android
      delete fetchParams.groupTypes;
    }
    if (this.state.lastCursor) {
      fetchParams.after = this.state.lastCursor;
    }

    CameraRoll.getPhotos(fetchParams)
      .then((data) => this._appendAssets(data), (e) => logError(e));
  },

  /**
   * Fetches more images from the camera roll. If clear is set to true, it will
   * set the component to its initial state and re-fetch the images.
   */
  fetch: function(clear?: boolean) {
    if (!this.state.loadingMore) {
      this.setState({loadingMore: true}, () => { this._fetch(clear); });
    }
  },

  render: function() {
    return (
      <ListView
        renderRow={this._renderRow}
        renderFooter={this._renderFooterSpinner}
        onEndReached={this._onEndReached}
        style={styles.container}
        dataSource={this.state.dataSource}
      />
    );
  },

  _rowHasChanged: function(r1: Array<Image>, r2: Array<Image>): boolean {
    if (r1.length !== r2.length) {
      return true;
    }

    for (var i = 0; i < r1.length; i++) {
      if (r1[i] !== r2[i]) {
        return true;
      }
    }

    return false;
  },

  _renderFooterSpinner: function() {
    if (!this.state.noMore) {
      return <ActivityIndicatorIOS style={styles.spinner} />;
    }
    return null;
  },

  // rowData is an array of images
  _renderRow: function(rowData: Array<Image>, sectionID: string, rowID: string)  {
    var images = rowData.map((image) => {
      if (image === null) {
        return null;
      }
      return this.props.renderImage(image);
    });

    return (
      <View style={styles.row}>
        {images}
      </View>
    );
  },

  _appendAssets: function(data: Object) {
    var assets = data.edges;
    var newState: Object = { loadingMore: false };

    if (!data.page_info.has_next_page) {
      newState.noMore = true;
    }

    if (assets.length > 0) {
      newState.lastCursor = data.page_info.end_cursor;
      newState.assets = this.state.assets.concat(assets);
      newState.dataSource = this.state.dataSource.cloneWithRows(
        groupByEveryN(newState.assets, this.props.imagesPerRow)
      );
    }

    this.setState(newState);
  },

  _onEndReached: function() {
    if (!this.state.noMore) {
      this.fetch();
    }
  },
});

var styles = StyleSheet.create({

});

module.exports = CameraRollView;
-}
