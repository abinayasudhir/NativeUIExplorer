module UIExplorer.ClipboardExample (..) where

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


update : Action -> a -> a
update action model =
  case action of
    NoOp ->
      model

    Press ->
      model


clipView : String -> List NativeUi -> NativeUi
clipView address model =
  clipboardExample "hello"


clipboardExample : String -> NativeUi
clipboardExample content =
  view
    []
    [ text [] [ string """Tap to put "Hello World" in the clipboard""" ]
    , text [] [ string content ]
    ]



-- var ClipboardExample = React.createClass({
--   getInitialState() {
--     return {
--       content: 'Content will appear here'
--     };
--   },
--
--   async _setClipboardContent(){
--     Clipboard.setString('Hello World');
--     try {
--       var content = await Clipboard.getString();
--       this.setState({content});
--     } catch (e) {
--       this.setState({content:e.message});
--     }
--   },
--
--   render() {
--     return (
--       <View>
--         <Text onPress={this._setClipboardContent} style={{color: 'blue'}}>
--           Tap to put "Hello World" in the clipboard
--         </Text>
--         <Text style={{color: 'red', marginTop: 20}}>
--           {this.state.content}
--         </Text>
--       </View>
--     );
--   }
-- });
--
-- exports.title = 'Clipboard';
-- exports.description = 'Show Clipboard contents.';
-- exports.examples = [
--   {
--     title: 'Clipboard.setString() and getString()',
--     render() {
--       return <ClipboardExample/>;
--     }
--   }
-- ];
