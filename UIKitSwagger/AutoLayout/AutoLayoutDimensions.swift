//
//  AutoLayoutDimensions.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 11/28/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

/**
  Convenience method for making the widths of two or more views equal.
  @param        views Two or more items that are to maintain the same width.
  @return       The constraints that were applied.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func ConstrainWidths(views: UIView...) -> [Constraint] {
    return ConstrainWidths(views)
}

/**
  Convenience method for making the widths of an array of views equal.
  @param        views Array of two or more items that are to maintain the same width.
  @return       The constraints that were applied.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func ConstrainWidths(views: [UIView]) -> [Constraint] {
    return ConstrainDimension(views, .Width)
}

/**
  Convenience method for making the heights of two or more views equal.
  @param        views Two or more items that are to maintain the same height.
  @return       The constraints that were applied.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func ConstrainHeights(views: UIView...) -> [Constraint] {
    return ConstrainHeights(views)
}

/**
  Convenience method for making the heights of an array of views equal.
  @param        views Array of two or more items that are to maintain the same height.
  @return       The constraints that were applied.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func ConstrainHeights(views: [UIView]) -> [Constraint] {
    return ConstrainDimension(views, .Height)
}

////////////////////////////////////////////////////////////////////////////////

private func ConstrainDimension(views: [UIView], dimension: NSLayoutAttribute) -> [Constraint] {
    AssertDimensionItemCount(views.count)

    var constraints = [Constraint]()
    let firstItem = views.first!.attributedItemForLayoutAttribute(dimension)
    for item in views[1..<views.endIndex] {
        let attributedItem = item.attributedItemForLayoutAttribute(dimension)
        let constraint = attributedItem =* firstItem
        constraint.apply()
        constraints.append(constraint)
    }

    return constraints
}

private func AssertDimensionItemCount(count: Int) {
    assert(count > 1, "Multiple views are required for constraining dimensions")
}
