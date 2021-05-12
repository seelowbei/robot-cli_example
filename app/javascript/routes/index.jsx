import React from "react";
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import Home from "../components/Home";
import Status from "../components/Status";

export default (
  <Router>
    <Switch>
      <Route path="/" exact component={Home} />
      <Route path="/status" exact component={Status} />
    </Switch>
  </Router>
);