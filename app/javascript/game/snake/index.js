import React, { Component } from 'react';
import Slot from '../slot';

export default function Snake(props) {
  const { height, width, tail } = props;
  return (
    <div>
      {tail.map((pos, i) => <Slot key={i} height={height} width={width} x={pos.x} y={pos.y} color="red" zIndex={10} />)}
    </div>
  )
}