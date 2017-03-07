---
layout: default
title: Gallery
permalink: gallery.html

langSeq: <img title="The domain language can be executed with a sequential engine (Java)." src="gallery/icons/IconeGemocLanguage-Sequential-48.png" alt="Sequential Language" width="16" height="16">
langCon: <img title="The domain language can be executed with a concurrent engine (ccsljava)." src="gallery/icons/IconeGemocLanguage-Concurrent-48.png" alt="Concurrent Language" width="16" height="16">
bcoolLangCoord: <img title="Models of this domain language can be coordinated with other models (of the same language or other languages)." src="gallery/icons/bcool-icon-32.png" width="16" height="16">
download: <img title="the language is available through the GEMOC discovery service." src="gallery/icons/download_gemoc_studio.png" width="16">
pkg: <img title="the language is available as sample in the GEMOC Studio." src="gallery/icons/gemoc_eclipse_package.png" width="16" height="16">
moliz: <img title="The domain language can be executed with an xMOF engine." src="gallery/icons/xmof_moliz_ico.png" alt="" width="16" height="16">
---

# Gallery

## What can you do with the GEMOC Studio?

Discover concrete examples of modeling languages created with the GEMOC Studio for various use-cases: Systems Engineering, Software Development, Business Configuration, Computational Science, etc.

<hr>

<!-- Activity Diagram  -->
<div class="row">    
    <div class="col-md-8 col-md-push-4">
        <h3>Activity Diagram {{ page.langSeq }} {{ page.langCon }} {{ page.bcoolLangCoord }} {{ page.download }}</h3>
        <p>This is an implementation of the UML Activity Diagram language.</p>

        <h4>Related links</h4>
        <ul>
            <li><a href="{{ site.baseurl }}{% link ttc15/index.md %}">General presentation</a></li>
            <li><a href="https://github.com/gemoc/activitydiagram">Github</a> page (language)</li>
            <li><a href="https://github.com/gemoc/gemoc-studio/tree/master/official_samples/bcool_TFSMAndActivity">Github</a> (coordination with TFSM)</li>
        </ul>
    </div>
    <div class="col-md-4 col-md-pull-8">
        <a href="gallery/activitydiagram_sequential.png">
            <img class="img-responsive img-hover" src="gallery/activitydiagram_sequential-300x142.png" alt="">
        </a>
    </div>
</div>

---

<!-- ArduinoDesigner  -->
<div class="row">    
    <div class="col-md-8 col-md-push-4">
        <h3>ArduinoDesigner {{ page.langSeq }} {{ page.langCon }} {{ page.download }}</h3>
        <p>Arduino provides a simple modeling language to graphically design programs (namely sketches) based on a given hardware configuration (arduino with sensors and actuators).</p>

        <h4>Related links</h4>
        <ul>
            <li><a href="https://github.com/gemoc/arduinomodeling">Github page</a></li>
            <li><a href="{{ site.baseurl }}{% link breathe-life-into-your-designer.html %}">Additional presentation</a></li>
        </ul>
    </div>
    <div class="col-md-4 col-md-pull-8">
        <a href="gallery/arduino-running.gif">
            <img class="img-responsive img-hover" src="gallery/arduino-running-300x228.gif" alt="">
        </a>
    </div>
</div>

---

<!-- Farming System  -->
<div class="row">
    <div class="col-md-8 col-md-push-4">
        <h3>Farming System {{ page.langSeq }}</h3>
        <p>Farming System aims at modeling a farm and simulating water consomption. This DSL illustrates how to combine textual and graphical modeling in the context of computational sciences.</p>

        <h4>Related links</h4>
        <ul>
            <li><a href="https://github.com/gemoc/farmingmodeling/tree/master/dev">Github page</a></li>
        </ul>
    </div>
	<div class="col-md-4 col-md-pull-8">
        <a href="gallery/agrodsl-instances.png">
            <img class="img-responsive img-hover" src="gallery/agrodsl-instances-300x146.png" alt="">
        </a>
    </div>
</div>

---

<!-- FSM  -->
<div class="row">
    <div class="col-md-8 col-md-push-4">
        <h3>FSM {{ page.langSeq }} {{ page.pkg }}</h3>
        <p>The FSM (Finite State Machine) language implement the behavior of <a href="https://en.wikipedia.org/wiki/Mealy_machine">mealy machine</a>.</p>

        <h4>Related links</h4>
        <ul>
            <li><a href="https://github.com/gemoc/gemoc-studio/tree/master/official_samples/LegacyFSM">Github page</a></li>
        </ul>
    </div>
    <div class="col-md-4 col-md-pull-8">
        <a href="gallery/activitydiagram_sequential.png">
            <img class="img-responsive img-hover" src="gallery/activitydiagram_sequential-300x142.png" alt="">
        </a>
    </div>
</div>

---

