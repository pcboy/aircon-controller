import React, { Component } from "react";
import ReactDOM from "react-dom";

import PubNubReact from "pubnub-react";

import { publishKey, subscribeKey } from "./pubnubSecrets";

class App extends Component {
  state = {};

  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.pubnub = new PubNubReact({
      publishKey: publishKey,
      subscribeKey: subscribeKey
    });
    this.pubnub.init(this);
  }

  sendMessage = message => {
    var publishConfig = {
      channel: "commands",
      message: message
    };
    this.pubnub.publish(publishConfig, function(status, response) {
      console.log(status, response);
    });
  };

  render() {
    return (
      <div>
        <button onClick={() => this.sendMessage("shizuka")}>SHIZUKA</button>
        <button onClick={() => this.sendMessage("shizukaHot")}>
          SHIZUKA HOT
        </button>

        <button onClick={() => this.sendMessage("fullSpeed")}>
          FULL SPEED
        </button>
        <button onClick={() => this.sendMessage("powerOff")}>POWER OFF</button>
      </div>
    );
  }
}

ReactDOM.render(<App />, document.getElementById("root"));
