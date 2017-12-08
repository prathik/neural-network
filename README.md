# NEURAL NETWORK IN LISP

This is a neural network implementation of the neural network given in https://stevenmiller888.github.io/mind-how-to-build-a-neural-network/ it has the same structure and is designed for two inputs, a hidden layer with three neurons and a single output neuron.

This was written to demonstrate a neural network in LISP.

This neural network can be used to model any function that takes two binary inputs and produces one binary output.

## Screenshots

Initial weights of the neurons.

![Alt text](/0.png?raw=true "Optional Title")

The initial output comes to 0.77 which is an error of -0.77 (0 - 0.77) where 0 is our expected output.

![Alt text](/1.png?raw=true "Optional Title")

The weights have changed for all the neurons.

![Alt text](/2.png?raw=true "Optional Title")

The next prediction is better at 0.69.

![Alt text](/3.png?raw=true "Optional Title")

Weights for neurons have changed again.

![Alt text](/4.png?raw=true "Optional Title")

Prediction is even better at 0.46.

![Alt text](/5.png?raw=true "Optional Title")

The prediction further improves to 0.36.

![Alt text](/6.png?raw=true "Optional Title")

## Usage

```
;; running the neural network
(setq input '(1 1))
(setq expected 0)
(set-weights)
(setq target (neuron
	      (hidden-layer)
	      op-neuron-weights))

(update-op-neuron)
(set-input-weights)
(print-all-weights)
```

Run the fourth, fifth and sixth line continiously and print the weights to see how the weights of each neuron gets modified.