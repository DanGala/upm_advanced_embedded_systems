This Spin tutorial shows how to use Spin to find a solution to an algorithmics problem.
The problem consists on 6 frogs, which are initially grouped among 7 nearby rocks in the way that follows:

  Green__Green__Green__Empty__Brown__Brown__Brown

Asuming that the green frogs can only move to the right, the brown frogs can only move to the left and that every move has to follow these rules:

  - A frog can jump to the contiguous rock if it's empty
  - A frog can jump to the rock next to the contigous rock if there's a frog in the contiguous rock and the next rock is empty

The aim is to find an execution trace that leads to the following state:

  Brown__Brown__Brown__Empty__Green__Green__Green

Defining the behavioural model of the frogs and a Linear Temporal Logic rule that ensures that the final state is never met, Spin can be used to simulate every possible execution trace in a non deterministic way and detect _if it exists_ an execution trace for which that LTL rule is broken. That is, a trace for which the final state is met. Adding serial traces with the printf utility a .trail file leading to said trace can be obtained.
