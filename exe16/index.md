---
layout: default
---

# Concurrency-aware eXecutable Domain-Specific Modeling Languages as Models of Concurrency

> To deal with the increasing complexity of modern highly-concurrent systems, the GEMOC concurrency-aware eXecutable Domain-Specific Modeling Languages (xDSMLs) approach proposes to make explicit, in the operational semantics model, the concurrency concerns using a Model of Concurrency (MoC).
> This approach initially provides only one MoC: Event Structures, based on a MoCCML specification. But this MoC is not the best fit for all concurrency paradigms used in xDSMLs, resulting in complex models which are difficult to maintain or analyze. Moreover, extending the approach with new MoCs is complex: many elements must be integrated, and fit into the APIs used by the implementation. We propose to seamlessly define and integrate new MoCs through a recursive definition of the concurrency-aware xDSML approach, enabling the use of previously-defined xDSMLs as MoCs. This allows xDSMLs to always rely on an adequate MoC which also comes tooled with the generic execution and debugging facilities provided by the concurrency-aware approach. We illustrate our approach on the definition of fUML in the GEMOC Studio, an Eclipse-based language workbench.
>
> “Concurrency-aware eXecutable Domain-Specific Modeling Languages as Models of Concurrency”
>
> Florent Latombe, Xavier Crégut, Marc Pantel.
>
> Research Paper Submission to the 2nd International Workshop on Executable Modeling (EXE 2016)

This page presents the application of the recursive definition of the concurrency-aware xDSML approach presented in our submission to the 2nd International Workshop on Executable Modeling (EXE 2016). Our contribution is illustrated on the Foundational Subset for Executable UML Models (fUML). The specification is available on the [OMG’s website](http://www.omg.org/spec/FUML/). Our implementation supports the *Intermediary Activities* package (InitialNode, DecisionNode, ForkNode, *etc*…). Behaviors are limited to OpaqueActions, whose body can be specified using the [Groovy language](http://www.groovy-lang.org/).

## Example Model : TalkAndDrink Activity

<div style="text-align: center;" markdown="1">
[![fUML example model]({{ site.baseurl }}{% link exe16/fUML-model2.png %})]({{ site.baseurl }}{% link exe16/fUML-model2.png %})

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

More details about the specification of fUML using the Event Structures Model of Concurrency, or the Feedback Protocol, can be found here: [http://gemoc.org{% link sle15/index.md %}]({{ site.baseurl }}{% link sle15/index.md %})

## Language Specification and Execution of the Example fUML Activity

The following video presents an overview of our implementation of two concurrency-aware xDSMLs. First a “Threading” language capturing the notions of Threads and their instructions. Then an implementation of fUML using the Threading language as its Model of Concurrency. This definition of fUML relies on two additional specifications: a model transformation and a Projections specification.

<iframe width="560" height="315" src="https://www.youtube.com/embed/ThBzDRsE8aI" frameborder="0" allowfullscreen></iframe>

The video below shows the execution of the fUML example model, including a graphical animation of the graphical concrete syntax defined using [Sirius](https://www.eclipse.org/sirius/). Since the Model of Concurrency Application of this example Activity is itself a model conforming to the Threading language, its graphical animation is also visible.

<iframe width="560" height="315" src="https://www.youtube.com/embed/n2eUfyv-TsA?list=PLuVleyTr_fSJseHpUxGRBdEWCuyEF6-Xb" frameborder="0" allowfullscreen></iframe>

## Download the version of the GEMOC Studio containing the sources of our fUML and Threading implementations and of the example fUML Activity:

<div style="text-align: center;" markdown="1">

[![download GEMOC Studio](http://gemoc.org/pub/studio/exe16/GemocStudioForFuml_Exe16.linux.x86_64_2016_07_17.zip)

</div>

This archive includes:
- The GEMOC Studio Language Workbench, providing the means to create and edit concurrency-aware xDSMLs.
- The Threading xDSML defined as per the initial approach, *i.e.*:Abstract Syntax as an Ecore model;Semantic Rules defined using Kermeta 3;Model of Concurrency Mapping defined using ECL/MoCCML;Communication Protocol defined using GEL;Graphical Concrete Syntax with Animation Layer defined using Sirius.
- The fUML xDSML defined as per the contribution proposed in the paper, *i.e.*:Abstract Syntax as an Ecore model;Semantic Rules defined using Kermeta 3;Model of Concurrency Mapping, using the Threading xDSML, defined as a model transformation from fUML to the Threading language, using Xtend and the Java EMF APIs;Projections, using our dedicated projections metalanguage;Communication Protocol defined using GEL;Graphical Concrete Syntax with Animation Layer defined using Sirius.
- The GEMOC Studio Modeling Workbench, providing the tools to execute models conforming to concurrency-aware xDSMLs.
- The fUML Activity used as example in the paper.
- The set of instructions to deploy the languages in the Modeling Workbench in order to be able to replay the execution of the fUML Activity as shown in the videos above.

 

*Requirements*: 64-bit Linux OS (tested on Linux Mint 17) and Java 8.
