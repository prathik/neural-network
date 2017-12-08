# NEURAL NETWORK IN LISP

This is a neural network implementation of the neural network given in https://stevenmiller888.github.io/mind-how-to-build-a-neural-network/ it has the same structure and is designed for two inputs, a hidden layer with three neurons and a single output neuron.

This was written to demonstrate a neural network in LISP.

This neural network can be used to model any function that takes two binary inputs and produces one binary output.

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
```lisp

Run the fourth, fifth and sixth line continiously and print the weights to see how the weights of each neuron gets modified.