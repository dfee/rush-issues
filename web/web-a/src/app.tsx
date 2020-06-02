import React from "react";
import logo from "./logo.svg";
import "./app.css";
import { wrap } from "@rush-issues/lib-a";

export const App = () => (
  <div className="App">
    <header className="App-header">
      <img src={logo} className="App-logo" alt="logo" />
      <p>{wrap("hello world", "*")}</p>
    </header>
  </div>
);
