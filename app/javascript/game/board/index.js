import React, { Component } from 'react';
import { Swipeable, defineSwipe } from 'react-touch';
import Slot from '../slot';
import Snake from '../snake';
import Food from '../food';

const DOWN = 40, UP = 38, LEFT = 37, RIGHT = 39;
const BOARD_SIZE = 20;

class Board extends Component {
  constructor(props) {
    super(props);
    this.state = this.initialState();
  }

  initialState = () => {
    return {
      snake: {
        x: 0,
        y: 0,
        dir: {
          x: 1,
          y: 0
        },
        tail: [{ x: 0, y: 0 }]
      },
      speed: 400,
      food: this.relocateFood()
    }
  }

  relocateFood = () => {
    const { boardSize = BOARD_SIZE } = this.props;
    return {
      x: Math.floor(Math.random() * boardSize),
      y: Math.floor(Math.random() * boardSize)
    }
  }

  reset = () => {
    this.setState(this.initialState());
  }

  tick = () => {
    const { snake } = this.state;
    const nextPos = this.nextPos();
    if (this.hitCollision(nextPos)) {
      this.reset();
    } else if (this.ate()) {
      this.enlarge(nextPos);
    } else {
      this.moveSnake(nextPos);
    }
    this.delayPlay = false;
    setTimeout(this.tick, this.state.speed);
  }

  moveSnake = nextPos => {
    let tail = [nextPos, ...this.state.snake.tail];
    tail.pop();
    this.setState({ snake: { ...this.state.snake, tail, x: nextPos.x, y: nextPos.y } });
  }

  enlarge = nextPos => {
    let tail = [nextPos, ...this.state.snake.tail];
    this.setState({
      snake: { ...this.state.snake, tail, x: nextPos.x, y: nextPos.y },
      food: this.relocateFood()
    });
  }

  ate = () => {
    const { food, snake } = this.state;
    return food.x == snake.x && food.y == snake.y;
  }

  hitCollision = ({ x, y }) => {
    const { boardSize = BOARD_SIZE } = this.props;
    const { tail } = this.state.snake;
    if (x < 0 || y < 0 || x >= boardSize || y >= boardSize || this.hitTail(x, y)) return true;
  }

  hitTail = (x, y) => {
    const tail = [...this.state.snake.tail]
    return tail.some(pos => pos.x == x && pos.y == y);
  }

  nextPos = () => {
    let { dir, x, y } = this.state.snake;
    x += dir.x;
    y += dir.y;
    return { x, y }
  }

  componentDidMount() {
    document.addEventListener('keydown', event => this.handleKey(event.keyCode));
    setTimeout(this.tick, 1000);
  }

  handleKey = key => {
    if (this.delayPlay) return;
    let snakeDir = this.state.snake.dir;
    let dir = { x: 0, y: 0 };
    if (key == DOWN) {
      if (snakeDir.y == -1) return;
      dir.y = 1;
    } else if (key == UP) {
      if (snakeDir.y == 1) return;
      dir.y = -1;
    } else if (key == LEFT) {
      if (snakeDir.x == 1) return;
      dir.x = -1;
    } else if (key == RIGHT) {
      if (snakeDir.x == -1) return;
      dir.x = 1;
    } else {
      return;
    }
    this.delayPlay = true;
    this.setState({ snake: { ...this.state.snake, dir } });
  }


  render() {
    const { slotSize = 25, boardSize = BOARD_SIZE } = this.props;
    const swipe = defineSwipe({ swipeDistance: 50 });
    let slots = [];
    for (let x = 0; x < boardSize; x++) {
      for (let y = 0; y < boardSize; y++) {
        slots.push(<Slot height={slotSize} width={slotSize} x={x} y={y} />)
      }
    }
    return (
      <Swipeable
        config={swipe}
        onSwipeLeft={() => this.handleKey(LEFT)}
        onSwipeRight={() => this.handleKey(RIGHT)}
        onSwipeDown={() => this.handleKey(DOWN)}
        onSwipeUp={() => this.handleKey(UP)}>
        <div style={{ width: '100vh', height: '100vh' }}>
          {slots}
          <Snake height={slotSize} width={slotSize} {...this.state.snake} />
          <Food height={slotSize} width={slotSize} {...this.state.food} />
        </div>
      </Swipeable>
    );
  }
}

export default Board;