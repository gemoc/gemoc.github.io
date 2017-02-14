---
layout: default
---

# Weaving Concurrency in eXecutable Domain-Specific Modeling Languages (SLE’15)

> The emergence of modern concurrent systems (e.g., Cyber-Physical Systems or the Internet of Things) and highly-parallel platforms (e.g., many-core, GPGPU pipelines, and distributed platforms) calls for Domain-Specific Modeling Languages (DSMLs) where concurrency is of paramount importance. Such DSMLs are intended to propose constructs with rich concurrency semantics, which allow system designers to precisely define and analyze system behaviors. However, specifying and implementing the execution semantics of such DSMLs can be a difficult, costly and error-prone task. Most of the time the concurrency model remains implicit and ad-hoc, embedded in the underlying execution environment. The lack of an explicit concurrency model prevents: the precise definition, the variation and the complete understanding of the semantics of the DSML, the effective usage of concurrency-aware analysis techniques, and the exploitation of the concurrency model during the system refinement (*e.g.*, during its allocation on a specific platform). In this paper, we introduce a *concurrent executable metamodeling approach*, which supports a modular definition of the execution semantics, including the concurrency model, the semantic rules, and a well-defined and expressive communication protocol between them.
> Our approach comes with a dedicated meta-language to specify the communication protocol, and with an execution environment to simulate executable models. We illustrate and validate our approach with an implementation of fUML, and discuss the modularity and applicability of our approach.
>
> “Weaving Concurrency in eXecutable Domain-Specific Modeling Languages”
>
> Florent Latombe, Xavier Crégut, Benoît Combemale, Julien Deantoni, Marc Pantel,
>
> In 8th International Conference on Software Language Engineering (SLE 2015)

# fUML as a Concurrency-aware eXecutable Domain-Specific Modeling Language (xDSML)

