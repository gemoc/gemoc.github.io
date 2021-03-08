---
layout: default
---

# A Generic Framework for Representing and Analysing Model Concurrency



## Abstract

> Recent results in language engineering simplify the definition of tool-supported executable domain-specific modelling languages (xDSMLs), including editing (e.g.,completion and error checking) and execution analysis tools (e.g., debugging, monitoring and live modelling). However, such frameworks are currently limited to sequential execution traces, and cannot handle execution traces resulting from an execution semantics with a concurrency model supporting parallelism or interleaving. This prevents the development of concurrency analysis tools, like debuggers supporting the exploration of model executions resulting from different interleavings. In this paper, we present a generic framework to integrate execution semantics with explicit concurrency models, to explore the possible execution traces of conforming models, and to define strategies for helping in the exploration of the possible executions. This framework is complemented with a protocol to interact with the resulting executions and hence to build advanced concurrency analysis tools. The approach has been implemented within the GEMOC Studio. We demonstrate how to integrate two representative concurrent meta-programming approaches (MoCCML/Java andHenshin), which use different means to define an xDSML’s concurrency model. We also demonstrate the ability to define an advanced concurrent omniscient debugger with the proposed protocol. The paper, thus, contributes key abstractions and an associated protocol for integrating concurrent meta-programming approaches in a language workbench, and dynamically exploring the possible executions of a model in the modelling workbench.


## Authors
- Steffen Zschaler (King's College London, UK)
- Erwan Bousse (University of Nantes, France)
- Julien Deantoni (University Cote d'Azur, France)
- Benoit Combemale (University of Rennes, France)

## Implementation source code

The source code of the implementation described in the paper can be found in specific branches of four Github repositories: 
- [Generic concurrent engine, strategies, MoCCML integration](https://github.com/eclipse/gemoc-studio-execution-moccml/tree/concurrency-analysis), 
- [Small changes made to the GEMOC execution framework](https://github.com/eclipse/gemoc-studio-modeldebugging/tree/concurrency-analysis), 
- [Henshin integration](https://github.com/szschaler/henshin_xdsmls/tree/feature/generic_strategies), 
- [Production-line xDSML and model](https://github.com/szschaler/pls_language).

All the code is open-source (EPL-1.0).

## Implementation build

A complete working build of the GEMOC Studio containing the proposed implementation is available here:
- [Linux](https://ci.eclipse.org/gemoc/job/gemoc-studio-integration/job/concurrency-analysis/lastSuccessfulBuild/artifact/gemoc-studio/gemoc_studio/releng/org.eclipse.gemoc.gemoc_studio.updatesite/target/products/gemoc_studio-linux.gtk.x86_64.zip)
- [MacOS](https://ci.eclipse.org/gemoc/job/gemoc-studio-integration/job/concurrency-analysis/lastSuccessfulBuild/artifact/gemoc-studio/gemoc_studio/releng/org.eclipse.gemoc.gemoc_studio.updatesite/target/products/gemoc_studio-macosx.cocoa.x86_64.zip)
- [Windows](https://ci.eclipse.org/gemoc/job/gemoc-studio-integration/job/concurrency-analysis/lastSuccessfulBuild/artifact/gemoc-studio/gemoc_studio/releng/org.eclipse.gemoc.gemoc_studio.updatesite/target/products/gemoc_studio-win32.win32.x86_64.zip)


## Videos

- [Demo with the Henshin engine](https://uncloud.univ-nantes.fr/index.php/s/dz5aM8FRrDMtz3c?dir=undefined&openfile=471125365)
- [Demo with the MoCCML engine](https://uncloud.univ-nantes.fr/index.php/s/dz5aM8FRrDMtz3c?dir=undefined&openfile=471125365)