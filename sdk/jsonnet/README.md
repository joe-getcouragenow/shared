# JSONNET

At Design, Gen, Build, CI and Deploy times we need a common way to get configuration.

We are using Uber at the moment but JSONNET seems to be a better solution that will pay off.
Its also a big part of Bazel ( https://github.com/bazelbuild/bazel-gazelle )
- https://github.com/google/go-jsonnet is used by Bazel to generate the build files and reeach into other repos to get theirs.

Grafanna Tank uses it to do the congi for k8 too
https://tanka.dev/install

SO it feel like a great tooling decision, and will make it easy to move to Bazel when we are ready.

Reality is that we are actually hitting the same problem for whcih Bazel was desgned for. Module Config and Build.

here is a simple example.

flutter
- package refs should use git or file references ?
- file references are fine because then local and CI just work because we assume that the other git repos are checked out by the CI script
- And the SDK, will do that checking out for you.
	- We will have a special sdk.yaml in which you declate what other repos you need in order to build that are part of GCN Or other Module developers.
	- Or we could use https://github.com/jsonnet-bundler/jsonnet-bundler
		- this woudl solve the golang generate problem
		- it would also solve the K8 / k3d problem.


ex

https://github.com/yoshz/monitoring-mixins