This is a registry control enforcement for Maven that would enforce developers to use our internal mirror registry as part of phase 3.

Threat mitigated:
- Dependcency confusion
- registry poisoning
- uncontrolled external resolution

Created an internal mirror on docker(artifactory) using maven repos, connected maven central -> maven internal -> maven local -> developers

More information on this on medium post.