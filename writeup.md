# **MPC project** 

## Writeup


**Model Predictive Control (MPC) Project**

The goals / steps of this project are the following:
By computing the cross track error (CTE) and considering 100 millisecond latency between actuations commands on top of the connection latenc, we
must implement the Model Predictive Conrol to drive the car around the track.


[//]: # (Image References)

[image1]: ./output/mpc.png "MPC"


### MPC

The following steps were taken in order to implement the Model Predictive Control:
- calculate initial cross track error and orientation error values.
- transforming the points from the map's coordinate system to the car's coordinate system
- fitting the polynomial to the waypoints. I used a polynom of third order.
- evaluating the current state based on that polynomial line
- computing the actuators values from the MPC using the current state
- considering the latency using a predicted state 100ms in the future, replacing the actual state
- calculating the steering and throttle based on the actuator values

### Pipeline
## MPC Model
The model combines the state and actuations (steering angle and acceleration) from teh previous time step in order to compute the state for the current time step based on the following equations:

![alt text][image1]

 In order to have with smoother steering transitions, some weights values were added while computing the cost. For example:

 ```
fg[0] += weight_delta_seq * CppAD::pow(vars[delta_start + t + 1] - vars[delta_start + t], 2);
 ```

This influence the solver into keeping sequential steering values closer together. Several other weights were used.

## Latency
A very important part in the project is the 100 millisecond latency between the actuations commands on top of the connection latency introduced by the simulator.
To account for it, I have added a step to predict where the vehicle would be after 0.1 seconds. This was done by adding a latency parameter in order to compute a new state that account for this delay(Main.cpp: lines 127-138). Then, after updating this "initial" state using the latency I fed the newly state values as well as the cooefficients to the MPC.

```
 const double latency = 0.1;
                    
double pred_px = 0.0 + v * latency; // Since psi is zero, cos(0) = 1, can leave out
const double pred_py = 0.0; // Since sin(0) = 0, y stays as 0 (y + v * 0 * dt)

// Note if δ is positive we rotate counter-clockwise,
// or turn left. In the simulator however,
// a positive value implies a right turn and a negative value implies a left turn. (A)
double pred_psi = 0.0 - v * delta / Lf * latency; //
double pred_v = v + a * latency;
double pred_cte = cte + v * sin(epsi) * latency;
double pred_epsi = epsi - v * delta / Lf * latency; // same as (A)
```

## Timestep Length and Elapsed duration 
The values chosen for N and dt are 10 and 0.1, respectively. These values mean that the optimizer is considering a one-second horizon duration in which to determine a corrective trajectory. Several other values were ested 30/0.03, 20/0.05, etc. Any small modification to N or dt produced a wrong behaviour of the car.


