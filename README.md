<img src="https://github.com/ramakarl/Flock2/blob/main/docs/fig_flock2.jpg" width="800" />

## Flock2: A model for orientation-based social flocking

This repository holds the source code for the paper:<br>
Hoetzlein, Rama. [Flock2: A model for orientation-based social flocking](https://www.sciencedirect.com/science/article/pii/S0022519324001644), Journal of Theoretical Biology, 2024<br>

### Supplementary Video
👉 Supplementary video for the paper can be found here:
[Youtube video: Flock2](https://www.youtube.com/watch?v=GGF28-t4wAY)

### Abstract
The aerial flocking of birds, or murmurations, have fascinated observers while presenting many challenges to behavioral study and simulation. We examine how the periphery of murmurations remain well bounded and cohesive. We also investigate agitation waves, which occur when a flock is disturbed, developing a plausible model for how they might emerge spontaneously. To understand these behaviors a new model is presented for orientation-based social flocking. Previous methods model inter-bird dynamics by considering
the neighborhood around each bird, and introducing forces for avoidance, alignment, and cohesion as three dimensional vectors that alter acceleration. Our method introduces orientation-based social flocking that treats social influences from neighbors more realistically as a desire to turn, indirectly controlling the heading in an aerodynamic model. While our model can be applied to any flocking social bird we simulate flocks of starlings, Sturnus vulgaris, and demonstrate the possibility of orientation waves in the absenc of predators. Our model exhibits spherical and ovoidal flock shapes matching observation. Comparisons of our model to Reynolds' on energy consumption and frequency analysis demonstrates more realistic motions, significantly less energy use in turning, and a plausible mechanism for emergent orientation waves.

### Model Overview
<img src="https://github.com/ramakarl/Flock2/blob/main/docs/fig_models.png" width="800" />

Flock2 is the first orientation-based controller for collective flocking. The classical model by a) Craig Reynolds (1987) implements the social factors for alignment, avoidance and cohesion as 3D vector forces. b) Hildenbrandt et al. (2010) also introduce an aerodynamic model, however, the social forces do not influence the flight forces in their work as they are uncoupled. c) In Flock2 we introduce a high-level social orientation model for heading which directly controls a low-level aerodynamic force model.

Flock2 uses a *perceptual* model of social factors which projects the avoidance, alignment, cohesion influences from nearest neighbors onto the visual sphere of each bird, and then derives a target heading to strictly control an aerodynamic force model. We demonstrate that a flight model directly controlled by a 2D orientation-based high level controller is still able to produce flocking behaviors, including novel features such as emergent orientation waves not previously seen.  

### Aerodynamic Model
Flock2 contains a low-level controller to model the Aerodynamic Forces of each bird. The low-level controller, [Flightsim](https://github.com/ramakarl/flightsim) (https://github.com/ramakarl/flightsim), is fully integrated into Flock2 and does not need to be compiled separately. This aerodynamic model includes lift, gravity and drag, and also exhibits features such as altitude loss during banking, speed changes when diving or climbing, angle-of-attack and stalls. Flightsim is a fixed-wing, single-body force model (SBFM) based on dynamic stability, which is more efficient and less complex that a full aircraft model that iterates over multiple control surfaces. See more details on the motivation and design of [Flightsim here](https://github.com/ramakarl/flightsim). 

## How to Build
### Windows Build
**Updated Nov 2025**<br>
Build with cmake is now simpler and faster.<br>
Libmin dependent code is now directly compiled with each project (no shared or static libs).<br>
Steps:<br>
1. Clone this flock2 repo<br>
2. Clone <a href="https://github.com/ramakarl/libmin">libmin</a> as a sibling folder<br>
<pre>
\codes
 ├── \flock2
 └── \libmin
</pre>
3. Run cmake on flock2.<br>
4. Compile and run.

### Linux Build
**Updated Feb 2026**<br>
1. Clone the flock2 and libmin repos as sibling folders.
2. Modify the build.sh and set CUDA_PATH to your CUDA Toolkit location (run: which nvcc)
3. Set the CUDA_ARCH to your GPU compute capability (hardware arch).
To find your GPU compute capability:
- Locate your card here: <a href="https://developer.nvidia.com/cuda/gpus">https://developer.nvidia.com/cuda/gpus</a>
- Or here (older cards): <a href="https://developer.nvidia.com/cuda/gpus/legacy">https://developer.nvidia.com/cuda/gpus/legacy</a>
- The arch # is simply the compute capability without the dot. eg. 8.9 => 89
- Common ones are: 60=Pascal, 70=Volta, 75=Turing, 80=Ampere, 86=RTX 3x, 89=RTX 4x, 120=RTX 5x
4. Run ./build.sh
5. Run build/flock2
6. For debugging/coding. Enable LINUX_DEBUG in build.sh. A VSCode launch.json has been provided for convenience in debugging. We recommend to open VSCode to the \codes folder (not \codes\flock2), which gives you access to view & modify both \flock2 and \libmin.

Let me know if you have any issues building.

## Contact
Feel free to contact me if you have any questions, comments or suggestions:<br>
**Rama Hoetzlein** <br>
Website: <a href="https://ramakarl.com">ramakarl.com</a><br>
Email: ramahoetzlein@gmail.com<br>

## License & Copyright info
MIT License.<br>
Copyright 2023-2024 (c) Quanta Sciences & Rama Hoetzlein<br>

