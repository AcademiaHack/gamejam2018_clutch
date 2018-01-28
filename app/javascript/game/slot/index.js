import React, { Component } from 'react';

class Slot extends Component {
  render() {
    const { x, y, height, width, color, zIndex} = this.props;
    return (
      <div style={{
        height: `${height}px`,
        width: `${width}px`,
        position: 'absolute',
        top: `${y * height}px`,
        left: `${x * width}px`,
        backgroundColor: '#484848' || 'white',
        zIndex: zIndex || 1
      }}>
      </div>
    );
  }
}

export default Slot;