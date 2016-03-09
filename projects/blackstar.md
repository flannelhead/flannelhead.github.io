---
title: Blackstar
synopsis: Raytracing black holes with Haskell
---

General relativity is cool. Some of the ideas introduced there (especially when it comes to Riemannian geometry) are conceptually so simple and beautiful that I can't help but appreciate Einstein's work.

When I saw [Interstellar](http://www.imdb.com/title/tt0816692/) in 2014, I was especially amazed by the black hole, Gargantua, that they had rendered. There's no doubt the artistic license was extensively used there, but still, they used the [Kerr metric](https://en.wikipedia.org/wiki/Kerr_metric) to describe a spinning black hole and even published [a scientific paper](http://arxiv.org/pdf/1502.03808v2.pdf) about it.

Then, a few months later, [rantonels](http://rantonels.github.io/)' [excellent article](http://rantonels.github.io/starless/) and [Python code](https://github.com/rantonels/starless) appeared on [Hacker News](https://news.ycombinator.com/). You should definitely check out the article and the code &mdash; they're awesome and you'll most likely learn a lot!

As a numerical physics enthusiast, I began wondering if I could render such images myself. By the time, however, I wasn't skilled enough in general relativity grasp the theoretical side. I then noticed there was going to be a general relativity course held at my university next year. I decided to wait until that.

The course began and the patient waiting paid off. Soon enough I noticed the simplicity of the core ideas like geodesics, which were necessary to do this kind of a simulation. I immediately began coding the raytracer, and here I am, three weeks later, writing an article about the finished code: [Blackstar](https://github.com/flannelhead/blackstar).

As an acknowledgement I'd like to note that my code owes its existence to [rantonels](http://rantonels.github.io/)' work. You'll most likely notice some evident similarities between his code and my project. However, there are some differences, and I think Blackstar ended up as a project in its own right. I decided to implement the whole thing in Haskell, given that I had just studied two courses of it. This project turned out to be a great way to learn more about Haskell.

### Schwarzschild geodesics
What do we need to visualize the gravitational lensing effect produced by a dense object such as a black hole? In Newtonian mechanics, massless particles like photons move in straight lines. In general relativity, the huge mass density of a black hole generates spacetime curvature. The generalization of a straight line to a curved spacetime is a [geodesic](https://en.wikipedia.org/wiki/Geodesic) &mdash; it turns out that photons move along geodesics, which are some curved paths.

The spacetime curvature caused by a non-rotating black hole is described by the [Schwarzschild metric](https://en.wikipedia.org/wiki/Schwarzschild_metric) In principle, one would solve need to solve a system of four differential equations &mdash; [the geodesic equations](https://en.wikipedia.org/wiki/Schwarzschild_geodesics#Geodesic_equation) &mdash; to get the geodesics. I tried this first as I wanted to go the "fundamental route", but I only ended up struggling with singularities at the poles of the spherical coordinate system. It could still *almost* work fine, except for some black points in the image where divergence occurred.

In the end, however I decided to take the same route rantonels had taken: take advantage of the symmetries of the Schwarzschild spacetime to derive much simpler (and, most importantly, non-singular) "equations of motion" for the photons. The derivation can be most likely found in any decent GR textbook. However, I decided to write [a little article](/posts/2016-03-06-photons-and-black-holes.html) about it in order to give people with no GR background a possibility to understand some of the beautiful concepts of general relativity. You should check it out! Alternatively, see rantonels' [two](http://spiro.fisica.unipd.it/~antonell/schwarzschild/) [articles](http://rantonels.github.io/starless/) for a slightly different take on the derivation.

After the theoretical work, the raytracing boils down to just solving the three-dimensional Newton's equation of motion
$$
\ddot{\mathbf{r}} = -\frac{3}{2} h^2 \frac{\hat{\mathbf{r}}}{r^4}
$$
with [fourth order Runge-Kutta](https://en.wikipedia.org/wiki/Runge%E2%80%93Kutta_methods#The_Runge.E2.80.93Kutta_method). Here $\mathbf{r}$ is the three-dimensional Cartesian displacement vector, $r$ its norm and $h$ the "angular momentum" of the test particle. The details have been covered in my article.

### Parallel raytracing with [repa](https://hackage.haskell.org/package/repa)

### Starry skies with [kdt](https://hackage.haskell.org/package/kdt)

### The accretion disk

### Experiment: automatic differentiation

### Images and cross-platform compatibility

### Haskell appreciation

