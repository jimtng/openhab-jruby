---
layout: default
title: Rollershutter
nav_order: 1
has_children: false
parent: Items
grand_parent: Usage
---


# Rollershutter Item
This class extends the Rollershutter Item type with additional methods

| Method   | Description                                  | Example                                              |
| -------- | -------------------------------------------- | ---------------------------------------------------- |
| up?      | Returns true if item state == UP             | `puts "#{item.name} is up" if item.up?`              |
| down?    | Returns true if item state == DOWN           | `puts "#{item.name} is down" if item.down?`          |
| up       | Send UP command to item                      | `item.up`                                            |
| down     | Send DOWN command to item                    | `item.down`                                          |
| stop     | Send STOP command to item                    | `item.stop`                                          |
| move     | Send MOVE command to item                    | `item.move`                                          |
| position | Gets the position of the rollershutter       | `puts "#{item.name} is at #{item.position} percent"` |


## Examples ##

Roll up all Rollershutters in a group

```ruby
Shutters.each(&:up)
```

Log a warning for all rollershutters that are not up

```ruby
Shutters.reject(&:up?).each do |item|
  logger.warn("#{item.id} is not rolled up!")
end
```

Set rollershutter to a specified position

```ruby
Example_Rollershutter << 40
```