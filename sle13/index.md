---
layout: default
---

# A Language Workbench for Modular Concurrency-Aware Design and Implementation of Modeling Languages

> This work reifies concurrency as a metamodeling facility, leveraging formalization work from the concurrency theory and models of computation (MoC) community. The essential contribution of this paper is a proposed language workbench for binding domain-specific concepts and models of computation through an explicit event structure at the metamodel level. We illustrate these novel metamodeling facilities for designing two variants of a concurrent and timed final state machine, and provide other experiments to validate the scope of our approach.
>
> [“Reifying Concurrency for Executable Metamodeling”](http://hal.inria.fr/hal-00850770) [[bib\]](http://people.irisa.fr/Benoit.Combemale/wp-publications/sle13-combemale/) [[pdf\]](http://hal.inria.fr/hal-00850770)
> Benoit Combemale, Julien Deantoni, Matias Vara Larsen, Frédéric Mallet, Olivier Barais, Benoit Baudry, Robert France,
> In 6th International Conference on Software Language Engineering (SLE 2013),
> Richard F. Paige Martin Erwig, Eric van Wyk, eds., LNCS, Springer-Verlag, 2013.

[![Reifying Concurrency for Executable Metamodeling (SLE 2013)]({{ site.baseurl }}{% link sle13/wordle1-1024x791.jpg %})](http://hal.inria.fr/hal-00850770)

# Use Cases

The reification of concurrency for executable metamodeling has been presented in its general form and several implementations of it can be realized. In this web page we illustrate the use of the workbench on the definition of three languages:

1. The Timed Final State Machine (TFSM) language.
2. The Actor Computing Machine language.
3. The Logo language.

For each language, we follow the same pattern. We present :

1. The abstract syntax design,
2. the domain specific action design,
3. the model of computation design,
4. the domain specific event design,
5. a basic example built using this language.

## The Timed Final State Machine (TFSM) language[ ](https://www.youtube.com/watch?v=gT1QUlmFkLM)

A general overview of the use of this workbench is demonstrated on the following video.
A timed Finite state machine is a language to specify the system behaviour where actions are divided into inputs and outputs. Time constraints limit the time at which an output has to be produced after an input has been applied. After this, the time variable is reset to zero. Moreover, a state can have *a time invariant called time-out. If the time-out ****ex*pires and no input is applied the system should change its state according to the specification. A special discrete clock variable is used in order to represent a timed behaviour.

### TFSM Abstract Syntax Design

We based the abstract syntax on EMF (the Eclipse Modeling Framework). This choice is motivated by the good acceptation of EMF and its correspondence to the MOF standard. Additionally, EMF is well tooled and many other tools are based on it (*e.g.*,,OCL, GMF, etc).

Briefly, the abstract syntax of a TFSM *System* (see Figure below) is composed of a set of *TFSM*, a set of global *FSMEvents* and a set of global *FSMClocks*. Each TFSM is composed of *States* among which an initial state and composed of a set of *Transitions*, which owned a guard. A guard can be specified by a FSMEvent reception (EventGuard) or by a duration relative to the entry in the incoming state of the transition (TemporalGuard). The duration of a temporal guard is measured on an explicit reference clock. To a transition is associated an action, represented in the abstract syntax like a *String*. This action represents model level code defined by the designer. In our experiments such model level code is written in the Groovy language[^1] for its capacity to be invoked dynamically. However this is a totally arbitrary choice. A transition can also generate a set of event occurrences.

<div style="text-align: center;" markdown="1">
[![meta_ecore]({{ site.baseurl }}{% link sle13/meta_ecore.png %})]({{ site.baseurl }}{% link sle13/meta_ecore.png %})
</div>

Note that in the abstract syntax we avoid adding concepts about the execution state or functions. These concepts are specified in the DSA.

### TFSM Domain Specific Actions Design

The dsa is the abstract syntax with data representing the execution state and with functions representing the execution functions. We describe both execution state and functions of the DSA in [KerMeta](http://www.kermeta.org/), mainly for its weaving capability on the abstract syntax.Kermeta specifies aspects on metaclasses and allows for the addition of execution state attributes. In the case of TFSM, we added the *current state* as an attribute of a TFSM. We also added the *numberOfTicks* as an integer attribute of the FSMClock. The choice of what shoul\d be added as attribute depends on the information we want to capture in the execution state of the models. For instance in the TFSM example we could have added the occurrences of events and the date at which they occurred but we arbitrarily decided such information as irrelevant in our case. Kermeta aspects can also specify operations onmetaclasses. It provides an operational specification of function as described in the dsa modeling unit. The advantage is then theexecutability of such operations. In TFSM, we added six operations:

•*init()* on TSFM: The init() operation is used to initialize the execution state of the TFSM (*i.e.,*the current state in our case).

•*fire()* on Transition: The fire() operation is in charge of changing the current state from the source state to the target state of the transition. It is also in charge of executing the groovy code specified in the action attribute.

•*onEnter()*, *onExit()* on State: In our example, these operations are only used for traçability purpose but they could execute a specific action like in the fire() operation.

•*init()* on FSMClock: The init() operation is used to initialize the *numberOfTicks*.

•*increments()* on FSMClock: The increments() operation is used to increment the *numberOfTicks* of the FSMClock.

The Kermeta code defining the DSA is presented on the following figure. 

We should notice that while the DSA are described by Kermeta aspects over the abstract syntax, none of them specifies the execution workflow (like a main() or a run() operation). The schedule of the different operation calls is made by the model of execution according to the MoC used in the language.

### TFSM Model of Computation Design

The MoC defines the concurrency, the synchronizations and the possibly timed causalities in a language. We chose the ccsl for three reasons. The first one is its capacity to specify event structures in a declarative way; the second one is the possibility to encapsulate specific relation patterns into libraries and the third one is the possibility to simulate a ccsl inTimeSquare. We use the library mechanism to specific relations used for a specific MoC. These relations defines the constraints to be respected by any model execution. We defined new relations dedicated to the TFSM MoC like for instance *TemporalTransition* and*EventTransition* whose declarations are presented on figure 4 (where the definition is not given for clarity reason). Each declaration exposes a set of formal parameters, which are needed to specify the constraint between the events (called *clock* inccsl). For instance, for the temporal transition relation, four events are important, the event that starts the “timer” (*e.g.*,arrival in the source state), the event used to measure the time (*e.g.*,ticks of a reference FSMClock), the event that disable the transition (*e.g.*,transition has been fired), and the clock that actually fire the transition. Additionally, the integer representing the delay after which the transition should be fired is also a parameter. Such parameters represent the information that should be provided by a language in order for the MoC to be used. However, such declarations do not make any assumption about the abstract syntax or about the DSA.

### TFSM Domain Specific Event Design

The DSE is the part where the other modeling units are all put together. It contains in one hand the events which are relevant from the DSML perspective and how they are linked to the execution functions of the DSA; and on the other hand it specifies how the constraints from the MoC are applied on the AS. To do so, a specific language named ECL (for Event Constraint Language) has been developed as an extension of OCL with Events.

ECL takes benefits from the OCL query language and its possibility to augment the metamodels with additional attributes (without any side effects). Consequently, by using ECL, it is possible to define new events and to link them to the weaved execution functions if needed. It is also possible to define some invariants that specify in which context and with which parameter(s) a constraint from the MoC is used.

From such specification, it is possible, for any model that conforms to the AS, to generate a ccsl that represent the model of the execution; \*i.e.,\*a model that contains the actual constraints and their actual parameters according to the query on model. This resulting ccsl is directly linked to the model elements and can be used to provide a simulation of a specific model. The next section illustrates the use of the resulting language by using two concurrent TFSMs, which model a road traffic lights and its controller. (It can also be seen in the video at the beginning of this section.

### Using the TFSM language: concurrent road traffic lights

<div style="text-align: center; max-width: 100%;" markdown="1">
  <img src="{{ site.baseurl }}{% link sle13/screenworkspace.png %}" style="max-width: 100%;" />
</div>

## The Actor computing language

The approach implementation is illustrated by the definition of the Actor model. The Actor model is a mathematical model of concurrent computation that treats “actors” as the universal primitives of concurrent digital computation: in response to a message that it receives, an actor can make local decisions, create more actors, send more messages, and determine how to respond to the next message received. The benefit of modelling this part of language using the GEMOC approaches is to build a modelling unit that can be easily reused.

### Actor Abstract Syntax Design

Briefly, the abstract syntax for the actor model is the following.

<div style="text-align: center; max-width: 100%;" markdown="1">
  <img src="{{ site.baseurl }}{% link sle13/actor-package-entities.jpg %}" style="max-width: 100%;" />
</div>

System is composed of a set of Actor and a set of global Messages and a set of Actions. An actor is a computational entity that, in response to a message it receives, can concurrently: send a finite number of messages to other actors; create a finite number of new actors; designate the behavior to be used for the next message it receives. There is no assumed sequence to the above actions and they could be carried out in parallel. Each Actor can have a parent which is an Actor and each Actor is composed of BehavioralSpecs. Each BehavioralSpec binds a Message and an Action. This action can be an AtomicAction a CreateActorAction or a CompositeAction.
AtomicAction represents model level code defined by the designer. In our experiments such model level code is written in the Groovy language (http://groovy.codehaus.org/) for its capacity to be invoked dynamically. CompositeAction binds a set of Action to be executed. CreateActorAction creates new Actor model element.

As for the TFSM, in the abstract syntax we avoid adding concepts about the execution. These concepts are specified in the \dsa.

### Actor Domain Specific Actions Design

The DSA enrich the abstract syntax with data representing the execution state and with functions representing the execution functions. We describe both execution state and functions of the DSA in KerMeta (www.kermeta.org) . In the case of Actor Model, we added the concepts of messageSend of the Contect class that contains a list of tuple (Message and Destination address).
The choice of what should be added as attribute depends on the information we want to capture in the execution state of the models. For instance in the actor example we could have added the history of the messages but we arbitrarily decided such information as irrelevant in our case.
Kermeta aspects can also specify operations on metaclasses. It provides an operational specification of function as described in the DSA modeling unit. The advantage is then the executability of such operations.
In the actor model, we added mainly six operations:

- init() on System: The init() operation is used to initialize the actor model.
- tick on Actor: The tick method can be called to schedule the behavior of each actor.
- fireMessage(orig:Actor, dests:Actor[1..\*], m:Message) on context: The fire message method will be called by any Actor that choose to send a message.
- sendMessage(m:Message) in Actor: The sendMessage is called to give a new message to an actor following the fireMessage method called.
- the execute() in CreateAction, CompositeAction and AtomicAction: The execute method will be called to trigger an action when a message is received by an actor. This action can be a defined using a groovy expression. this groovy expression have callback to send new messages to any actor.

We should notice that while the DSA are described by Kermeta aspects over the abstract syntax, none of them specifies the execution workflow (like a main() or a run() operation). The schedule of the different operation calls is made by the model of execution according to the MoC used in the language.

### Actor Model of Computation Design

The MoC defines the concurrency, the synchronizations and the possibly timed causalities in a language. We chose the CCSL language for three reasons. The first one is its capacity to specify event structures in a declarative way; the second one is the possibility to encapsulate specific relation patterns into libraries and the third one is the possibility to simulate a CCSL specification in timesquare. We use the library mechanism to specific relations used for a specific MoC. These relations defines the constraints to be respected by any model execution.

The model of computation for the actor model mainly define the fact that the tick method on actor is called on each actor. The CCSL code is available [here]({{ site.baseurl }}/sle13/actorccsl).

### Actor Domain Specific Event Design

The DSE is the part where the other modeling units are all put together. It contains in one hand the events which are relevant from the DSML perspective and how they are linked to the execution functions of the DSA; and on the other hand it specifies how the constraints from the MoC are applied on the AS. ECL takes benefits from the OCL query language and its possibility to augment the metamodels with additional attributes (without any side effects). Consequently, by using ECL, it is possible to define new events and to link them to the weaved execution functions if needed.

## The Logo language

We currently define a logo language implementation that lets several turtles evolve on the same playground. We follow the same approach. Meta model is provided in the following. The virtual machine metamodel is provided in the following picture. We use Kermeta to define the turtle basic behavior and CCSL to schdule the game and provide a concurrency model between turtle. The implementation of this use case is available [here]({{ site.baseurl }}/sle13/logo.zip).

<div style="text-align: center; max-width: 100%;" markdown="1">
  <img src="{{ site.baseurl }}{% link sle13/logoASM.png %}" style="max-width: 100%;" />
</div>

<div style="text-align: center; max-width: 100%;" markdown="1">
  <img src="{{ site.baseurl }}{% link sle13/logoVM-300x241.png %}" style="max-width: 100%;" />
</div>

[^1]: [http://groovy.codehaus.org/](http://groovy.codehaus.org/)
