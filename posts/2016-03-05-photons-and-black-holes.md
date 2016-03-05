---
title: Photons and black holes
---

In this post, I'll attempt to provide a very tiny introduction to [general relativity](https://en.wikipedia.org/wiki/General_relativity) (actually a very specific part of it) and describe the motion of a photon in the vicinity of a black hole. The goal is to get a grasp of the [gravitational lensing effect](https://en.wikipedia.org/wiki/Gravitational_lens#Explanation_in_terms_of_space.E2.80.93time_curvature) and finally derive the equations of motions for the photon.

Familiarity with basic differential calculus, vector analysis and Lagrangian mechanics is assumed. Knowledge of [Riemannian geometry](https://en.wikipedia.org/wiki/Riemannian_geometry) would really be also necessary. However, this is outside the scope of this post. Instead, I'm trying to scrape the surface just enough to give an intuitive picture of what's happening. For a serious discussion of general relativity, you could consult [Sean Carroll's lecture notes](http://arxiv.org/abs/gr-qc/9712019), for example. If you are already familiar with GR and/or Riemannian geometry, you may well skip to the very last section for the derivation of the equations of motion.

**DISCLAIMER**: I'm still a beginner in the field of GR myself, so there may well be some factual inaccuracies.

### Four-vectors and spacetime intervals
You may know that in Newtonian dynamics, motion of bodies is described by three-dimensional vectors. There are forces acting on the body, causing it to accelerate. Position, acceleration, velocity and force are all vector quantities. These vectors reside in three-dimensional spaces.

Instead of three-dimensional spaces, general relativistic dynamics takes place in *four-dimensional, curved spacetimes*. Let's decipher this. In three-dimensional space, we have vectors with three components, for example the Cartesian $(x, y, z)$. In four-dimensional spacetime, the vectors get a fourth component, namely, time. Our Cartesian vector would then become a *four-vector* $(t, x, y, z)$.

In a three-dimensional *flat* space, the Pythagorean theorem tells us how to calculate distances between two points. In a general spacetime, there is an object called the *metric* which tells us how to compute the inner product of two vectors, thus giving also the norm. The metric is usually given in the form of a squared differential line element (at least in GR). For example, the [Minkowski metric](https://en.wikipedia.org/wiki/Minkowski_space) is given by
$$\mathrm{d}s^2 = -\mathrm{d}t^2 + \mathrm{d}x^2 + \mathrm{d}y^2 + \mathrm{d}z^2,$$
where we've taken the speed of light $c=1$ for convenience. This is the flat spacetime metric that corresponds to special relativity. The negative sign of the $\mathrm{d}t^2$ term tells us that the time component gives a *negative* contribution to the distance. This leads to the conclusion that the time coordinate takes a special role in relativity.

Before proceeding, let me introduce the [Einstein notation](https://en.wikipedia.org/wiki/Einstein_notation). Vectors and other objects with many components, namely [tensors](https://en.wikipedia.org/wiki/Tensor), are written in index form. For example, one may write $x^\mu$ to denote the $\mu$th component of the vector $x^\mu = (x^0, x^1, x^2, x^3)$. The Greek indices like $\mu, \nu$ always take the values $\mu = 0, 1, 2, 3$ whereas Latin indices take values $i = 1, 2, 3$, corresponding to the spatial components of the vectors.

The previously given Minkowski metric may also be written in component form:
$$ \eta_{\mu\nu} = \pmatrix{
                             \eta_{00} & \eta_{01} & \eta_{02} & \eta_{03} \\
                             \eta_{10} & \eta_{11} & \eta_{12} & \eta_{13} \\
                             \eta_{20} & \eta_{21} & \eta_{22} & \eta_{23} \\
                             \eta_{30} & \eta_{31} & \eta_{32} & \eta_{33} }
                 = \pmatrix{ -1 & 0 & 0 & 0 \\
                              0 & 1 & 0 & 0 \\
                              0 & 0 & 1 & 0 \\
                              0 & 0 & 0 & 1 }, $$
where we find that the metric $\eta_{\mu\nu}$ looks like a 4x4 diagonal matrix. In terms of this, the inner product of two vectors $u^\mu$ and $v^\mu$ may be written as
$$ u \cdot v = \sum\limits_{\mu = 0}^3 \sum\limits_{\nu = 0}^3  \eta_{\mu\nu} u^\mu v^\nu \equiv \eta_{\mu\nu} u^\mu v^\nu,$$
where we adopted the Einstein summation convention: repeated indices are implicitly summed over. Thus we may drop the summation signs. Now we may also define the norm of a vector $v^\mu = (t, x, y, z)$ in terms of its inner product with itself:
$$ \Vert v \Vert = \sqrt { -\eta_{\mu\nu} v^\mu v^\nu } = \sqrt { t^2 - x^2 - y^2 - z^2 }, $$
where the minus sign is due to the sign convention of the metric.

If the vector is thought of as the spacetime coordinate displacement between two *events*,
$v^\mu = (\Delta t, \Delta x, \Delta y, \Delta z)$, its norm corresponds to the spacetime interval between the events. We immediately see that if
$$(\Delta t)^2 \lt (\Delta x)^2 + (\Delta y)^2 + (\Delta z)^2 \equiv (\Delta r)^2,$$ the number under the square root is negative and the norm will have an imaginary value. This corresponds to the fact that information can't travel faster than light (remember, we chose $c = 1$) &mdash; if the two events are causally connected, the displacement in the time coordinate must be greater than or equal to the spatial displacement. Visually, this is well described by the past and future [light cones](https://en.wikipedia.org/wiki/Light_cone).

This also leads us to the following classification of spacetime intervals:

* $(\Delta t)^2 \gt (\Delta r)^2$ for a *timelike* interval,
* $(\Delta t)^2 = (\Delta r)^2$ for a *lightlike* interval,
* $(\Delta t)^2 \lt (\Delta r)^2$ for a *spacelike* interval.

For the rest of this post, we will mostly consider lightlike intervals &mdash; these correspond to spacetime displacements of photons. In particular, when a photon travels through the spacetime, the spacetime between any two points of its path will always be zero.

### Curvature and geodesics
Moving further from the flat Minkowski metric, let us consider a general metric $g_{\mu\nu}$. While the components of $\eta_{\mu\nu}$ were constant, nothing prevents the components of $g_{\mu\nu}$ from being coordinate dependent. The consequence of this would be that the geometry of the spacetime changes as a function of the position. In other words, the spacetime is *curved*.

### The Schwarzschild metric

### Null geodesics in Schwarzschild

