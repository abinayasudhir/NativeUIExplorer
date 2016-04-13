module UIExplorer.LinkingExample (..) where

import NativeUi exposing (..)
import NativeUi.Elements exposing (..)
import NativeUi.Style exposing (..)
import NativeUi.Properties exposing (underlayColor)
import NativeUi.Handlers exposing (onPress)
import UIExplorer.UIExplorerBlock exposing (..)


openURLButton : String -> NativeUi
openURLButton url =
  touchableNativeFeedback [] [ view [ style buttonStyle ] [ text [ style textStyle ] [ string ("Open" ++ url) ] ] ]


intentAndroidExample : NativeUi
intentAndroidExample =
  uIExplorerBlock "title" "description" [ openURLButton "url", openURLButton "hello", openURLButton "url", openURLButton "url", openURLButton "url", openURLButton "url" ]


containerStyle : List Style
containerStyle =
  [ flex 1
  , backgroundColor "white"
  , padding 10
  , paddingTop 30
  ]


buttonStyle : List Style
buttonStyle =
  [ padding 10
  , backgroundColor "#3B5998"
  , marginBottom 10
  ]


textStyle : List Style
textStyle =
  [ color "white"
  ]



{-
var UIExplorerBlock = require('./UIExplorerBlock');

var OpenURLButton = React.createClass({

  propTypes: {
    url: React.PropTypes.string,
  },

  handleClick: function() {
    Linking.canOpenURL(this.props.url).then(supported => {
      if (supported) {
        Linking.openURL(this.props.url);
      } else {
        console.log('Don\'t know how to open URI: ' + this.props.url);
      }
    });
  },

  render: function() {
    return (
      <TouchableNativeFeedback
        onPress={this.handleClick}>
        <View style={styles.button}>
          <Text style={styles.text}>Open {this.props.url}</Text>
        </View>
      </TouchableNativeFeedback>
    );
  }
});

var IntentAndroidExample = React.createClass({

  statics: {
    title: 'Linking',
    description: 'Shows how to use Linking to open URLs.',
  },

  render: function() {
    return (
      <UIExplorerBlock title="Open external URLs">
        <OpenURLButton url={'https://www.facebook.com'} />
        <OpenURLButton url={'http://www.facebook.com'} />
        <OpenURLButton url={'http://facebook.com'} />
        <OpenURLButton url={'fb://notifications'} />
        <OpenURLButton url={'geo:37.484847,-122.148386'} />
        <OpenURLButton url={'tel:9876543210'} />
      </UIExplorerBlock>
    );
  },
});


module.exports = IntentAndroidExample;
-}
