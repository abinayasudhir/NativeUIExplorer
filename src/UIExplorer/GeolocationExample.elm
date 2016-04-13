module UIExplorer.GeolocationExample (..) where

import NativeUi exposing (..)
import NativeUi.Elements exposing (..)
import NativeUi.Style exposing (..)
import NativeUi.Properties as Prop exposing (..)
import NativeUi.Handlers exposing (onPress)


geolocationExample : Int -> Int -> Int -> NativeUi
geolocationExample ip lp watchID =
  view
    []
    [ text [] [ string "Initial Position :", string (toString ip) ]
    , text [] [ string "Last Position :", string (toString lp) ]
    ]


type alias Example =
  { title : String
  , elements : NativeUi
  }


titleStyle : List Style
titleStyle =
  [ fontWeight FontWeight500
  ]


example : Example
example =
  { title = ""
  , elements = geolocationExample 1 2 3
  }


structure : Example
structure =
  { example | title = "navigator.geolocation", elements = geolocationExample 1 2 3 }



{- exports.examples = [
  {
    title: 'navigator.geolocation',
    render: function(): ReactElement {
      return <GeolocationExample />;
    },
  }
];

var GeolocationExample = React.createClass({
  watchID: (null: ?number),

  getInitialState: function() {
    return {
      initialPosition: 'unknown',
      lastPosition: 'unknown',
    };
  },

  componentDidMount: function() {
    navigator.geolocation.getCurrentPosition(
      (position) => {
        var initialPosition = JSON.stringify(position);
        this.setState({initialPosition});
      },
      (error) => alert(error.message),
      {enableHighAccuracy: true, timeout: 20000, maximumAge: 1000}
    );
    this.watchID = navigator.geolocation.watchPosition((position) => {
      var lastPosition = JSON.stringify(position);
      this.setState({lastPosition});
    });
  },

  componentWillUnmount: function() {
    navigator.geolocation.clearWatch(this.watchID);
  },

  render: function() {
    return (
      <View>
        <Text>
          <Text style={styles.title}>Initial position: </Text>
          {this.state.initialPosition}
        </Text>
        <Text>
          <Text style={styles.title}>Current position: </Text>
          {this.state.lastPosition}
        </Text>
      </View>
    );
  }
});

var styles = StyleSheet.create({

});
-}
