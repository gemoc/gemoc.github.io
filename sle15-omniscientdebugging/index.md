---
layout: default
---

# Supporting Efficient and Advanced Omniscient Debugging for xDSMLs (SLE’15)

> Omniscient debugging is a promising technique that relies on execution traces to enable free traversal of the states reached by a system during an execution. While some General-Purpose Languages (GPLs) already have support for omniscient debugging, developing such a complex tool for any executable Domain-Specific Modeling Language (xDSML) remains a challenging and error prone task. A solution to this problem is to define a generic omniscient debugger for all xDSMLs. However, generically supporting any xDSML both compromises the efficiency and the usability of such an approach. Our contribution relies on a partly generic omniscient debugger supported by generated domain-specific trace management facilities. Being domain-specific, these facilities are tuned to the considered xDSML for better efficiency. Usability is strengthened by providing multidimensional omniscient debugging. Results show that our approach is on average 3.0 times more efficient in memory and 5.03 more efficient in time when compared to a generic solution that copies the model at each step.

# Running the evaluation

#### Preparing the GEMOC Studio

1. Download the latest version of the GEMOC studio: [http://gemoc.org/studio-download/]({{ site.baseurl }}/studio-download/)
2. Install Eclipse MAT on top of the GEMOC Studio: [https://www.eclipse.org/mat/downloads.php](https://www.eclipse.org/mat/downloads.php)
3. Start the GEMOC studio in a new workspace

#### Getting the fUML xDSML

1. In the git perspective, add a new git repository : [https://github.com/gemoc/activitydiagram.git](https://github.com/gemoc/activitydiagram.git)
2. Right click on the repository, and add all the projects that are in the dev/gemoc_commons/language_workbench and dev/gemoc_sequential/language_workbench folders

#### Getting the benchmark tool and material

1. In the Git perspective, add a new git repository : [https://scm.gforge.inria.fr/anonscm/git/lastragen/lastragen.git](https://scm.gforge.inria.fr/anonscm/git/lastragen/lastragen.git)
2. Go into the Tags of the repository, right click on the sle15 tag, and choose “Checkout”
3. Then, right click on the repository, do “import projects”, uncheck “Search for nested projects”, and import all projects except for the ones starting with “fr.inria.diverse.tracemm”.

#### Configuring and starting the evaluation

1. In the fr.inria.diverse.trace.benchmark project, open the fr.inria.diverse.trace.benchmark.start.BenchmarkStart class, and edit the two variables heapDumpFolder and outputFolder to set a folder where memory heap dumps can be stored, and a folder where results (ie. a csv file) are written
2. In the run-configuration folder of the fr.inria.diverse.trace.benchmark project, right-click on RunBenchmark.launch and choose “Run as… RunBenchmark”

# Source code (git)

[https://scm.gforge.inria.fr/anonscm/git/lastragen/lastragen.git](https://scm.gforge.inria.fr/anonscm/git/lastragen/lastragen.git)

# Eclipse update site (used by the GEMOC Studio)

[https://ci.inria.fr/lastragen/job/lastragen/lastSuccessfulBuild/artifact/fr.inria.diverse.trace.updatesite/target/repository/](https://ci.inria.fr/lastragen/job/lastragen/lastSuccessfulBuild/artifact/fr.inria.diverse.trace.updatesite/target/repository/)
