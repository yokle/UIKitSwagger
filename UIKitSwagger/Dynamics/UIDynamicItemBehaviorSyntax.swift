//
//  UIDynamicItemBehaviorSyntax.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/14/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

/**
  Convenience operator for adding a dynamic item to a dynamic item behavior.
*/
public func +=(behavior: UIDynamicItemBehavior, item: UIDynamicItem) {
    behavior.addItem(item)
}

/**
  Convenience operator for adding an array of dynamic items to a dynamic item behavior.
*/
public func +=(behavior: UIDynamicItemBehavior, items: [UIDynamicItem]) {
    for item in items {
        behavior += item
    }
}

/**
  Convenience operator for removing a dynamic item from a dynamic item behavior.
*/
public func -=(behavior: UIDynamicItemBehavior, item: UIDynamicItem) {
    behavior.removeItem(item)
}

/**
  Convenience operator for removing an array of dynamic items from a dynamic item behavior.
*/
public func -=(behavior: UIDynamicItemBehavior, items: [UIDynamicItem]) {
    for item in items {
        behavior -= item
    }
}

/**
  Convenience operator for adding angular velocity to a dynamic item attached to a dynamic item behavior.
*/
infix operator <+ { }

public func <+(behavior: UIDynamicItemBehavior, itemVelocityPair: (UIDynamicItem, CGFloat)) {
    behavior.addAngularVelocity(itemVelocityPair.1, forItem: itemVelocityPair.0)
}

/**
  Convenience operator for retrieving the angular velocity of a dynamic item attached to a dynamic item behavior.
*/
infix operator <? { }

public func <?(behavior: UIDynamicItemBehavior, item: UIDynamicItem) -> CGFloat {
    return behavior.angularVelocityForItem(item)
}

/**
  Convenience operator for adding linear velocity to a dynamic item attached to a dynamic item behavior.
*/
infix operator -+ { }

public func -+(behavior: UIDynamicItemBehavior, itemVelocityPair: (UIDynamicItem, CGPoint)) {
    behavior.addLinearVelocity(itemVelocityPair.1, forItem: itemVelocityPair.0)
}

/**
  Convenience operator for retrieving the linear velocity of a dynamic item attached to a dynamic item behavior.
*/
infix operator -? { }

public func -?(behavior: UIDynamicItemBehavior, item: UIDynamicItem) -> CGPoint {
    return behavior.linearVelocityForItem(item)
}
