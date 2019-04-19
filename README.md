<p align='center'>
    <img src="Logo.png" width="480" max-width="90%" alt="Infinite Scroller">
</p>

<p align="center">
    <img src="https://travis-ci.com/olejnjak/InfiniteScroller.svg?branch=master" alt="Travis CI build status">
    <a href="https://cocoapods.org/pods/InfiniteScroller">
        <img src="https://img.shields.io/cocoapods/v/InfiniteScroller.svg?style=flat)](http://cocoapods.org/pods/InfiniteScroller" alt="InfiniteScroller">
    </a>
    <a href="https://github.com/Carthage/Carthage">
        <img src="https://img.shields.io/badge/carthage-compatible-brightgreen.svg?style=flat" alt="Carthage" />
    </a>
    <a href="https://twitter.com/olejnjak">
        <img src="https://img.shields.io/badge/twitter-@olejnjak-blue.svg?style=flat" alt="Twitter" />
    </a>
</p>

Microlibrary which simplifies implementation of infinite scroll in `UIScrollView`.

## Motivation

Well in my apps I always deal with the same things again. Every scrolling screen which displays paged data needs to load next page some time. To save some time I created this microlibrary which should deal with everything that is necessary. Every time when user reaches a treshold, the caller is notified and can perform e.g. a network request which fetches new page of data.

## Usage

Usage is very simple. Just create an instance of `InfiniteScroller` with the scrollView you want paged.

```swift
let infiniteScroller = InfiniteScroll(scrollView: scrollView)
```

Add the next page callback.

```swift
infiniteScroller.nextPageAction = { [weak self] completion in
    loadNextPage { completion() }
}
```

**Remember to call the `completion` callback when loading next page finishes**

And that's all. Remember that if you loose any reference to the `InfiniteScroller` instance, it will get deallocated and you will not receive any callbacks so you have to keep strong reference somewhere (e.g. in the view controller).

For more details you can check included example. 🙂

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
