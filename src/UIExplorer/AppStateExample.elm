module UIExplorer.AppStateExample (..) where

import NativeUi exposing (..)
import NativeUi.Elements exposing (..)
import NativeUi.Style exposing (..)
import NativeUi.Properties as Prop exposing (..)
import NativeUi.Handlers exposing (onPress)


appStateSubscription : Bool -> String -> String -> NativeUi
appStateSubscription showCurrentOnly appState previousAppStates =
  if (showCurrentOnly) then
    view
      []
      [ text [] [ string appState ]
      ]
  else
    view [] [ text [] [ string previousAppStates ] ]


type alias Example =
  { title : String
  , description : String
  , elements : NativeUi
  }


example : Example
example =
  { title = "AppState.currentState"
  , description = "Can be null on app initialization"
  , elements = text [] [ string "" ]
  }


structure : List Example
structure =
  [ { example
      | title = "AppState.currentState"
      , description = "Can be null on app initialization"
      , elements = text [] [ string "" ]
    }
  , { example
      | title = "AppState.currentState"
      , description = "Can be null on app initialization"
      , elements = appStateSubscription True "" ""
    }
  , { example
      | title = "Previous states:"
      , description = "Can be null on app initialization"
      , elements = appStateSubscription False "" ""
    }
  ]



{- var AppStateSubscription = React.createClass({
  getInitialState() {
    return {
      appState: AppState.currentState,
      previousAppStates: [],
    };
  },
  componentDidMount: function() {
    AppState.addEventListener('change', this._handleAppStateChange);
  },
  componentWillUnmount: function() {
    AppState.removeEventListener('change', this._handleAppStateChange);
  },
  _handleAppStateChange: function(appState) {
    var previousAppStates = this.state.previousAppStates.slice();
    previousAppStates.push(this.state.appState);
    this.setState({
      appState,
      previousAppStates,
    });
  },
  render() {
    if (this.props.showCurrentOnly) {
      return (
        <View>
          <Text>{this.state.appState}</Text>
        </View>
      );
    }
    return (
      <View>
        <Text>{JSON.stringify(this.state.previousAppStates)}</Text>
      </View>
    );
  }
});

exports.title = 'AppState';
exports.description = 'app background status';
exports.examples = [
  {
    title: 'AppState.currentState',
    description: 'Can be null on app initialization',
    render() { return <Text>{AppState.currentState}</Text>; }
  },
  {
    title: 'Subscribed AppState:',
    description: 'This changes according to the current state, so you can only ever see it rendered as "active"',
    render(): ReactElement { return <AppStateSubscription showCurrentOnly={true} />; }
  },
  {
    title: 'Previous states:',
    render(): ReactElement { return <AppStateSubscription showCurrentOnly={false} />; }
  },
];
-}
