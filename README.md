# InfiniteScroller

Microlibrary which simplifies implementation of infinite scroll in `UIScrollView`.

## Motivation

Well in my apps I always deal with the same things again. Every scrolling screen which displays paged data needs to load next page some time. To save some time I created this microlibrary which should deal with everything that is necessary. Every time when user reaches a treshold, the caller is notified and can perform e.g. a network request which fetches new page of data.

## Usage

## Installation

_InfiniteScroller_ is available through [Carthage](https://github.com/Carthage/Carthage). Just add it to your Cartfile:

```
github "olejnjak/InfiniteScroller"
```

Or add it to your Podfile if you're using [Cocoapods](https://cocoapods.org) 😎

```
pod "InfiniteScroller"
```

If you're familiar with integrating manually it's your turn 🙂. Or if you'd love to use a different way of integration, PRs are welcome 🙂
