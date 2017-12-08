;; This is a program that illustrates building of a
;; neural network using LISP.

;; utils
(defun multiply (a b)
  (loop 
     for i in a
     for j in b
     sum (* i j)))

(defun divide (a b)
  (map 'list #'(lambda (x) (/ a x)) b))

(defun divide-list (a b)
  (map 'list #'(lambda (x) (if (eq b 0) 1 (/ x b))) a))

(defun sigmoid (n)
  (/ 1 (+ 1 (exp (* (- n))))))

(defun sigmoid-prime (n)
  (* (sigmoid n) (- 1 (sigmoid n))))

;; Main functions
(defun neuron (inputs weights)
  (sigmoid (multiply inputs weights)))


(defun set-weights ()
(setq hl-f-w '(0.8 0.2))
(setq hl-s-w '(0.4 0.9))
(setq hl-t-w '(0.3 0.5))

(setq op-neuron-weights
      '(0.3 0.5 0.9)))

(defun hidden-layer ()
  (cons (neuron input hl-f-w)
	(cons  (neuron input hl-s-w)
	       (cons (neuron input hl-t-w) ()))))

(defun print-all-weights ()
  (print hl-f-w)
  (print hl-s-w)
  (print hl-t-w)
  (print op-neuron-weights)
  (print target)
  )
(print-all-weights)

;; backpropagation
;; h-n-i = hidden layer neuron input
(defun h-n-i-one ()
  (multiply input hl-f-w))

(defun h-n-i-two ()
  (multiply input hl-s-w))

(defun h-n-i-three ()
  (multiply input hl-t-w))

(defun delta-output-sum ()
  (* (sigmoid-prime (multiply (hidden-layer) op-neuron-weights)) (- expected target)))

(defun delta-output-sum-prev ()
  (* (sigmoid-prime (multiply (hidden-layer) prev-op-neuron-weights)) (- expected target)))

(defun delta-op-weights ()
  (divide (delta-output-sum) (hidden-layer)))

(setq prev-op-neuron-weights op-neuron-weights)
(defun update-op-neuron ()
  (setq prev-op-neuron-weights op-neuron-weights)
  (setq op-neuron-weights
	(mapcar #'+ op-neuron-weights (delta-op-weights))))


(print-all-weights)

(defun input-hidden-sum ()
  (cons (h-n-i-one) (cons (h-n-i-two) (cons (h-n-i-three) ()))))
(defun delta-hidden-sum ()
  (mapcar #'*  (divide (delta-output-sum-prev) prev-op-neuron-weights)
	  (mapcar #'sigmoid-prime (input-hidden-sum))))

(print prev-op-neuron-weights)
(delta-hidden-sum)

(defun set-first-neuron-weights ()
  (setq hl-f-w (cons (+ (car hl-f-w) (nth 0 (divide-list (delta-hidden-sum) (car input))))
		     (cons (+ (car (cdr hl-f-w)) (nth 0 (divide-list (delta-hidden-sum) (car (cdr input))))) ()))))

(defun set-second-neuron-weights ()
  (setq hl-s-w (cons (+ (car hl-s-w) (nth 1 (divide-list (delta-hidden-sum) (car input))))
		     (cons (+ (car (cdr hl-s-w)) (nth 1 (divide-list (delta-hidden-sum) (car (cdr input))))) ()))))

(defun set-third-neuron-weights ()
  (setq hl-t-w (cons (+ (car hl-t-w) (nth 2 (divide-list (delta-hidden-sum) (car input))))
		     (cons (+ (car (cdr hl-t-w)) (nth 2 (divide-list (delta-hidden-sum) (car (cdr input))))) ()))))

(set-third-neuron-weights)

(defun set-input-weights ()
  (set-first-neuron-weights)
  (set-second-neuron-weights)
  (set-third-neuron-weights))

(setq input '(1 1))
(setq expected 0)
(set-weights)
(setq target (neuron
	      (hidden-layer)
	      op-neuron-weights))

(update-op-neuron)
(set-input-weights)
(print-all-weights)
