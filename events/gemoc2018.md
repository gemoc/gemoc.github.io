---
layout: event
title: GEMOC 2018
date: October 15, 2018, Copenhagen, Denmark
---

<div style="text-align: center;" markdown="1">

# 6th International Workshop on

# *The Globalization of Modeling Languages*

## October 15, Copenhagen, Denmark, co-located with [MODELS 2018](http://www.modelsconference.org/)

<strong>[About]({{ site.baseurl }}{% link events/gemoc2018.md %}#about-the-workshop) | [Program]({{ site.baseurl }}{% link events/gemoc2018.md %}#program) | [Call]({{ site.baseurl }}{% link events/gemoc2018.md %}#call-for-papers--models) | [Dates]({{ site.baseurl }}{% link events/gemoc2018.md %}#important-dates) | [Committees]({{ site.baseurl }}{% link events/gemoc2018.md %}#committees)</strong>


</div>

## About the Workshop

The increasing complexity of modern software-intensive systems demands for enhanced software engineering methods. Separation of concerns of the diverse stakeholders' facilitates the coordinated development of system aspects implementing these concerns. These different concerns are often associated with specialized description languages and technologies, which are based on concern-specific problems and solution concepts. Hence, software developers are faced with the challenging task of integrating the different languages and associated technologies used to produce software artifacts in the different concern spaces. GEMOC 2018 will be a full-day workshop that brings together researchers and practitioners in the modeling languages community to discuss the challenges associated with integrating multiple, heterogeneous modeling languages. The languages of interest range from requirements, to design and runtime languages, and include both general-purpose and domain-specific languages. Challenges related to engineering composable languages, well-formed semantic composition of languages and reasoning about systems described using heterogeneous languages are of particular interest. Following the three previous editions, a major objective is to continue collaborations and to expand a community that is focused on solving the problems arising from the *globalization of modeling languages*; i.e., the use of multiple DSLs to support coordinated development of diverse aspects of a system.

GEMOC 2018 will provide an open forum for sharing experiences, problems and solutions on the conjoint use of multiple modeling languages. This workshop will be the place where concrete artifacts, ideas and opinions are exchanged in order to reap constructive feedback. Following the two four editions, a major objective is to continue collaborations and to expand a community that is focused on solving the problems arising from *the globalization of modeling languages*; i.e., the use of multiple DSLs to support coordinated development of diverse aspects of a system.

## Program

TBA

## Keynote

The keynote will be given by [Mark van den Brand](https://www.tue.nl/en/research/researchers/mark-van-den-brand/).

### Model Driven Software Engineering creates tomorrow’s legacy

Software is everywhere we go. Among others, it powers the devices
we use in our daily life, it channels our social interactions via social
media, it enables our medical care. With the increasing number of
applications, the amount of software is exponentially increasing,
which challenges the way we develop and maintain our software
efficiently and effectively.

The software engineering (research) community is fully aware
of these challenges and attempts to tackle these by introducing
new development techniques, such as Agile software development,
test-driven software development and model driven software technology. The latter advocates the use of models and domain specific
languages (DSLs) to speed up the development of software, to increase understandability and quality of the resulting software.

Modeling and modeling languages are common practice in other
engineering domains, such as mechanical engineering. Modeling in
software development has accelerated with the launch of Unified
Modeling Language (UML). The use of multiple modeling languages
in UML has led to the development of Meta Object Facility (MOF)
and its derivative Eclipse Modeling Framework (EMF). Model driven
software engineering advocates the use of small languages that are
domain specific, provide a higher level of abstraction and facilitate
code generation. UML already offered the possibility to create domain specific extensions via profiles. MOF and specifically EMF
have given rise to the creation of small languages using the Eclipse
environment. EMF and the tooling using EMF, such as Xtext, ATL,
QVTo, ETL, etc., has led to an acceleration of the development of
domain specific languages.

The following challenges can be observed with respect to this
development.
1. The tooling used to create and use DSLs is far from mature,
is unstable, and gets rapidly deprecated. There is still a lot
of effort needed to improve the existing tooling.
2. The creation of a DSL involves understanding of the domain
for which the languages is created and having the capability
of translating this knowledge to concepts at the right level
of abstraction.
3. The increased level of abstraction and introduction of domain concepts makes the models harder to understand and
maintain. The use of DSLs involves also a risk, if the developer(s) of a DSL leaves the company then the maintenance of
the DSL may be jeopardized. The number of developers that
are able to understand and maintain DSLs is low; the number
of developers understanding general purpose languages, e.g.
C, will always be higher.
4. The interactions between software models and models from
other (system) engineering domains, e.g. describing physical
behavior, are becoming more and more important.

The (high-tech) industry has adopted model driven software
engineering and started introducing DSLs. These DSLs are prototypical, because capturing and defining domain concepts as well
as language development is new for them. Before the DSLs stabilizes, tens and sometimes even hundreds of models may already be
created. These models have to be migrated and can not be thrown
away, if the DSLs are adapted. These languages and corresponding
models will become legacy if we do not act by means of developing
proper development methodologies and tooling to support analysis of languages and models and the evolution of both languages
and models. So, both language and domain are in state of flux and
have to co-evolve, both on the syntactic but definitively also on the
semantic level, but this is hard and difficult work. We do not have
the tools for this and if we do not act now, we will have the same
legacy as we have software from a code perspective

One can wonder whether model driven software engineering is
indeed the next silver bullet to transform software development
or rather a silver-painted egg that when being fired creates a big
mess. Research on model driven techniques should move away
from just focusing on tooling, although that still work has to be
done to make the tools more robust and usable, but start focusing
on proper methodologies to extract domain concepts in order to
create usable DSLs. It should deal with evolutionary aspects of DSLs
and created models and work on stabilizing the tooling needed to
create languages and corresponding models, ensuring consistency
between languages and between models, and between languages
and models. These are just a few of the challenges that we are
facing. If we are able to make this happen then we might have
a silver bullet after all and the promised increase in quality and
productivity can be realized.


## Call for Papers / Models

### Context and Motivation

Software intensive systems are becoming more complex, driven by the need to integrate across multiple concerns. Consequently, the development of such systems requires the integration of different concerns and skills. These concerns are usually covered by different languages, with specific concepts, technologies and abstraction levels. This multiplication of languages eases the development related to one specific concern but raises language and technology integration problems at the different stages of the software life cycle. In order to reason about the global system, it becomes necessary to explicitly describe the different kinds of relationships that exist between the different languages used in the development of a complex system. To support effective language integration, there is a pressing need to reify and classify these relationships, as well as the language interactions that the relationships enable. 

The 2018 edition of the GEMOC workshop will follow the successful previous five editions: [GEMOC at MODELS 2013]({{ site.baseurl }}{% link events/gemoc2013.md %}) in Miami, USA, [GEMOC at MODELS 2014]({{ site.baseurl }}{% link events/gemoc2014.md %}) in Valencia, Spain, [GEMOC at MODELS 2015]({{ site.baseurl }}{% link events/gemoc2015.md %}) in Ottawa, Canada, [GEMOC at MODELS 2016]({{ site.baseurl }}{% link events/gemoc2016.md %}) in Saint-Malo, France, and [GEMOC at MODELS 2017]({{ site.baseurl }}{% link events/gemoc2017.md %}) in Austin, TX, USA.
This edition will complete the state-of-the-art and practice initiated during the last years. 
<!--
This edition will also continue to investigate the language interfaces required in the context of the globalization of modeling languages. Additionally, it will study the possible relationships with the viewpoint engineering and the notion of multi-paradigm modeling. 
-->
It will also strengthen the community that broadens the current DSML research focus beyond the development of independent DSMLs to a research focus that provides support for globalized DSMLs.


GEMOC 2018 is supported by [the GEMOC initiative]({{ site.baseurl }}/) and its associated Eclipse Research consortium, which promotes research seeking to develop the necessary breakthroughs in software languages to support global software engineering, i.e., breakthroughs that lead to effective technologies supporting different forms of language integration, including language collaboration, interoperability and composability.

### Workshop Format

The format of the workshop reflects the goals of the workshop: constructive feedback on submitted papers and other artifacts on the conjoint use of different modeling languages, collaborations, and community building. The format of the workshop is that of a working meeting. Hence, there is less focus on presentations and more focus on producing and documenting a research content that identifies challenges, different forms of language integration, and relates existing solutions.
 
The workshop consists of a morning session in which a keynote and short presentations of the accepted papers will be given. A significant amount of time will be reserved for discussing each paper and their relations to each other. The afternoon session is devoted to a working session dedicated to open discussions of the presented contributions and other topics suggested by the participants. The closing session is dedicated to develop a plan to publish the results of the discussion in a final workshop report.


### Topics

The topics of interest for GEMOC 2018 include:

- Tools and methods for engineering modeling languages
- Composability and interoperability of heterogeneous modeling languages
- Language integration challenges, from requirement to design, for analysis and simulation, during runtime, etc.
- Model and metamodel composition
- Language interface, viewpoint
- Heterogeneous modeling and simulation
- Language-based socio-technical coordination
- Multi-language or multi-disciplinary environment

Submissions describing practical and industrial experience related to the use of heterogeneous modeling languages are also encouraged, particularly in the following application domains:

- Cyber-Physical Systems, System of Systems
- Internet of Services, Internet of Things
- Complex Adaptive Systems
- Smart City, Smart Building, Home automation
- Smart Grids, management of renewable and intermittent energy sources
- Industry 4.0 and the smart factory of the future

### Types of Contributions

As contributions, we expect early research results about the aforementioned topics, descriptions of case studies on the coordinated use of multiple modeling languages, and/or descriptions of practical experience, opinions and related approaches.

Each contribution must be described in a short paper not exceeding 3 pages in the ACM sigconf format, or a full paper not exceeding 6 pages in the ACM sigconf format. Each paper should describe problems, case studies, or solutions related to the topics of interest. Each paper is expected to highlight the relationships between modeling languages, as well as their management.

Papers that describe use cases, or novel integration approaches can be accompanied by concrete artifacts, such as models (requirements, design, analysis, transformation, composition, etc.), stored in a public repository (e.g., [ReMoDD](http://www.cs.colostate.edu/remodd/v1/)). Artifacts should illustrate any experience on the conjoint use of different modeling languages.

Submitted articles must not have been previously published or currently submitted for publication elsewhere. The program chairs will apply the principles of the ACM Plagiarism Policy throughout the submission and review process. All contributions will be reviewed and selected by the program committee members.



### Submission

Each contribution must not exceed 3 pages for short papers and 8 pages for full papers in [the ACM sigconf](https://www.acm.org/publications/proceedings-template), and must be [submitted electronically in PDF format via Easychair](https://easychair.org/conferences/?conf=gemoc2018).

### Publication

The accepted papers will be published by CEUR in the workshop proceedings. Also, participants will be strongly encouraged to participate in preparing the workshop report.

## Important Dates

- Abstract submission deadline: July 10, 2018
- Paper submission deadline: July 17, 2018
- Notification of acceptance: August 17, 2018
- Workshop: October 15, 2018

## Committees

### Organizers ([contact](mailto:gemoc2018@gemoc.org))

- [Erwan Bousse](http://people.irisa.fr/Erwan.Bousse/), TU Wien, Austria
- [Benoit Combemale](http://combemale.fr), University of Toulouse, France
- [Jeff Gray](http://gray.cs.ua.edu/), University of Alabama, USA

### Program Committee

- Frédéric Boulanger (CentraleSupélec)
- Eugene Syriani (University of Montreal)
- Julien Deantoni (UNS - I3S - INRIA Sophia Antipolis Mediterranee)
- Jonathan Corley (University of West Georgia)
- Mark Van Den Brand (Eindhoven University of Technology)
- Bernhard Rumpe (RWTH Aachen University)
- Richard Paige (University of York)
- Tony Clark (Sheffield Hallam University)
- Marsha Chechik (University of Toronto)
- Andreas Wortmann RWTH (Aachen University)
- Tanja Mayerhofer (TU Wien)
- Marjan Mernik (University of Maribor)