This page presents an application of the concurrent executable metamodeling approach presented in our submission to the 8th International Conference on Software Language Engineering (SLE’15). [Link to the paper](https://hal.inria.fr/hal-01185911).

Our example xDSML is the Foundational Subset for Executable UML Models (fUML). The specification is available on the [OMG’s website](http://www.omg.org/spec/FUML/). Our implementation supports the *Intermediary Activities* package (InitialNode, DecisionNode, ForkNode, *etc*…). Behaviors are limited to OpaqueActions, whose body can be specified using the [Groovy language](http://www.groovy-lang.org/).

## Example Model : TalkAndDrink Activity

<div style="text-align: center;" markdown="1">
[![PAM_0_0]({{ site.baseurl }}{% link sle15/fUML-model2.png %})]({{ site.baseurl }}{% link sle15/fUML-model2.png %})

fUML example model.
</div> 


The execution of this model proceeds as follows:

1. Execution starts at the InitialNode “MyInitialNode”.
2. The ForkNode “MyFork” splits the flow of the execution into two conceptually concurrent branches. Thus, the following points 3. and 4. are done concurrently
3. The talking part of the activity consists in one Action, “Talk”, which prints “Greetings Everybody!” in the standard output console.
4. The drinking part of the activity consists in the following:
   1. First, the Action “CheckTableForDrinks” returns randomly either “Coffee”, “Tea” or “Neither”.
   2. The value is emitted thanks to its OutputPut “MyOutputPin”.
   3. The DecisionNode represents a decision point : only one of its outgoing branches can be executed.
   4. Each guard is evaluated against the value returned earlier. If “Coffee” was returned then only the branch leading to “DrinkCoffee” may be executed, if “Tea” only the branch leading to “DrinkTea” may be executed. Otherwise, the default guard “else” always returns true but its branch is only executed if the other branches were not possible.
   5. The MergeNode “MyMerge” is activated anytime any of its input has tokens, so whichever drink is drunk, it will be executed afterwards.
5. The JoinNode “MyJoin” awaits for both branches to finish before being allowed to executed.
6. Finally, the FinalNode “MyFinal” can be executed and completes the execution.

## Model Execution and Animation

The following video presents an overview of our fUML implementation.
The video below shows the execution of the fUML example model, including a graphical animation of the graphical concrete syntax defined using [Sirius](https://www.eclipse.org/sirius/).

## Download the version of the GEMOC Studio containing the sources of our fUML implementation and of the example model:


<div style="text-align: center;" markdown="1">
[![download GEMOC Studio]({{ site.baseurl }}{% link sle15/download_gemoc_studio.png %})]({{ site.baseurl }}/pub/studio/sle15/GemocStudioForFuml.linux.x86_64_2015_06_19.zip)

*Requirements*: 64-bit Linux OS (tested on Linux Mint 17) and Java 8.
</div> 

------

Below are explained the different specifications constituting the Concurrency-aware definition of fUML.

## Abstract Syntax (AS)

The Abstract Syntax defines the syntactic concepts of the language and their relations.

<div style="text-align: center;" markdown="1">
[![Ecore metamodel of fUML]({{ site.baseurl }}{% link sle15/fUML-AS9.jpg %})]({{ site.baseurl }}{% link sle15/fUML-AS9.jpg %})
</div>

## Execution Data (ED) and Functions (EF)

The Execution Data capture, at the language level, the runtime state of a model. The Execution Functions are the semantic rules defining operationally how the Execution Data evolve at runtime.

<div style="text-align: center;" markdown="1">
[![Execution Data and Functions of fUML]({{ site.baseurl }}{% link sle15/fUML-DSA-as-metamodel.png %})]({{ site.baseurl }}{% link sle15/fUML-DSA-as-metamodel.png %})

Execution Data and Functions of fUML as a metamodel extending its Abstract Syntax.
</div>

*Note: For technical reasons, our implementation requires that the Execution Data and the Execution Functions’ signatures be manually added into the metamodel.*

## Model of Concurrency and Communication (MoCC) Library

MoCCML allows the capitalization of domain-agnostic relations and expressions into libraries, reusable for several domains. Please see the [dedicated paper](https://hal.inria.fr/hal-01087442) for a more thorough presentation of MoCCML.


<div style="text-align: center;" markdown="1">
[![fUML MoCC Library]({{ site.baseurl }}{% link sle15/FumlMoccLibrary.png %})]({{ site.baseurl }}{% link sle15/FumlMoccLibrary.png %})
</div>

## Mapping of the MoCC to the AS

The Event Constraint Language (ECL) is an extension of OCL for the definition of an EventType Structure as defined in our paper. It allows the declaration of an EventType in the context of a concept from the AS, and the use of MoCCML relations and expressions on these EventTypes so as to define the partial ordering (at the language level) between EventTypes.

<div style="text-align: center;" markdown="1">
[![MoCC2AS Mapping of fUML]({{ site.baseurl }}{% link sle15/FumlMoCC2AS.png %})]({{ site.baseurl }}{% link sle15/FumlMoCC2AS.png %})

Mapping of the EventType Structure to the Abstract Syntax of fUML using ECL.
</div>

<div style="text-align: center;" markdown="1">
[![Excerpt from fUML's constraints]({{ site.baseurl }}{% link sle15/FumlConstraints1.png %})]({{ site.baseurl }}{% link sle15/FumlConstraints1.png %})

Excerpt from the constraints defining the partial ordering of the MoCC of fUML.
</div>

<div style="text-align: center;" markdown="1">
[![Excerpt from fUML's constraints (2)]({{ site.baseurl }}{% link sle15/FumlConstraints2.png %})]({{ site.baseurl }}{% link sle15/FumlConstraints2.png %})

Excerpt from the constraints defining the partial ordering of the MoCC of fUML.
</div>

## Communication Protocol

Finally, GEL allows the specification of the Communication Protocol between the concurrency model and the semantic rules.

<div style="text-align: center;" markdown="1">
[![fUML Communication Protocol]({{ site.baseurl }}{% link sle15/FumlCommunicationProtocol.png %})]({{ site.baseurl }}{% link sle15/FumlCommunicationProtocol.png %})

Communication Protocol of fUML specified using GEL.
</div>
