% An introduction to Tox
% The authors
% Toxcon 2019

# What is Tox?

## Tox Protocol

Tox is a distributed system for establishing authenticated encrypted direct 
network connections between peers.

If Alice and Bob know each other's public keys, they can find each other and 
establish a secure connection, punching through any firewalls.

## Tox Core

The Tox core is a networking library implementing the Tox protocol.

The reference implementation `c-toxcore` is ~40,000 SLOC of C,
licensed under GPLv3.
<!--
cd toxcore && wc -l `find -name '*.c' -or -name '*.h' -and -not -name '*.api.h'`
39875 total
-->

## Tox Clients

Tox is also a secure chat system. Once we have an authenticated encrypted 
network connection, we can push text, audio, video etc along it.

Tox clients wrap the tox core in a UI.

Since the core is GPL, all clients are free software.

[ insert screenshots of diverse clients clienting diversely ]


# Key features
## Distributed

No single point of failure.

No single point of metadata collection.

Volunteer-run publically listed bootstrap nodes are used to introduce new 
users to the network, only on first run.

## Encrypted

All cryptographical operations performed using NaCl/libsodium.

Has per-session perfect forward secrecy.

Communications are authenticated but not signed, and are deniable.

## Pseudonymous

Tox users are identified only by their Tox ID.

A Tox ID is simply a public key created by the user.

## Direct

Tox aims to form direct IP-to-IP UDP connections where possible.

This makes high-bandwidth applications like video feasible.

Volunteer-run TCP relays exist as a back-up, automatically used when a direct 
connection fails.

Tox is *not* designed for anonymous communications. However, it is possible to 
connect via Tor, using TCP relays.

## Groups

Private groups (``conferences'') for multi-user text/audio chats are 
implemented.

There are plans for public groups.

# Comparison with other secure chat systems

## Comparable systems
Centralised (Signal, Telegram, etc) and federated (Matrix) systems are 
different beasts entirely.

Comparable distributed systems:

* Jami (formerly known as GNU Ring)
* Ricochet

## Tox vs. Jami

Jami uses TLS, ICE (STUN/TURN), and OpenDHT on top of a SIP softphone to achieve 
much the same goals as Tox.

Tox meanwhile is a compact integrated system, essentially depending only on 
NaCl.

Jami does not seriously try to ensure metadata privacy, while Tox aims to.

## Tox vs. Ricochet

Ricochet uses Tor's hidden services mechanism to provide fully anonymous chat 
with full metadata privacy: snoopers can not determine even the IP addresses 
of your friends (assuming Tor works).

Tox meanwhile only aims (and fails) to prevent snoopers determining friends' 
Tox IDs.

Ricochet is text-only; Tor isn't designed for very-low-latency communications.


# Tox limitations and TODO list
## Status
Tox is very much a work in progress, though it is already useable and used.

[ insert mutant stag ]

New C developers to help with c-toxcore are particularly in need!
Talk to us if you might be interested.

## TODO: general cleanup of c-toxcore
### Problem
We want a readable hackable codebase well-covered by tests, as a foundation to 
further work.

### Progress
Toktok (iphy) did a lot of work on this, but some parts are still a bit funky.
In particular, the A/V library toxav needs work, and is mostly not covered by 
tests.

## TODO: multi-device
### Problem
Currently, each device is treated as a separate user

### Progress
Various proposals; at least one partial implementation

## TODO: metadata privacy
### Problem
The currently used ``onion'' system has known vulnerabilities; attackers 
could determine Tox IDs of the friends of a Tox ID.

### Progress
Proposal; implementation in progress

## TODO: traffic taming
### Problem
Nodes use significant bandwidth, and need to be able to accept 
packets at any time, causing problems for mobile users in particular.

### Progress
Various ideas; removing onion will help.

## TODO: UPnP support
### Problem
Current hole-punching doesn't always work; UPnP might help.

### Progress
There was a PR (FIXME: what happened with that?).

## TODO?: DoS resistance
### Problem
There are various ways a determined attacker could disrupt the 
public tox network.

### Progress
Not much. Probably not fully solvable without complete redesign.

## TODO?: Support post-quantum cryptography
### Problem
Tox exclusively uses elliptic curve cryptography (Curve25519) based on the 
discrete logarithm problem. This is known to be breakable by sufficiently 
advanced quantum computers (Shor's algorithm). Cryptographical schemes which 
appear to be quantum-resistant have been proposed.

### Progress
None.

## TODO?: offline messaging
### Problem
Both peers must be online simultaneously for communication.

### Progress
Various proposals, none satisfactory. May be unsolvable.
