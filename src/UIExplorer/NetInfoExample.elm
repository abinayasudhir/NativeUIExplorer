module UIExplorer.NetInfoExample (..) where

import NativeUi exposing (..)
import NativeUi.Elements exposing (..)
import NativeUi.Style exposing (..)
import NativeUi.Properties as Prop exposing (..)
import NativeUi.Handlers exposing (onPress)


connectionInfoSubscription : NativeUi
connectionInfoSubscription =
  view [] [ string "connectionInfoHistory" ]


connectionInfoCurrent : NativeUi
connectionInfoCurrent =
  view [] [ string "connectionInfo" ]


isConnected : Bool -> NativeUi
isConnected val =
  view
    []
    [ if (val) then
        string "Online"
      else
        string "Offline"
    ]


isConnectionExpensive : Bool -> NativeUi
isConnectionExpensive val =
  view
    []
    [ touchableWithoutFeedback
        []
        [ view
            []
            [ text
                []
                [ if (val) then
                    string "expensive"
                  else
                    string "Non expensive"
                ]
            ]
        ]
    ]


type alias Example =
  { title : String
  , description : String
  , element : NativeUi
  }


example : Example
example =
  { title = ""
  , description = ""
  , element = text [] []
  }


structure : List Example
structure =
  [ { example
      | title = "NetInfo.isConnected"
      , description = "Asynchronously load and observe connectivity"
      , element = isConnected True
    }
  , { example
      | title = "NetInfo.update"
      , description = "Asynchronously load and observe connectionInfo"
      , element = connectionInfoCurrent
    }
  , { example
      | title = "NetInfo.updateHistory"
      , description = "Observed updates to connectionInfo"
      , element = connectionInfoSubscription
    }
  , { example
      | title = "NetInfo.isConnectionExpensive (Android)"
      , description = "Asynchronously check isConnectionExpensive"
      , element = isConnectionExpensive True
    }
  ]



{- onst ConnectionInfoSubscription = React.createClass({
  getInitialState() {
    return {
      connectionInfoHistory: [],
    };
  },
  componentDidMount: function() {
    NetInfo.addEventListener(
        'change',
        this._handleConnectionInfoChange
    );
  },
  componentWillUnmount: function() {
    NetInfo.removeEventListener(
        'change',
        this._handleConnectionInfoChange
    );
  },
  _handleConnectionInfoChange: function(connectionInfo) {
    const connectionInfoHistory = this.state.connectionInfoHistory.slice();
    connectionInfoHistory.push(connectionInfo);
    this.setState({
      connectionInfoHistory,
    });
  },
  render() {
    return (
        <View>
          <Text>{JSON.stringify(this.state.connectionInfoHistory)}</Text>
        </View>
    );
  }
});

const ConnectionInfoCurrent = React.createClass({
  getInitialState() {
    return {
      connectionInfo: null,
    };
  },
  componentDidMount: function() {
    NetInfo.addEventListener(
        'change',
        this._handleConnectionInfoChange
    );
    NetInfo.fetch().done(
        (connectionInfo) => { this.setState({connectionInfo}); }
    );
  },
  componentWillUnmount: function() {
    NetInfo.removeEventListener(
        'change',
        this._handleConnectionInfoChange
    );
  },
  _handleConnectionInfoChange: function(connectionInfo) {
    this.setState({
      connectionInfo,
    });
  },
  render() {
    return (
        <View>
          <Text>{this.state.connectionInfo}</Text>
        </View>
    );
  }
});

const IsConnected = React.createClass({
  getInitialState() {
    return {
      isConnected: null,
    };
  },
  componentDidMount: function() {
    NetInfo.isConnected.addEventListener(
        'change',
        this._handleConnectivityChange
    );
    NetInfo.isConnected.fetch().done(
        (isConnected) => { this.setState({isConnected}); }
    );
  },
  componentWillUnmount: function() {
    NetInfo.isConnected.removeEventListener(
        'change',
        this._handleConnectivityChange
    );
  },
  _handleConnectivityChange: function(isConnected) {
    this.setState({
      isConnected,
    });
  },
  render() {
    return (
        <View>
          <Text>{this.state.isConnected ? 'Online' : 'Offline'}</Text>
        </View>
    );
  }
});

const IsConnectionExpensive = React.createClass({
  getInitialState() {
    return {
      isConnectionExpensive: (null : ?boolean),
    };
  },
  _checkIfExpensive() {
    NetInfo.isConnectionExpensive().then(
        isConnectionExpensive => { this.setState({isConnectionExpensive}); }
    );
  },
  render() {
    return (
        <View>
          <TouchableWithoutFeedback onPress={this._checkIfExpensive}>
            <View>
              <Text>Click to see if connection is expensive:
                {this.state.isConnectionExpensive === true ? 'Expensive' :
                this.state.isConnectionExpensive === false ? 'Not expensive'
                : 'Unknown'}
              </Text>
            </View>
          </TouchableWithoutFeedback>
        </View>
    );
  }
});

exports.title = 'NetInfo';
exports.description = 'Monitor network status';
exports.examples = [
  {
    title: 'NetInfo.isConnected',
    description: 'Asynchronously load and observe connectivity',
    render(): ReactElement { return <IsConnected />; }
  },
  {
    title: 'NetInfo.update',
    description: 'Asynchronously load and observe connectionInfo',
    render(): ReactElement { return <ConnectionInfoCurrent />; }
  },
  {
    title: 'NetInfo.updateHistory',
    description: 'Observed updates to connectionInfo',
    render(): ReactElement { return <ConnectionInfoSubscription />; }
  },
  {
    platform: 'android',
    title: 'NetInfo.isConnectionExpensive (Android)',
    description: 'Asynchronously check isConnectionExpensive',
    render(): ReactElement { return <IsConnectionExpensive />; }
  },
];
-}