<!-- MarkedGraph  -->
<div class="row">
    <div class="col-md-8 col-md-push-4">
        <h3>MarkedGraph {{ page.langCon }} {{ page.download }}</h3>
        <p>Implementation of a DSL for Marked Graph.</p>

        <h4>Related links</h4>
        <ul>
            <li><a href="http://gemoc.github.io/gemoc-studio/publish/tutorial_markedgraph/html_single/GuideTutorialMarkedGraph.html">Tutorial</a></li>
            <li>Github page</li>
        </ul>
    </div>
    <div class="col-md-4 col-md-pull-8">
        <a href="gallery/MG-XDSML-62-step-2-t1.png">
            <img class="img-responsive img-hover" src="gallery/MG-XDSML-62-step-2-t1-300x173.png" alt="">
        </a>
    </div>   
</div>

---

<!-- MiniTL  -->
<div class="row">
    <div class="col-md-8 col-md-push-4">
        <h3>MiniTL {{ page.langSeq }}</h3>
        <p><strong>MiniTL</strong> is a textual transformation language for <a href="http://www.eclipse.org/modeling/emf/">EMF</a> models.</p>

        <h4>Related links</h4>
        <ul>
            <li><a href="https://github.com/tetrabox/minitl">Github</a></li>
        </ul>
    </div>
    <div class="col-md-4 col-md-pull-8">
        <a href="gallery/MiniTL_debug.png">
            <img class="img-responsive img-hover" src="gallery/MiniTL_debug-300x215.png" alt="">
        </a>
    </div>
</div>

---

<!-- Petri net  -->
<div class="row">
    <div class="col-md-8 col-md-push-4">
        <h3>Petri net {{ page.moliz }}</h3>
        <p>Implementation of a DSL for Petri nets.</p>

        <h4>Related links</h4>
        <ul>
            <li><a href="https://github.com/moliz/moliz.gemoc/tree/master/examples/petrinet">Github</a></li>
            <li><a href="https://hal.inria.fr/hal-01355391">Additional presentation</a></li>
        </ul>
    </div>
    <div class="col-md-4 col-md-pull-8">
        <a href="gallery/xmof_petrinet.png">
            <img class="img-responsive img-hover" src="gallery/xmof_petrinet-300x184.png" alt="">
        </a>
    </div>
</div>

---

<!-- SigPML  -->
<div class="row">
    <div class="col-md-8 col-md-push-4">
        <h3>SigPML {{ page.langCon }} {{ page.bcoolLangCoord }} {{ page.pkg }}</h3>
        <p>SigPML is a DSL dedicated to Signal Processing Modeling Language.</p>

        <h4>Related links</h4>
        <ul>
            <li><a href="http://gemoc.github.io/gemoc-studio/publish/tutorial_sigpml/html_single/Tutorial_SigPML.html">Tutorial</a></li>
            <li><a href="https://github.com/gemoc/gemoc-studio/tree/master/official_samples/SigPML">GitHub</a> (language)</li>
            <li><a href="https://github.com/gemoc/gemoc-studio/tree/master/official_samples/bcool_TFSMAndSigPML">Github</a> (coordination with TFSM)</li>
        </ul>
    </div>
    <div class="col-md-4 col-md-pull-8">
        <a href="gallery/OverviewExecuteSigpmlModelWithVCD.png">
            <img class="img-responsive img-hover" src="gallery/OverviewExecuteSigpmlModelWithVCD-300x195.png" alt="">
        </a>
    </div>
</div>

---

<!-- TFSM  -->
<div class="row">
    <div class="col-md-8 col-md-push-4">
        <h3>TFSM {{ page.langCon }} {{ page.bcoolLangCoord }} {{ page.pkg }}</h3>
        <p>TFSM is a version of Finite State Machine with time.</p>

        <h4>Related links</h4>
        <ul>
            <li><a href="https://some.url.here">GitHub</a> (language)</li>
            <li><a href="https://some.url.here">Github</a> (coordination with ActivityDiagram)</li>
            <li><a href="https://some.url.here">Github</a> (coordination with SigPML)</li>
        </ul>
    </div>
    <div class="col-md-4 col-md-pull-8">
        <a href="gallery/gemoc_modeling_workbench_TFSM_animation_screenshot.png">
            <img class="img-responsive img-hover" src="gallery/gemoc_modeling_workbench_TFSM_animation_screenshot-300x262.png" alt="">
        </a>
    </div>
</div>

---

<!-- xCapella  -->
<div class="row">
    <div class="col-md-8 col-md-push-4">
        <h3>xCapella {{ page.langCon }} {{ page.bcoolLangCoord }}</h3>
        <p>xCapella is an executable extension of <a href="https://polarsys.org/capella/">Capella</a>.
The execution is mainly based on the coordination of two sub languages: Mode Automata and DataFlow.</p>

        <h4>Related links</h4>
        <ul>
            <li><a href="{{ site.baseurl }}{% link pub/anr/finalworkshop/2016-03-anr-gemoc-workshop-final-experimentations.pdf %}">Slides</a></li>
        </ul>
    </div>
    <div class="col-md-4 col-md-pull-8">
        <a href="gallery/xcapella.png">
            <img class="img-responsive img-hover" src="gallery/xcapella-300x224.png" alt="">
        </a>
    </div>
</div>

---

<div class="alert alert-info" role="alert">

<h4>Your language created with GEMOC is not listed here?</h4>

Feel free to submit your work here: <a href="">gemoc-studio/issues</a>.

</div>
