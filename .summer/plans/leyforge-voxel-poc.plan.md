---
name: leyforge-voxel-poc
overview: >-
  Godot-adapted Forest Hamlet POC: Stage 1 -- first-person voxel world with
  block breaking/placement, inventory, and basic crafting
createdAt: '2026-07-21T08:48:53.746Z'
todos:
  - id: voxel-chunk-system
    content: >-
      Build chunk-based voxel terrain system with ArrayMesh generation, flat
      terrain with grass/dirt/stone layers, and chunk management
    status: in_progress
  - id: first-person-controller
    content: >-
      Build first-person controller with WASD movement, mouse look, jump, and
      Escape to release cursor
    status: pending
  - id: block-interaction
    content: >-
      Add block breaking (left-click) and placement (right-click) via raycast
      with highlight outline on targeted block
    status: pending
  - id: inventory-hotbar
    content: >-
      Build simple inventory system with hotbar UI, item switching, and block
      placement from selected slot
    status: pending
  - id: basic-crafting
    content: >-
      Add basic crafting recipes (wood -> planks, planks -> crafting table) with
      simple crafting UI
    status: pending
  - id: stage1-playtest
    content: >-
      Verify Stage 1 runs: player can move, break/place blocks, switch items,
      and craft basics
    status: pending
---
## Scene Structure
- `res://main.tscn` -- World root
  - `WorldEnvironment` with basic sky and directional light
  - `ChunkManager` (Node3D) -- manages chunk loading/unloading, owns VoxelWorld script
  - `Player` (CharacterBody3D) -- first-person controller
    - `Camera3D` -- mouse-look camera
    - `RayCast3D` -- block targeting
    - `MeshInstance3D` -- highlight outline for targeted block

## Scripts
- `res://scripts/voxel/chunk.gd` -- Single chunk: stores 3D array of block IDs, generates mesh via SurfaceTool
- `res://scripts/voxel/chunk_manager.gd` -- Manages active chunks around player, creates/destroys as player moves
- `res://scripts/voxel/block_registry.gd` -- Autoload: block definitions (name, color, hardness) from VoxelRegistry.json
- `res://scripts/player/player_controller.gd` -- First-person movement, mouse look, jump, raycast block interaction
- `res://scripts/ui/hotbar.gd` -- Hotbar UI showing 9 slots, scroll wheel to switch, number keys
- `res://scripts/inventory/inventory.gd` -- Autoload: player inventory data
- `res://scripts/crafting/crafting_recipes.gd` -- Recipe definitions and lookup

## Input Map
- move_forward/back/left/right: WASD
- jump: Space
- ui_cancel: Escape (releases mouse)
- break_block: Left Mouse Button
- place_block: Right Mouse Button
- hotbar_1 through hotbar_9: Number keys

## Chunk System
- 16x16x64 blocks per chunk (X x Z x Y)
- Each block stored as integer ID (0 = air, 1 = grass, 2 = dirt, 3 = stone, 4 = wood, 5 = planks)
- Greedy meshing optional for Stage 1; simple face-culled quads for now
- Chunks within render distance (4 chunks = 64 blocks) are loaded around player

## Terrain Generation
- Simple height-based: grass on top layer, dirt below (3-5 layers), stone below that
- Flat world with small Perlin-like variation for Stage 1

## Inventory
- 9 hotbar slots + 27 backpack slots (36 total)
- Each slot holds (item_id, count)
- Default hotbar: grass blocks, dirt, stone, wood, planks, empty

## Crafting
- 2x2 crafting grid in inventory screen
- Recipes: wood_log -> 4 planks, 4 planks -> crafting_table
- Output slot with click-to-craft
