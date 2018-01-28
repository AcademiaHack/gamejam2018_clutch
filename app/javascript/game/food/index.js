import React, { Component } from 'react';
import Slot from '../slot';

export default function Food(props) {
  const { x, y, height, width } = props;
  return (
    <div>
      <Slot height={height} width={width} x={x} y={y} color="green" zIndex={9} />
    </div>
  );
}