extends RefCounted

const FRAME_SIZE := 1024

static func choose_origin(canonical: Array) -> Array:
    return [
        floori(float(canonical[0]) / FRAME_SIZE) * FRAME_SIZE,
        floori(float(canonical[1]) / FRAME_SIZE) * FRAME_SIZE,
        floori(float(canonical[2]) / FRAME_SIZE) * FRAME_SIZE,
    ]

static func to_active(canonical: Array, origin: Array) -> Array:
    return [
        float(int(canonical[0]) - int(origin[0])),
        float(int(canonical[1]) - int(origin[1])),
        float(int(canonical[2]) - int(origin[2])),
    ]

static func to_canonical(active: Array, origin: Array) -> Array:
    return [
        int(round(active[0])) + int(origin[0]),
        int(round(active[1])) + int(origin[1]),
        int(round(active[2])) + int(origin[2]),
    ]

static func max_component_error(left: Array, right: Array) -> float:
    return maxf(
        absf(float(left[0]) - float(right[0])),
        maxf(absf(float(left[1]) - float(right[1])), absf(float(left[2]) - float(right[2])))
    )
