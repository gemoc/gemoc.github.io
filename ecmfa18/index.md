---
layout: default
---

# Trace Comprehension Operators for Executable DSLs

<div style="text-align: justify;" markdown="1">


>Recent approaches contribute facilities to breathe life into metamodels, thus making behavioral models directly executable. Such facilities are particularly helpful to better utilize a model over the time dimension, e.g., for early validation and verification. However, when even a small change is made to the model, to the language definition (e.g., , semantic variation points), or to the external stimuli of an execution scenario, it remains difficult for a designer to grasp the impact of such a change on the resulting execution trace. This prevents accessible trade-off analysis and design-space exploration on behavioral models. In this paper, we propose a set of formally defined operators for analyzing execution traces. The operators include dynamic trace filtering, trace comparison with diff computation and visualization, and graph-based view extraction to analyze cycles. The operators are applied and validated on a demonstrative example that highlight their usefulness for the comprehension specific aspects of the underlying traces. 
>
> Dorian Leroy, Erwan Bousse, Anaël Megna, Benoit Combemale, Manuel Wimmer.
>
> *Research Paper Submission to the 14th European Conference on Modelling Foundations and Applications (ECMFA 2018)*
</div>

This page presents the application and the validation of the four operators and their approach presented in our
submission to the 14th European Conference on Modelling Foundations and Applications (ECMFA 2018).



## Tool support presentation

As explained in the paper, we implemented our approach as a tool provided inside the GEMOC Studio, an Eclipse-based language and modeling workbench to design executable DSLs and execute conforming models.

Here is a sample of the graphical interface of the tool when comparing two State Machine execution traces:

<div style="text-align: center;" markdown="1">
![](screenshot-compare-filtering.png)
</div>

We can see:
- at the top, the two execution traces being compared, the first with seven states and the second with eight states
- the result of the *Compare* operator shows us that the second trace has one extra state, shown in red, as compared to the first trace
- at the bottom, two pairs of dimensions are shown (one for `Region1`, one for `Region2`), with one dimension per trace in each pair, enabling the comparison per dimension
- on the left, checkboxes are available to trigger at the same time the *Filter* and *Reduce* operators

From there, if we use the checkboxes to filter out the `Region2` dimension using *Filter* and *Reduce*, we obtain this simplified trace:

<div style="text-align: center;" markdown="1">
![](screenshot-filtering-reduce-after.png)
</div>

We notice that:
- there are only five execution states remaining
- the *Compare* operator does not find any difference anymore between the traces.


## State Machines DSL implementation

