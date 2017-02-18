---
title: Photons and black holes
math: true
---

In this post, I'll attempt to provide a very tiny introduction to [general relativity (GR)](https://en.wikipedia.org/wiki/General_relativity) (actually a very specific part of it) and describe the motion of a photon in the vicinity of a black hole. The goal is to get a grasp of the [gravitational lensing effect](https://en.wikipedia.org/wiki/Gravitational_lens#Explanation_in_terms_of_space.E2.80.93time_curvature) and finally derive the equations of motion for the photon. The motivation for this is the possibility to use the simple result to efficiently do raytracing in the spacetime surrounding a black hole.

![A raytraced image of the spacetime surrounding a black hole. Some interesting distortion effects can be seen here.](/images/lensing-960.png)

Familiarity with basic differential calculus, vector analysis and Lagrangian mechanics is assumed. Knowledge of [Riemannian geometry](https://en.wikipedia.org/wiki/Riemannian_geometry) would really be also necessary for rigorous mathematical analysis of the subject matter. However, this is outside the scope of this post. Instead, I'm trying to scrape the surface just enough to give an intuitive picture of what's happening. For a serious discussion of general relativity, you could consult [Sean Carroll's lecture notes](http://arxiv.org/abs/gr-qc/9712019), for example. If you are already familiar with GR and/or Riemannian geometry, you may well skip to the very last section for the derivation of the equations of motion. To be fair, though, the proof is pretty standard textbook stuff (found in e.g. Carroll's notes). The reason it is presented here is that one actually doesn't have to consume one textbook's worth of [*g-mu-nu*](https://en.wikipedia.org/wiki/Einstein_notation) to be able to intuitively understand the basic concepts and follow the derivation.

**DISCLAIMER**: I'm still at the beginning of my journey in GR, so you might find some factual inaccuracies and hand-waving. If you feel something should be fixed, please report it at my site's [issue tracker](https://github.com/flannelhead/flannelhead.github.io/issues).

### Four-vectors and spacetime curves
You may know that in Newtonian dynamics, the motion of bodies is described using three-dimensional vectors. There are forces acting on the body, causing it to accelerate. Position, acceleration, velocity and force are all vector quantities. These vectors reside in three-dimensional spaces.

Instead of three-dimensional spaces, general relativistic dynamics takes place in *four-dimensional, curved spacetimes*. Let's try to decipher this. In a three-dimensional space, we have vectors with three components, for example the Cartesian $(x, y, z)$. In four-dimensional spacetime, the vectors get a fourth component, namely, time. Our Cartesian vector would then become a *four-vector* $(t, x, y, z)$.

In a three-dimensional *flat* (i.e. not curved) space, the Pythagorean theorem tells us how to calculate the distance between two points. In a general spacetime, there is an object called the *metric* which tells how to compute the inner product of two vectors, thus giving also the norm and the distance. The metric is usually given in the form of a squared differential spacetime curve element (at least in GR). For example, the [Minkowski metric](https://en.wikipedia.org/wiki/Minkowski_space) is given in natural units (speed of light $c\equiv1$) by
$$
\label{eq:minkowski}
\mathrm{d}s^2 = -\mathrm{d}t^2 + \mathrm{d}x^2 + \mathrm{d}y^2 + \mathrm{d}z^2.$$
This is the flat spacetime metric that is used in special relativity. The negative sign of the $\mathrm{d}t^2$ term tells us that the time component gives a *negative* contribution to the spacetime distance. Thus, the time coordinate must have a special role in relativity. (Here we follow the −+++ convention. Some authors use the +−−− convention, which doesn't change the overall story, but will flip a few signs here and there in the math.)

Consider a particle moving along the $x$-axis at a constant velocity $v$. In other words, we have
$$v \equiv \frac{\mathrm{d}x}{\mathrm{d}t} \implies \mathrm{d}x = v\,\mathrm{d}t$$
and $\mathrm{d}y = \mathrm{d}z = 0$. Plugging these into the expression of the metric yields
$$\mathrm{d}s^2 = (v^2 - 1)\,\mathrm{d}t^2,$$
where $\mathrm{d}t^2$ is clearly positive. *A priori*, we don't know anything about the sign of $\mathrm{d}s^2$. However, we know that no physical particle can exceed the speed of light. Thus, $v \leq c = 1$ and consequently $v^2 - 1 \leq 0$. Then at least for physical particles $\mathrm{d}s^2 \leq 0$. In particular, for photons moving at $v = c = 1$, we have $\mathrm{d}s^2 = 0$.

This also leads us to the following classification of spacetime curves:

* $\mathrm{d}s^2 \lt 0$ for *timelike* curves,
* $\mathrm{d}s^2 = 0$ for *lightlike* curves,
* $\mathrm{d}s^2 \gt 0$ for *spacelike* curves.

For the rest of this post, we will mostly consider lightlike curves &mdash; these correspond to the motion of photons. Similarly, timelike curves will correspond to massive particles.

### Curvature and geodesics
Moving further from the flat Minkowski metric, let us consider a more generic case. While the Minkowski metric $\eqref{eq:minkowski}$ didn't explicitly depend on any of the coordinates $(t, x, y, z)$, nothing prevents an arbitrary metric from doing so. The consequence of this would be that the geometry of the spacetime changes with the position, i.e. the spacetime is somehow *curved*. What could generate such curvature?

General relativity, at its core, is a theory of gravitation. In Newtonian mechanics, gravitation is seen as an interaction between massive bodies, i.e. there is a gravitational force. This couldn't obviously explain the curvature of photons' trajectories near massive bodies. A better explanation is clearly required.

In general relativity, conversely, gravitation is *not a force at all*. Instead, the [Einstein field equations](https://en.wikipedia.org/wiki/Einstein_field_equations) tell us that mass and energy *generate* the spacetime curvature, which we observe as gravitational interaction. The field equations are complicated and we won't discuss them much further, but it's important to recognize mass as a source of curvature. Given the distribution of mass and energy in the spacetime, one can solve the Einstein field equations for the metric. The equations can be though of as a general relativistic analogue of the [gravitational Poisson equation](https://en.wikipedia.org/wiki/Gauss's_law_for_gravity#Differential_form), where the spatial mass density is identified as a source of the gravitational force.

If there's no force acting on a Newtonian particle, it moves in a straight line at a constant velocity, as there is nothing to accelerate it. In this sense, a photon is clearly a free particle and should move in a straight path.

Let's try to think about this in curved spacetimes. The first problem we encounter is that the notion of a straight line becomes vague. However, we already know how to generalize it! Imagine yourself at the north pole of the Earth, wanting to move straight to [Jyväskylä](https://en.wikipedia.org/wiki/Jyv%C3%A4skyl%C3%A4). The movement happens along the surface of the Earth. There clearly is a single, shortest possible path connecting the North pole and Jyväskylä. The shortest possible path along a surface *is*, loosely speaking, the generalization of a straight line and it's called a [geodesic](https://en.wikipedia.org/wiki/Geodesic). General relativistic geodesics are curves of minimal spacetime length.

Returning to the case of the free photon, it can be actually proven that photons move along geodesics. Moreover, for these geodesics $\mathrm{d}s^2 = 0$ &mdash; they are called *null* geodesics.

The next question is if we have a means of computing the geodesics. If you have done any variational calculus or Lagrangian mechanics, minimizing the path length might sound familiar. Let's try and formulate this as a variational problem! We could take an [action](https://en.wikipedia.org/wiki/Action_%28physics%29) corresponding to the path length and parametrize it by some parameter $\lambda$:
$$ S = \int \mathrm{d}s 
= \int \frac{\mathrm{d}s}{\mathrm{d}\lambda}\,\mathrm{d}\lambda
= \int \sqrt{\left(
    \frac{\mathrm{d}s}{\mathrm{d}\lambda}
    \right)^2}\,\mathrm{d}\lambda. $$
From here we identify that this action corresponds to the Lagrangian
$$ L \equiv \left(\frac{\mathrm{d}s}{\mathrm{d}\lambda}\right)^2. $$ N.B. the actual Lagrangian would be the square root of this one! However, the square version [yields the same equations](http://physics.stackexchange.com/questions/149082/geodesic-equation-from-variation-is-the-squared-lagrangian-equivalent) and hence it is used for convenience.
The curves of extremal length will then be solutions of the Euler&ndash;Lagrange equations (*ELE*, one for each coordinate $x^\mu$, where $\mu = 0, 1, 2, 3$):
$$
\label{eq:ele}
\frac{\partial L}{\partial x^\mu} - \frac{\mathrm{d}}{\mathrm{d}\lambda}
\frac{\partial L}{\partial \dot{x}^\mu} = 0, $$
where $\dot{x}^\mu \equiv \frac{\mathrm{d} x^\mu}{\mathrm{d}\lambda}$. While it is not immediately obvious that the solutions actually *minimize* the path length, under stricter analysis it turns out that these very equations *are* exactly the geodesic equations. The Lagrangian formalism is also arguably the least painful way of calculating the geodesics, so for the purposes of this article, we happily adopt it.

Can we recover any familiar results from this? For the Minkowski metric $\eqref{eq:minkowski}$ given earlier, the Lagrangian reads:
$$ \begin{align}
L = \left(\frac{\mathrm{d}s}{\mathrm{d}\lambda}\right)^2
&= -\left(\frac{\mathrm{d}t}{\mathrm{d}\lambda}\right)^2
+ \left(\frac{\mathrm{d}x}{\mathrm{d}\lambda}\right)^2
+ \left(\frac{\mathrm{d}y}{\mathrm{d}\lambda}\right)^2
+ \left(\frac{\mathrm{d}z}{\mathrm{d}\lambda}\right)^2 \\
& = -\dot{t}^2 + \dot{x}^2 + \dot{y}^2 + \dot{z}^2.
\end{align}
$$
The ELE for the $t$ component then becomes
$$ \frac{\partial L}{\partial t} - \frac{\mathrm{d}}{\mathrm{d}\lambda}
\frac{\partial L}{\partial \dot{t}}
= 0 - \frac{\mathrm{d}}{\mathrm{d}\lambda}(-2\dot{t})
= -2 \ddot{t}
= 0 \iff \ddot{t} = 0,$$
where $\ddot{t} \equiv \frac{\mathrm{d}^2 t}{\mathrm{d}\lambda^2}$.
The solution of this second-order differential equation is $t(\lambda) = a\lambda + b$, where $a, b$ are constants that will be fixed by the initial conditions. Ok, so the time coordinate is a linear ([affine](http://mathworld.wolfram.com/AffineFunction.html), to be precise) function of the curve parameter? Seems fine, let's proceed with the spatial coordinates. The equations for $\mathbf{x} = (x, y, z)$ will be identical to the one for $t$:
$$\ddot{\mathbf{x}} = 0,$$
and thus we'll have $\mathbf{x}(\lambda) = \mathbf{c}\lambda + \mathbf{d}$, where the constant vectors $\mathbf{c}, \mathbf{d}$ will be again bound by the initial conditions. What we have here is a linear function of $\lambda$ $\iff$ *a straight line*. Hooray! The geodesics of a flat spacetime *are* straight lines! Backward checks like this are often useful when trying to generalize a mathematical concept.

### The Schwarzschild metric
Now we are ready to discuss the spacetime outside a black hole. More specifically, we will focus on [non-rotating black holes](https://en.wikipedia.org/wiki/Schwarzschild_metric). The [rotating case](https://en.wikipedia.org/wiki/Kerr_metric) is much more complicated.

The metric corresponding to the spacetime surrounding a spherically symmetric, massive object is called the Schwarzschild metric. It looks like this:
$$ \mathrm{d}s^2 = -\left(1 - \frac{r_s}{r}\right)\mathrm{d}t^2
+ \left(1 - \frac{r_s}{r}\right)^{-1}\mathrm{d}r^2
+ r^2 (\mathrm{d}\theta + \sin^2 \theta \, \mathrm{d}\phi^2),$$
where the *Schwarzschild radius* is defined as $r_s \equiv 2GM$, $G$ being the gravitational constant and $M$ the mass of the object. Due to the spherical symmetry, the metric is given in spherical coordinates $(t, r, \theta, \phi)$. This metric is a valid solution of the Einstein field equations only for $r > r_s$.

What if the object so dense that its physical radius is smaller than $r_s$? At the radius $r_s$ lies what is known as the [event horizon](https://en.wikipedia.org/wiki/Event_horizon): any light or matter inside the event horizon can't possibly escape. If we look at the event horizon from the outside, there is absolutely no light coming from it: it is entirely black. This is where the notion of a black hole comes from.

### Null geodesics of the Schwarzschild spacetime
The above Schwarzschild metric looks quite complicated. One can most certainly write down the Lagrangian and find the geodesic equations, but it is unclear if they yield any intuitive results. Due to the symmetries of the Schwarzschild spacetime we may, however, simplify the metric a little bit before proceeding.

First of all, we set $r_s = 1$. This is merely a scaling of length. Second, it is known that for *orbits*, we may always rotate the coordinates so that $\theta = \frac{\pi}{2}$ and carry out the calculations in the equatorial plane. With these simplifications, the metric becomes
$$ \mathrm{d}s^2 = -\left(1 - \frac{1}{r}\right)\mathrm{d}t^2
+ \left(1 - \frac{1}{r}\right)^{-1}\mathrm{d}r^2
+ r^2  \, \mathrm{d}\phi^2.$$
Much simpler, isn't it? From the symmetry of the Schwarzschild metric it follows that the geodesics will always be situated on some plane, i.e. they are orbits. Thus, we haven't lost any generality here.

Let us then try our luck with the geodesic (Euler-Lagrange) equations $\eqref{eq:ele}$. The Lagrangian is
$$ L = -\left(1 - \frac{1}{r}\right)\dot{t}^2
+ \left(1 - \frac{1}{r}\right)^{-1}\dot{r}^2
+ r^2 \dot{\phi}^2.$$
The ELE for the $t$ coordinate gives
$$ \frac{\partial L}{\partial t} - \frac{\mathrm{d}}{\mathrm{d}\lambda}
\frac{\partial L}{\partial \dot{t}}
= 0 - \frac{\mathrm{d}}{\mathrm{d}\lambda}
\left[\left(1 - \frac{1}{r}\right)\dot{t}\right] = 0.$$
This tells us that there is a quantity whose derivative vanishes, in other words it remains constant with respect to the curve parameter $\lambda$. Quantities like this are called *constants of motion*. We can call it $k$:
$$ k \equiv \left(1 - \frac{1}{r}\right)\dot{t}. $$
We got this result because the Lagrangian didn't explicitly depend on time. Thus, this constant of motion corresponds to the invariance of the Lagrangian in translations of time. Based on our prior knowledge on classical dynamics (and [Noether's theorem](https://en.wikipedia.org/wiki/Noether's_theorem)), we may conclude that this constant $k$ must be somehow related to the energy.

Could we dig up another constant of motion? There seems to be an explicit dependency on $r$ in the Lagrangian. On the other hand, $\phi$ doesn't appear there at all. The ELE for $\phi$ is
$$ \frac{\partial L}{\partial \phi} - \frac{\mathrm{d}}{\mathrm{d}\lambda}
\frac{\partial L}{\partial \dot{\phi}}
= 0 - \frac{\mathrm{d}}{\mathrm{d}\lambda}
\left(2r^2 \dot{\phi}\right) = 0.$$
It seems there indeed is another constant of motion, namely
$$
\label{eq:angular}
h \equiv r^2 \dot{\phi}.
$$
As $\phi$ the angle with respect to the rotation axis of the orbital motion, $h$ is clearly related to the angular momentum, which is conserved.

Now, remembering that we defined the Lagrangian as
$$ L = \left( \frac{\mathrm{d}s}{\mathrm{d}\lambda} \right)^2, $$
and restricting the discussion strictly to lightlike curves, $\mathrm{d}s^2 = 0$, we find
$$ L = \left( 1 - \frac{1}{r} \right)^{-1} (\dot{r}^2 - k^2) + \frac{h^2}{r^2} = 0, $$
where we used the constants of motion to eliminate $\dot{t}$ and $\dot{\phi}$. We're left with a relatively simple differential equation for $r$. We have effectively reduced the description of the motion to just the radial coordinate! Manipulating the equation a little bit further and multiplying through by $\frac{1}{2}$ we get
$$
\frac{1}{2}k^2 = \frac{1}{2}\dot{r}^2 + \frac{h^2}{2r^2} - \frac{h^2}{2r^3}.
\label{eq:radial}
$$
At this point, we must squint a little bit. If we take a Newtonian particle with $m = 1$ in one-dimensional motion (in the coordinate $r$), $\frac{1}{2} \dot{r}^2$ seems to be the kinetic energy of the particle. On the other hand, earlier we recognized $k$ as an energy quantity. The above equation then seems to be analogous with the energy conservation law of a Newtonian system, where we can identify the potential energy as
$$
V(r) = \frac{h^2}{2r^2} - \frac{h^2}{2r^3}.
$$
The first term looks familiar. If we take $h$ as the classical angular momentum, it *is* the [effective "centrifugal" potential](https://en.wikipedia.org/wiki/Effective_potential) that is used when describing particles in central force fields using just the radial coordinate. The analogy feels right, since $h = r^2 \dot{\phi}$ seems just like the classical angular momentum of a particle with $m = 1$. The choice of a non-inertial (rotating) frame of reference gives rise to this effective potential, and in some inertial frame it will vanish.

The latter term, $-\frac{h^2}{2r^3}$, is something new to us. It is a radial $\frac{1}{r^3}$-potential which is coupled to the particle by its angular momentum. This is genuinely an effect of general relativity, and it is responsible for the bending of light near massive bodies, leading to the gravitational lensing effect.

Going just a tad further and switching to a three-dimensional inertial frame of reference, the potential becomes just the simple
$$ V(r) = -\frac{h^2}{2r^3}. $$
Finally, we may write Newton's second law for our little "test particle" as
$$ \mathbf{F}(\mathbf{r}) = -\nabla V(r)
= -\frac{3}{2} h^2 \frac{\hat{\mathbf{r}}}{r^4} = \ddot{\mathbf{r}},
\label{eq:eom}
$$
where $\mathbf{r} = (x, y, z)$ are the Cartesian coordinates of the particle,
$\hat{\mathbf{r}}$ is the unit direction vector, $\ddot{\mathbf{r}}$ is the acceleration and $r = \vert \mathbf{r} \vert$.

Let me remind you that these are not the real equations of motion for the photon. The real equations of motion would have been achieved by calculating all of the geodesic equations from the Lagrangian. There are four of them instead of the above three equations (in vector form). Remember, we identified the radial equation of the massless photon with a Newtonian, massive particle in orbital motion. In addition, the coordinate time of the Schwarzschild spacetime doesn't have anything to do with the time in the Newtonian system. Obviously these two systems cannot be physically similar. However, the three spatial equations will generate the exact same spatial trajectory (but with different parametrization) as the real geodesic equations would, and they were relatively easily achieved. As a bonus, they are easy to solve numerically, which [I have done](https://github.com/flannelhead/blackstar).
