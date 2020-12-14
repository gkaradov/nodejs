import React from "react"


const location = ({ location }) => (
  <div className="location">
    <h1>{location.title}</h1>
    <p>{location.body}</p>
  </div>
)

export default location