The implementation of the State Machine DSL presented in the paper [is available on Github](https://github.com/tetrabox/examples-behavioral-interface/tree/master/languages/statemachines), and can be used as an executable DSL in the GEMOC Studio.

## ThingML demonstrative example presentation

In our submission, we motivated and illustrated the approach using an example based on simple UML
State Machines with history states.
Here, we will focus on a larger xDSML initially based on
[ThingML](http://thingml.org/) to validate the application of our tooling, through relatively small models but which can
scale very easily (by just increasing the number of consumers or clients, see below) and with a behaviour that is
difficult to predict or anticipate.

ThingML (for Thing Modeling Language) is a modeling language for describing distributed systems. It is used in embedded
systems and is oriented towards the description of components (the things) and the way they communicate between each
other.
The models written in ThingML, through a text editor (standalone, or embedded in Eclipse thanks to Xtext), can be
compiled to a large set of target platform like Arduino, C, C++, Java, Android, Javascript, etc.

[#]:### Abstract Syntax


[#]:### Example

As a small example of ThingML model, we can consider the following one:

<div style="text-align: center;" markdown="1">
[![PingPong Example Model]({{ site.baseurl }}{% link ecmfa18/ping_pong.png %})]({{ site.baseurl }}{% link ecmfa18/ping_pong.png %})

Ping-Pong example model.
</div>

This represents two things, one called `PingServer` and the other one `PingClient`, which can communicate by sending
`ping` and `pong` messages through their own port both called `ping_service` linked together in the `PingPongConfig`
configuration.

We use our own graphical concrete syntax for ThingML, as there is no official graphical concrete syntax definition in
the official language definition. We thus represent things with squares, states with ellipses, and transitions with
arrows.  
For display purposes, transition event, guards and actions are not described in the figure, but instead, the transitions
are labelled.  
In further examples, the transitions will be explained just below the graphical view of the model.

This PingPong model can be written in ThingML as follows:

```
thing fragment PingPongMsgs {
	message ping()
	message pong()
}
```

First, we declare `PingPongMsgs` Thing which cannot be instantiated as it is declared `fragment`. We do that to reuse
the message definition in the two following real Things.

```
thing PingServer includes PingPongMsgs {
	provided port ping_service {
		sends pong
		receives ping
	}

	statechart PingServerMachine init Active {
		on entry print "Ping Server Started!\n"

		state Active {
			internal
				event ping_service?ping
				action ping_service!pong()
		}
	}
}
```

Then we can declare the `PingServer` Thing, which reuse `PingPongMsgs` to be able to use `ping` and `pong` messages.
It declares one Provided Port `ping_service` able to send `pong` and to receives `ping` Messages. Provided Port means
that the service is offered by this Thing. If a Message is sent through this Port, every Thing connected to this Port
will receive the Message.  
The behaviour of the `PingServer` is declared in the main Statechart called here `PingServerMachine`. It starts with
its `Active` States, just after having printed `"Ping Server Started!\n"`. This State possesses only one Transition
which is `internal` (Transition to itself) and has no name. This Transition is triggered by the reception of a `ping`
Message on the `ping_service` Port. No guard will restrict the trigger. When firing this Transition, a `pong` Message
will be sent through the `ping_service` Port.

```
thing PingClient includes PingPongMsgs {

	required port ping_service {
		receives pong
		sends ping
	}

	statechart PingClientMachine init Ping {
		on entry print "Ping Client Started!\n"

		state Ping {
			on entry do
				print "Send Ping..."
				ping_service!ping()
			end

			transition PONG -> Stop
				event ping_service?pong
				action print "Got Pong!\n"
		}

		final state Stop {
			on entry print "Bye.\n"
		}
	}
}
```

The `PingClient` Thing also reuse `PingPongMsgs`. To work properly, the future instance will need to be connected to
a Port through which they would receive `pong` and send `ping`.  
Its behaviour, called `PingClientMachine` starts with the `Ping` State after having printed `"Ping Client Started!\n"`.
When entering the `Ping` State, it prints `"Send Ping..."`, sends a `ping` Message on the `ping_service` Port, and then
wait until a `pong` Message on the `ping_service` Port trigger the `PONG` Transition. When firing this Transition, it
prints `"Got Pong!\n"` and jumps to the `Stop` state which is marked `final`, as no Transition start from it. When
entering this State, it prints `"Bye.\n"`.

```
configuration PingPongConfig {
	instance client : PingClient
	instance server : PingServer
	connector client.ping_service => server.ping_service
}
```

Finally, in order to execute something, we write a model Configuration here called `PingPongConfig`. In this
Configuration, we declare one Instance of `PingClient` called `client`, one Instance of `PingServer` called `server`,
and we connect their Port together.

## Our implementation

As the original ThingML language is made to describe things that run concurrently in a fully-distributed way, we made
some adaptations in the executable specification we provided in our Sequential xDSML Execution Semantics definition.
Moreover, we only focused on a subset of the initial set of concepts of the semantics specification that was useful for
our examples:  
- First, we do not support at all any target platform specific part of the language. We based the execution on the
  subset of types and instructions already present in ThingML;
- Second, even if the model represents things that can evolve in parallel, we execute it in a Sequential way, using a
  run-to-completion scheduling model to animate the things one by one.

[#]:The full specification is available through the source code of the xDSML through
[#]:[this link](https://github.com/gemoc/Gemoc-ThingML).

[#]:## First Example Model : Producer-Consumers example model

## Example Model : Producer-Consumers example model

[#]:All the sources for the following example are available
[#]:[here](https://github.com/gemoc/Gemoc-ThingML/blob/master/modeling/org.thingml.samples/Producer/Producer.thingml)

<div style="text-align: center;" markdown="1">
[![Producer example model]({{ site.baseurl }}{% link ecmfa18/producer.png %})]({{ site.baseurl }}{% link ecmfa18/producer.png %})

Producer-Consumers example model (producer point of view).
</div>

This model consists in one `Producer` that produces data, sends it through its `output` (O) port, and waits for the
answer from the `Consumer`s. The `Consumer`s can only answer with an acknowledgement (`ack`) or not
acknowledgement (`nack`). If at least one `ack` is received, the `Producer` returns in state `Produce`, otherwise it
jumps in the `Error` state and the execution stops.  
When all the data has been sent, the `Producer` goes in `End` state. Whenever it enters either in state `End` or
`Error`, a `stop` message is sent to the `Consumer`s through the `synchro`nisation (S) port, and the execution stops.

The behaviour of the Producer, written with the concrete syntax, is the following:

```
statechart Behaviour init Produce {

    state Produce {
        transition A -> Wait
            guard data_index < data_size
            action do
                output!data(data[data_index])
                data_index++
            end

        transition F -> End
            guard data_index >= data_size
    }

    state Wait {
        on entry do
            consumer_ack = 0
            consumer_nack = 0
        end

        internal B
            event output?ack
            guard (consumer_ack + consumer_nack + 1) < consumer_count
            action consumer_ack++

        internal C
            event output?nack
            guard (consumer_ack + consumer_nack + 1) < consumer_count
            action consumer_nack++

        transition D -> Produce
            event output?ack
            guard consumer_count == (consumer_ack + consumer_nack + 1)

        transition E -> Produce
            event output?nack
            guard (consumer_ack > 0) and (consumer_count == (consumer_ack + consumer_nack + 1))

        transition G -> Error
            event output?nack
            guard consumer_count == (consumer_nack + 1)
    }

    final state Error {
        on entry do synchro!stop()
    }

    final state End {
        on entry do synchro!stop()
    }
}
```

The Consumers' point of view of the model is the following:

<div style="text-align: center;" markdown="1">
[![Consumers example model]({{ site.baseurl }}{% link ecmfa18/consumers.png %})]({{ site.baseurl }}{% link ecmfa18/consumers.png %})

Producer-Consumers example model (sub-model focused on the consumers point of view).
</div>
