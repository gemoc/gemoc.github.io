---
layout: event
title: GEMOC 2017
date: September 2017, Austin, TX, USA
---

<div style="text-align: center;" markdown="1">

# 5th International Workshop on

# *The Globalization of Modeling Languages*

## September 19th, Austin, TX, USA co-located with [MODELS 2017](http://www.modelsconference.org/)

<strong>[About]({{ site.baseurl }}{% link events/gemoc2017.md %}#about-the-workshop) | [Program]({{ site.baseurl }}{% link events/gemoc2017.md %}#program) | [Call]({{ site.baseurl }}{% link events/gemoc2017.md %}#call-for-papers--models) | [Dates]({{ site.baseurl }}{% link events/gemoc2017.md %}#important-dates) | [Committees]({{ site.baseurl }}{% link events/gemoc2017.md %}#committees)</strong>

## *The proceedings are now online here (http://ceur-ws.org/Vol-2019/)*

</div>

## About the Workshop

The increasing complexity of modern software-intensive systems demands for enhanced software engineering methods. Separation of concerns of the diverse stakeholders' facilitates the coordinated development of system aspects implementing these concerns. These different concerns are often associated with specialized description languages and technologies, which are based on concern-specific problems and solution concepts. Hence, software developers are faced with the challenging task of integrating the different languages and associated technologies used to produce software artifacts in the different concern spaces. GEMOC 2017 will be a full-day workshop that brings together researchers and practitioners in the modeling languages community to discuss the challenges associated with integrating multiple, heterogeneous modeling languages. The languages of interest range from requirements, to design and runtime languages, and include both general-purpose and domain-specific languages. Challenges related to engineering composable languages, well-formed semantic composition of languages and reasoning about systems described using heterogeneous languages are of particular interest. Following the three previous editions, a major objective is to continue collaborations and to expand a community that is focused on solving the problems arising from the *globalization of modeling languages*; i.e., the use of multiple DSLs to support coordinated development of diverse aspects of a system.

GEMOC 2017 will provide an open forum for sharing experiences, problems and solutions on the conjoint use of multiple modeling languages. This workshop will be the place where concrete artifacts, ideas and opinions are exchanged in order to reap constructive feedback. Following the two four editions, a major objective is to continue collaborations and to expand a community that is focused on solving the problems arising from *the globalization of modeling languages*; i.e., the use of multiple DSLs to support coordinated development of diverse aspects of a system.

## Program

The workshop will take place in room Capitol Ballroom H.

<table>
<tr>
	<td colspan="2"><b>Session 1</b>: 9:00 – 10:30</td>
</tr>
<tr>
	<td width="100em" valign="top">09:00 – 09:15&nbsp;</td>
	<td>Opening</td>
</tr>
<tr>
	<td valign="top">09:15 - 10:30&nbsp;</td>
	<td>Keynote <i>Hans Vangheluwe - Co-simulation: Serving Multiple Masters - A Research Agenda</i> by Hans Vangheluwe</td>
</tr>

<tr><td colspan="2">&nbsp;</td></tr>

<tr>
	<td valign="top">10:30 – 11:00&nbsp;</td>
  <td><i>Coffee Break</i></td>
</tr>

<tr><td colspan="2">&nbsp;</td></tr>

<tr>
	<td colspan="2"><b>Session 2</b>: 11:00 – 12:30</td>
</tr>
<tr>
	<td valign="top">11:00 – 11:20&nbsp;</td>
	<td><i>
	Bridging Engineering and Formal Modeling: WebGME and Formula Integration
	</i>
	by Tamas Kecskes, Qishen Zhang and Janos Sztipanovits
	</td>
</tr>
<tr>
	<td valign="top">11:20 – 11:40&nbsp;</td>
	<td><i>
	CREST - A Continuous, REactive SysTems DSL
	</i>
	by Stefan Klikovits, Alban Linard and Didier Buchs
	</td>
</tr>
<tr>
	<td valign="top">11:40 – 12:00&nbsp;</td>
	<td><i>
	Modeling co-simulation : a first experiment
	</i>
	by Renan Leroux, Ileana Ober, Marc Pantel and Jean-Michel Bruel
	</td>
</tr>
<tr>
	<td valign="top">12:00 - 12:30&nbsp;</td>
	<td><i>
	Discussion and closing
	</i>
	</td>
</tr>
</table>

## Keynote

We're happy to announce that GEMOC 2017 features a keynote by [Hans Vangheluwe](http://msdl.cs.mcgill.ca/people/hv/) of McGill University on Multi-Paradigm Modeling for Cyber-Physical Systems.

**Hans Vangheluwe - Co-simulation: Serving Multiple Masters - A Research Agenda**

The relationship between system integrators and their suppliers puts ever increasing demands on modelling and simulation technology. The supplier wants (1) to evaluate, using modelling and simulation, the suitability/optimality of a single component available multiple suppliers and (2) to perform early system integration and evaluation of multiple heterogeneous components developed by different suppliers. The evaluation may cover both functional and non-functional (e.g., safety, energy efficiency) properties. The challenge is to evaluate while keeping supplier IP protected.

In this presentation, different alternative solutions will be investigated, with a particular focus on co-simulation. In co-simulation, suppliers share only pre-compiled components, known as Functional Mockup Units (FMUs).
The FMUs hide IP, but do expose sufficient information in their API to allow for meaningful orchestrated co-simulation. The current Functional Mockup Interface (FMI) standard defines both a model-simulation solver interface and an interface between the FMU (a model/simulation solver combination) and the context in which it is used.
FMUs are commonly combined using a "master" simulator which orchestrates the interleaving of the individual simulators. An obvious challenge with pre-compiled components which expose only limited information is to guarantee overall correct simulation results. Correctness ranges from numerical stability to satisfying domain (e.g., physics conservation) laws. At the root of this is the need for compositionality of the components.

The presentation will further explore some research challenges: optimizing overall simulation performance by constructing optimal master algorithms; the combination of multiple modelling formalisms (in particular, continuous-discrete combinations); the inclusion of models at different levels of abstraction in a single FMU; support for dynamic-structure models, including possible changes in computational causality; the introduction of non-deterministic models, to for example model the environment in which a system operates.


## Call for Papers / Models

### Context and Motivation

Software intensive systems are becoming more complex, driven by the need to integrate multiple concerns. These concerns are usually modeled using different languages, with specific concepts, technologies, and abstraction levels. This multiplication of languages eases the development related to each specific concern but raises language and technology integration problems at the different stages of the software life cycle. In order to reason about the global system, it becomes necessary to explicitly describe the different kinds of relationships that exist between the different languages used in the development of a complex system. To support effective language integration, there is a pressing need to reify and classify these relationships, as well as the language interactions that the relationships enable.

The 2017 edition of the GEMOC workshop will follow the successful previous four editions: [GEMOC at MODELS 2013]({{ site.baseurl }}{% link events/gemoc2013.md %}) in Miami, USA, [GEMOC at MODELS 2014]({{ site.baseurl }}{% link events/gemoc2014.md %}) in Valencia, Spain, [GEMOC at MODELS 2015]({{ site.baseurl }}{% link events/gemoc2015.md %}) in Ottawa, Canada, and [GEMOC at MODELS 2016]({{ site.baseurl }}{% link events/gemoc2016.md %}) in Saint-Malo, France. This edition will complete the state-of-the-art and practice initiated during the last years. This edition will also continue to investigate the language interfaces required in the context of the globalization of modeling languages. Additionally, it will study the possible relationships with the viewpoint engineering and the notion of multi-paradigm modeling. It will also strengthen the community that broadens the current DSML research focus beyond the development of independent DSMLs to a research focus that provides support for globalized DSMLs.

GEMOC 2017 is supported by [the GEMOC initiative]({{ site.baseurl }}/), which promotes research seeking to develop the necessary breakthroughs in software languages to support global software engineering, i.e., breakthroughs that lead to effective technologies supporting different forms of language integration, including language collaboration, interoperability and composability.

### Topics

The topics of interest for GEMOC 2017 include:

- Composability and interoperability of heterogeneous modeling languages
- Language integration challenges, from requirement to design, for analysis and simulation, during runtime, etc.
- Model and metamodel composition
- Language interface, viewpoint
- Heterogeneous modeling and simulation
- Language-based socio-technical coordination

Submissions describing practical and industrial experience related to the use of heterogeneous modeling languages are also encouraged, particularly in the following application domains:

- Cyber-Physical Systems, System of Systems
- Internet of Services, Internet of Things
- Complex Adaptive Systems
- Smart City, Smart Building, Home automation
- Smart Grids, management of renewable and intermittent energy sources
- Industry 4.0 and the smart factory of the future

### Types of Contributions

As contributions, we expect descriptions of case studies on the coordinated use of multiple modeling languages, and/or descriptions of practical experience, opinions and related approaches. Authors will be invited to submit short papers describing (i) their language integration experience, or (ii) novel approaches for integrating modeling languages. Authors will also be invited to provide archived full versions of models used to illustrate their novel approach or experience on [the Repository for Model-Driven Development](http://www.cs.colostate.edu/remodd/v1/) (ReMoDD). This will allow participants to share their models with each other and the wider modeling community before and after the workshop.

Each contribution must be described in a short paper not exceeding 10 pages in the LNCS format. Each paper should describe problems, case studies, or solutions related to the topics of interest. Each paper is expected to highlight the relationships between modeling languages, as well as their management.

Papers that describe use cases, or novel integration approaches can be accompanied by concrete artifacts, such as models (requirements, design, analysis, transformation, composition, etc.), stored in ReMoDD. Artifacts should illustrate any experience on the conjoint use of different modeling languages.

Submitted articles must not have been previously published or currently submitted for publication elsewhere. The program chairs will apply the principles of the ACM Plagiarism Policy throughout the submission and review process. All contributions will be reviewed and selected by the program committee members.

### Submission

Each contribution must not exceed 10 pages in [the LNCS format](http://www.springer.com/computer/lncs?SGWID=0-164-6-793341-0) and must be [submitted electronically in pdf format via Easychair](https://easychair.org/conferences/?conf=gemoc2017).

In addition, the concrete models referenced in a contribution should be submitted to [ReMoDD](http://www.cs.colostate.edu/remodd/v1/).

### Publication

The accepted papers will be published by CEUR in the workshop proceedings, which is indexed by DBLP. Moreover, the models will be published on ReMoDD. Also, participants will be strongly encouraged to participate in preparing the workshop report.

## Important Dates

- Paper submission deadline: ~~July 07, 2017~~, **July 14, 2017** (Extended)
- Notification of acceptance: July 28, 2017
- Workshop: September 19, 2017

## Committees

### Organizers ([contact](mailto:gemoc2017@gemoc.org))

- [Frédéric Boulanger](http://www.supelec.fr/359_p_10036/frederic-boulanger.html), CentraleSupélec/LRI, Université Paris-Saclay, France
- [Eugene Syriani](http://www-ens.iro.umontreal.ca/~syriani/main.html), University of Montreal, Canada
- [Andreas Wortmann](www.se-rwth.de/~wortmann), RWTH Aachen University, Germany

### Program Committee

* Marsha Chechik (University of Toronto)
* Tony Clark (Sheffield Hallam University)
* Benoit Combemale (IRISA, Université de Rennes 1)
* Jonathan Corley (University of West Georgia)
* Julien Deantoni (UNS - I3S - INRIA Sophia Antipolis Mediterranee)
* Jeff Gray (University of Alabama)
* Jean-Marc Jézéquel (University of Rennes)
* Ralf Lämmel (Universität Koblenz-Landau)
* Marjan Mernik (University of Maribor)
* Gunter Mussbacher (McGill University)
* Florian Noyrit (CEA LIST)
* Richard Paige (University of York)
* Bernhard Rumpe (RWTH Aachen University)
* Matthias Schöttle (McGill University)
* Safouan Taha (CentraleSupélec, LRI)
* Mark Van Den Brand (Eindhoven University of Technology)
* Hans Vangheluwe (McGill University)
* Markus Voelter (Independent)
