---
title: Photons and black holes
---

In this post, I'll attempt to provide a very tiny introduction to [general relativity (GR)](https://en.wikipedia.org/wiki/General_relativity) (actually a very specific part of it) and describe the motion of a photon in the vicinity of a black hole. The goal is to get a grasp of the [gravitational lensing effect](https://en.wikipedia.org/wiki/Gravitational_lens#Explanation_in_terms_of_space.E2.80.93time_curvature) and finally derive the equations of motion for the photon.

Familiarity with basic differential calculus, vector analysis and Lagrangian mechanics is assumed. Knowledge of [Riemannian geometry](https://en.wikipedia.org/wiki/Riemannian_geometry) would really be also necessary. However, this is outside the scope of this post. Instead, I'm trying to scrape the surface just enough to give an intuitive picture of what's happening. For a serious discussion of general relativity, you could consult [Sean Carroll's lecture notes](http://arxiv.org/abs/gr-qc/9712019), for example. If you are already familiar with GR and/or Riemannian geometry, you may well skip to the very last section for the derivation of the equations of motion.

**DISCLAIMER**: I'm still a beginner in GR myself, so you might find some factual inaccuracies and hand-waving.

### Four-vectors and spacetime curves
You may know that in Newtonian dynamics, the motion of bodies is described by three-dimensional vectors. There are forces acting on the body, causing it to accelerate. Position, acceleration, velocity and force are all vector quantities. These vectors reside in three-dimensional spaces.

Instead of three-dimensional spaces, general relativistic dynamics takes place in *four-dimensional, curved spacetimes*. Let's try to decipher this. In three-dimensional space, we have vectors with three components, for example the Cartesian $(x, y, z)$. In four-dimensional spacetime, the vectors get a fourth component, namely, time. Our Cartesian vector would then become a *four-vector* $(t, x, y, z)$.

In a three-dimensional *flat* (i.e. not curved) space, the Pythagorean theorem tells us how to calculate the distance between two points. In a general spacetime, there is an object called the *metric* which tells how to compute the inner product of two vectors, thus giving also the norm and the distance. The metric is usually given in the form of a squared differential spacetime curve element (at least in GR). For example, the [Minkowski metric](https://en.wikipedia.org/wiki/Minkowski_space) is given in natural units (speed of light $c\equiv1$) by
$$\mathrm{d}s^2 = -\mathrm{d}t^2 + \mathrm{d}x^2 + \mathrm{d}y^2 + \mathrm{d}z^2.$$
This is the flat spacetime metric that is used in special relativity. The negative sign of the $\mathrm{d}t^2$ term tells us that the time component gives a *negative* contribution to the spacetime distance. Thus, the time coordinate must have a special role in relativity.

Consider a particle moving along the $x$-axis at a constant velocity $v$. In other words, we have
$$v \equiv \frac{\mathrm{d}x}{\mathrm{d}t} \implies \mathrm{d}x = v\,\mathrm{d}t$$
and $\mathrm{d}y = \mathrm{d}z = 0$. Plugging these into the expression of the metric yields
$$\mathrm{d}s^2 = (v^2 - 1)\,\mathrm{d}t^2,$$
where $\mathrm{d}t^2$ is clearly positive. *A priori*, we don't know anything about the sign of $\mathrm{d}s^2$. However, we know that no physical particle can travel faster than the speed of light. Thus, $v \leq c = 1$ and consequently $v^2 - 1 \leq 0$. Then at least for particles $\mathrm{d}s^2 \leq 0$. In particular, for photons moving at $v = c = 1$, we have $\mathrm{d}s^2 = 0$.

This also leads us to the following classification of spacetime curves:

* $\mathrm{d}s^2 \lt 0$ for *timelike* curves,
* $\mathrm{d}s^2 = 0$ for *lightlike* curves,
* $\mathrm{d}s^2 \gt 0$ for *spacelike* curves.

For the rest of this post, we will mostly consider lightlike curves &mdash; these correspond to the motion of photons. Similarly, timelike curves will correspond to massive, physical particles.

### Curvature and geodesics
Moving further from the flat Minkowski metric, let us consider a general metric. While the Minkowski metric didn't explicitly depend on any of the coordinates $(t, x, y, z)$, nothing prevents a general metric from doing so. The consequence of this would be that the geometry of the spacetime changes with the position, i.e. the spacetime is somehow *curved*. What could generate such curvature?

General relativity, at its core, is a theory of gravitation. In Newtonian mechanics, gravitation is seen as an interaction between massive bodies, i.e. there is a gravitational force. This couldn't obviously explain the curvature of photons' trajectories near massive bodies. A better explanation is clearly required.

In general relativity, conversely, gravitation is *not a force at all*. Instead, the [Einstein field equations](https://en.wikipedia.org/wiki/Einstein_field_equations) tell us that mass and energy *generate* the spacetime curvature, which we observe as gravitational interaction. The field equations are complicated and we won't discuss them further, but it's important to recognize mass as a source of curvature.

If there's no force acting on a Newtonian particle, it moves in a straight line at a constant velocity, as there is nothing to accelerate it. In this sense, a photon is clearly a free particle and should move in a straight path.

Let's try to generalize this into curved spacetimes. The first problem we encounter is that the notion of a straight line becomes vague. However, we already know how to generalize this! Imagine yourself at the north pole of the Earth, wanting to move straight to [Jyväskylä](https://en.wikipedia.org/wiki/Jyv%C3%A4skyl%C3%A4). The movement happens along the surface of the Earth. There clearly is a single, shortest possible path connecting the North pole and Jyväskylä. The shortest possible path along a surface *is*, loosely speaking, the generalization of a straight line and it's called a [geodesic](https://en.wikipedia.org/wiki/Geodesic). General relativistic geodesics are curves of minimal spacetime length.

Returning to the case of the free photon, it can be actually proven that photons move along geodesics. Moreover, for these geodesics $\mathrm{d}s^2 = 0$ &mdash; they are called *null* geodesics.

The next questions is if we do have a means of computing the geodesics. If you have done any variational calculus or Lagrangian mechanics, minimizing the path length might sound familiar. Let's try and formulate this as a variational problem! We could take an [action](https://en.wikipedia.org/wiki/Action_%28physics%29) corresponding to the path length and parametrize it by some parameter $\lambda$:
$$ S = \int \mathrm{d}s 
= \int \frac{\mathrm{d}s}{\mathrm{d}\lambda}\,\mathrm{d}\lambda
= \int \sqrt{\left(
    \frac{\mathrm{d}s}{\mathrm{d}\lambda}
    \right)^2}\,\mathrm{d}\lambda. $$
From here we identify that this action corresponds to the Lagrangian
$$ L \equiv \left(\frac{\mathrm{d}s}{\mathrm{d}\lambda}\right)^2, $$
and the curves of extremal length will be solutions of the Euler&ndash;Lagrange equations (*ELE*, one for each coordinate $x^\mu$, where $\mu = 0, 1, 2, 3$):
$$ \frac{\partial L}{\partial x^\mu} - \frac{\mathrm{d}}{\mathrm{d}\lambda}
\frac{\partial L}{\partial \dot{x}^\mu} = 0, $$
where $\dot{x}^\mu \equiv \mathrm{d} x^\mu / \mathrm{d}\lambda$.

Can we recover any familiar results from this? For the Minkowski metric given earlier, the Lagrangian reads:
$$ L = \left(\frac{\mathrm{d}s}{\mathrm{d}\lambda}\right)^2
= -\left(\frac{\mathrm{d}t}{\mathrm{d}\lambda}\right)^2
+ \left(\frac{\mathrm{d}x}{\mathrm{d}\lambda}\right)^2
+ \left(\frac{\mathrm{d}y}{\mathrm{d}\lambda}\right)^2
+ \left(\frac{\mathrm{d}z}{\mathrm{d}\lambda}\right)^2.
$$
The ELE for the $t$ component then becomes
$$ \frac{\partial L}{\partial t} - \frac{\mathrm{d}}{\mathrm{d}\lambda}
\frac{\partial L}{\partial \dot{t}}
= 0 - (-2)\frac{\mathrm{d}^2 t}{\mathrm{d}\lambda^2} = 0 \iff
\frac{\mathrm{d}^2 t}{\mathrm{d}\lambda^2} = 0.
$$
The solution to this is $t(\lambda) = a\lambda + b$, where $a, b$ are constants that will be fixed by the initial conditions. Ok, so the time coordinate is a linear function of the curve parameter? Seems fine, let's proceed with the spatial coordinates. The equations for $x, y, z$ will be identical:
$$\frac{\mathrm{d}^2 x}{\mathrm{d}\lambda^2} = 0,$$
and thus we'll have $x(\lambda) = c\lambda + d$, where $c, d$ will be again bound by the initial conditions. What do we have here is a linear function of $\lambda$ $\iff$ *a straight line*. Hooray! The geodesics of a flat spacetime *are* straight lines! Backward checks like this are often useful when trying to generalize a mathematical concept.

### The Schwarzschild metric

### Null geodesics in Schwarzschild

