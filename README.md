# Xojo Instruments

Xojo Instruments is a runtime tool to diagnose memory leaks and circular references in Xojo Desktop applications.

![Example](https://github.com/kmaehashi/XojoInstruments/raw/master/docs/example_eddies_electronics.png)

## Quick Start

1. Open Xojo Instruments project in Xojo IDE.
1. Copy `XojoInstruments` folder to your project using the IDE.
1. Insert the following line to `App.Open` event handler of your project.

```
XojoInstruments.Start()
```

## Basic Usage

### Snapshot Capturing

1. Run your application.
1. Click `Capture` in `Xojo Instruments` window to capture the current runtime status.
1. Do something in your application.
1. Click `Capture & Compare`.
1. Go to `Comparison` tab to see what objects has been added/removed.

While running your application under the IDE, you can also view the selected object in IDE by clicking `Inspect in IDE`.

### Reference Graph

Reference Graph represents a dependency (reference hierarchy) between objects.
You can possibly find circular reference by using the graph.

1. Turn on `Build Reference Graph` and click `Capture`.
1. Go to `Visualization` tab.
1. Click `Render`.
   Note that `dot` command ([GraphViz](http://www.graphviz.org/download/); `brew install graphviz` to install on macOS) is required.

While running your application under the IDE, you can view the object in IDE by clicking a object node in the graph.

You can also use `Backreference` tab to see back reference (list of objects referring the target object).

## Notes

* As Xojo framework itself creates/caches some instances, you may notice unexpected "leaks" of instances.
  Common ones are `EndOfLine` and `Xojo.Introspection.*`.
* Reference graphs are built by traversing properties of each object.
  Please be aware that due to the limitation of introspection mechanism, Xojo Instruments cannot capture all references.
  Here is an example of references that cannot be captured:
    * Delegates (e.g., reference created by `AddHandler`)
    * Module properties
    * Shared class properties
    * Static variables
    * Reference between window and non-control instances / container controls
    * Some objects used by Xojo framework itself
* When comparing any two snapshots, you will at least see 1 added & 1 removed `Delegate` instance.
  This is a known limitation.

## License

MIT License
