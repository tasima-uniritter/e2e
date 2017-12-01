import { Component } from 'preact';
import styled, { injectGlobal } from 'styled-components';
import { replace, pipe, split, map } from 'ramda';

injectGlobal`
  * {
    box-sizing: border-box;
    font-family: Helvetica;
  }

  body {
    background: #404040;
  }
`;

const Calculator = styled.div`
  width: 400px;
  position: absolute;
  height: 600px;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  border-radius: 10px;
  overflow: hidden;
  background: #000;
  border: 2px solid #fff;
`;

const Display = styled.div`
  float: left;
  width: 100%;
  height: 20%;
  border-bottom: 1px solid #FFF;
  color: #FFF;
  padding: 20px;
`;

const InnerDisplay = styled.div`
  float: left;
  width: 100%;
  height: 100%;
  text-align: right;
  font-size: 40px;
  line-height: 58px;
  padding: 10px;
  border-radius: 10px;
  border: 2px solid #FFF;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  background: #404040;
`;

const Wrapper = styled.div`
  float: left;
  width: 100%;
  height: 80%;
`;

const Button = styled.button`
  float: left;
  width: 25%;
  height: 22.5%;
  background: #000;
  color: #FFF;
  font-size: 30px;
  border: 1px solid #FFF;
`;

const Equal = styled(Button)`
  background: #ff9b2b;
`;

const Operator = styled(Button)`
  background: #404040;
`;

const Clear = styled(Button)`
  float: left;
  width: 100%;
  text-transform: uppercase;
  font-size: 20px;
  font-weight: bold;
  height: 10%;
  background: #ff9b2b;
`;

const expressions = {
  '+': (a, b) => a + b,
  '-': (a, b) => a - b,
  '*': (a, b) => a * b,
  '/': (a, b) => a / b,
};

const stripOperators = pipe(
  replace('+', ' '),
  replace('-', ' '),
  replace('*', ' '),
  replace('/', ' ')
);

const parseValues = pipe(
  stripOperators,
  split(' '),
  map(parseInt)
);

export default class App extends Component {
  state = {
    value: '',
  }

  onClick = (value) => {
    this.setState({
      value: this.state.value + value,
    });
  };

  onClear = () => {
    this.setState({
      value: '',
    })
  }

  onEqualClick = () => {
    const operator = this.state.value.replace(/\d/g,'');
    const [a, b] = parseValues(this.state.value);

    this.setState({
      value: expressions[operator](a, b),
    });
  };

  render() {
    const { value } = this.state;

    return (
      <Calculator>
        <Display>
          <InnerDisplay>
            {value}
          </InnerDisplay>
        </Display>
        <Wrapper>
          <Clear onClick={this.onClear}>Clear</Clear>
          <Button onClick={() => this.onClick(7)}>7</Button>
          <Button onClick={() => this.onClick(8)}>8</Button>
          <Button onClick={() => this.onClick(9)}>9</Button>
          <Operator onClick={() => this.onClick('/')}>/</Operator>
          <Button onClick={() => this.onClick(4)}>4</Button>
          <Button onClick={() => this.onClick(5)}>5</Button>
          <Button onClick={() => this.onClick(6)}>6</Button>
          <Operator onClick={() => this.onClick('*')}>X</Operator>
          <Button onClick={() => this.onClick(1)}>1</Button>
          <Button onClick={() => this.onClick(2)}>2</Button>
          <Button onClick={() => this.onClick(3)}>3</Button>
          <Operator onClick={() => this.onClick('-')}>-</Operator>
          <Button onClick={() => this.onClick(0)}>0</Button>
          <Button onClick={() => this.onClick('.')}>.</Button>
          <Equal onClick={this.onEqualClick}>=</Equal>
          <Operator onClick={() => this.onClick('+')}>+</Operator>
        </Wrapper>
      </Calculator>
    );
  }
}

