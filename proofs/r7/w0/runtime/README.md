# Leyforge R7 W0 proof runtime

This nested Godot project is a development-only PRD-07 fixture. It has no production gameplay authority and does not open R8.

The tracked project deliberately contains no dependency binaries. The governed runner verifies immutable upstream artifacts, copies only the required Voxel Tools GDExtension files into an ignored clean workspace, generates an exact role/build manifest, exports a real client or dedicated artifact, and executes that artifact directly.

Canonical semantic, world, session, and frame state lives under `src/domain`. Provider-specific access is confined to `src/provider/voxel_tools_adapter.gd`. Runtime/provider IDs exist only in disposable projection and provider mappings.
