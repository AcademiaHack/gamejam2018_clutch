import React, { Component } from 'react';
import Swipeable from 'react-swipeable'
import Slot from '../slot';
import Snake from '../snake';
import Food from '../food';

function convertRemToPixels(rem) {    
    return rem * parseFloat(getComputedStyle(document.documentElement).fontSize);
}

const DOWN = 40, UP = 38, LEFT = 37, RIGHT = 39;
// const BOARD_SIZE = 20;
const SLOT_SIZE = 25;
const WIDTH = window.innerWidth;
const HEIGHT = window.innerHeight;
const PADDING = WIDTH > 767 ? convertRemToPixels(14) : convertRemToPixels(9);
const COLS = Math.floor((WIDTH - PADDING) / SLOT_SIZE);
const ROWS = Math.floor((HEIGHT - PADDING) / SLOT_SIZE);

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
      speed: 300,
      food: this.relocateFood()
    }
  }

  relocateFood = () => {
    let x = Math.floor(Math.random() * COLS) - 1
    let y = Math.floor(Math.random() * ROWS) - 1
    x = x < 1 ? 1 : x
    y = y < 1 ? 1 : y
    return {
      x,
      y
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

  moveSnake = ({x, y}) => {
    if (x < 0) x = COLS;
    if (x > COLS) x = 0;
    if (y < 0) y = ROWS;
    if (y > ROWS) y = 0;
    let tail = [{x, y}, ...this.state.snake.tail];
    tail.pop();
    this.setState({ snake: { ...this.state.snake, tail, x, y } });
  }

  enlarge = nextPos => {
    let tail = [nextPos, ...this.state.snake.tail];
    let speed = this.state.speed;
    speed = speed <= 40 ? speed : speed - 20;
    this.setState({
      snake: { ...this.state.snake, tail, x: nextPos.x, y: nextPos.y },
      food: this.relocateFood(),
      speed
    });
  }

  ate = () => {
    const { food, snake } = this.state;
    return food.x == snake.x && food.y == snake.y;
  }

  hitCollision = ({ x, y }) => {
    const { tail } = this.state.snake;
    if (this.hitTail(x, y)) return true;
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
    return (
      <Swipeable
        preventDefaultTouchmoveEvent={true}
        onSwipedLeft={() => this.handleKey(LEFT)}
        onSwipedRight={() => this.handleKey(RIGHT)}
        onSwipedDown={() => this.handleKey(DOWN)}
        onSwipedUp={() => this.handleKey(UP)}>
        <div style={{
          width: SLOT_SIZE * COLS + 'px',
          height: SLOT_SIZE * ROWS + 'px',
          position: 'relative',
          margin: 'auto'
        }}>
          <Snake height={SLOT_SIZE} width={SLOT_SIZE} {...this.state.snake} />
          <Food height={SLOT_SIZE} width={SLOT_SIZE} {...this.state.food} />
        </div>
      </Swipeable>
    );
  }
}

export default Board;