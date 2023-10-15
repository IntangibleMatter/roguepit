# Programming Style

## Physical

Code the game with objects representing physical objects, more naturalistic
style of programming that makes more sense with Godot.

### Pros

- How I'm used to programming
- Godot handles it really well

### Cons

Makes managing the whole game state harder.

## Data-based

Code the game with a GameManager that manages the whole board. Less natural to
code, but makes other stuff much easier to handle.

### Pros

- Enables easy running of everything in one giant singleton.

### Cons

