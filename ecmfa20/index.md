---
layout: default
---

# Runtime Monitoring for Executable DSLs

> Runtime monitoring is a fundamental technique used throughout the lifecycle of a system for many purposes, such as debugging, testing, or live analytics. While runtime monitoring for general purpose programming languages has seen a great amount of research, developing such complex facilities for any executable Domain Specific Language (DSL) remains a challenging, reoccurring and error prone task. A generic solution must both support a wide range of executable DSLs and induce as little execution time overhead as possible. Our contribution is a fully generic approach based on a temporal property language with a semantics tailored for runtime verification. Properties can be compiled to efficient runtime monitors that can be attached to any kind of executable discrete event model. Efficiency is bolstered using a novel combination of structural model queries and complex event processing. Our evaluation on 3 executable DSLs shows that the approach is applicable with an execution time overhead of 121% (on executions shorter than 1s), to 56% (on executions shorter than 20s) making it suitable for model testing and debugging.
>
> Dorian Leroy, Pierre Jeanjean, Erwan Bousse, Manuel Wimmer, Benoit Combemale.
>
> *Research Paper Submission to the 16th European Conference on Modelling Foundations and Applications (ECMFA 2020)*

# Resources
 - [Complete translational semantics for temporal patterns (25 rules)]({{ site.baseurl }}{% link ecmfa20/Runtime_Monitoring_for_Executable_DSLs__Full_Semantics.pdf %})
 - [Code & Evaluation materials]({{ site.baseurl }}{% link ecmfa20/evaluation_materials.zip %})

# Tool support presentation

As explained in the paper, we implemented our approach as a tool provided inside the GEMOC Studio, an Eclipse-based language and modeling workbench to design executable DSLs and execute conforming models. Here is a screenshot of the GEMOC Studio when debugging and monitoring properties on an Activity Diagram model taken from the evaluation materials:

![Screenshot of an Activity Diagram being monitored]({{ site.baseurl }}{% link ecmfa20/runtime_monitor.png %})


# Running the evaluation

## Preparing the GEMOC Studio

 - [Download the latest version of the GEMOC Studio](http://gemoc.org/download.html)
 - [Install VIATRA on top of the GEMOC Studio](https://www.eclipse.org/viatra/downloads.html)
 - Start the GEMOC Studio in a new workspace

## Getting the benchmark code

 - Download and extract the zip containing the code and evaluation materials
 - Import the projects contained in the `plugins`, `eval/languages` and `eval/models` folders into the current workspace of the GEMOC Studio

## Running the benchmark

 - Run the `ActivityDiagramMonitoringTimeBenchmarkingTest`, `ThingMLMonitoringTimeBenchmarkingTest` and `MiniJavaMonitoringTimeBenchmarkingTest` from the `org.eclipse.gemoc.executionframework.property.tests` project as a *JUnit Plugin Test*
