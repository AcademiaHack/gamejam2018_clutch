import React, { Component } from 'react';
import Slot from '../slot';

class Snake extends Component {
  render() {
    const {height, width, tail} = this.props;
    return (
      <div>
        {tail.map((pos, i) => <Slot key={i} height={height} width={width} x={pos.x} y={pos.y} color="red" zIndex={10}/>)}
      </div>
    );
  }
}

export default Snake;