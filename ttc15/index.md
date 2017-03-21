---
layout: default
---

# A language for activity diagrams using the GEMOC studio (TTC’15)

> We present in this paper a complete solution to the Model Execution case of the Transformation Tool Contest 2015 using the GEMOC Studio. The solution proposes an implementation of the most complete version (variant 3) of the UML Activity Diagram language. The implementation uses different technologies integrated into the GEMOC Studio for implementing the various concerns of the language: Kermeta is used to modularly implement the operational semantics and to weave it into the provided metamodel, Melange is used to build the overall language runtime seamlessly integrated to EMF, Sirius Animator is used to develop a graphical animator, the GEMOC execution engine is used to execute the conforming models according to the operational semantics and to build a rich and efficient execution trace that can be manipulated through a powerful timeline, which provides common facilities like, for instance trace visualization, and step-by-step execution (incl., breakpoint, step forward and step backward). Finally, MoCCML is used to provide an alternative to the implementation with an explicit and formal concurrency model for activity diagrams supported by a solver and analysis tools. We evaluate our implementation with regard to the evaluation criteria provided into the case description and provide evidence of the correctness, understandability, conciseness and performance of our solution.

# Ressources

- [Description of the use case](https://code.google.com/a/eclipselabs.org/p/moliz/source/browse/?repo=ttc2015)

- [Presentation of the solution using the GEMOC studio](https://hal.inria.fr/hal-01152342)

- [Bundle in the platform SHARE (TTC15 with ArchLinux64-TTC15_K3.vdi): VM with the GEMOC studio, and the language and modeling workspaces of the proposed solution (see README)](http://is.ieis.tue.nl/staff/pvgorp/share/)

- [Bundle as a VirtualBox Image: VM with the GEMOC studio, and the language and modeling workspaces of the proposed solution (see README)](https://transfert.inria.fr/fichiers/4a22f03bee441faf826951446c7d92f4/TTC15_NEW.ova)

- [A small video about the use of the gemoc studio to debug a concurrent execution](https://www.youtube.com/watch?v=ko53lL2fkUA)
