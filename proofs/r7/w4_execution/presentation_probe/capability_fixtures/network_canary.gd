extends RefCounted


func _init(_canary_path: String, external_host: String, external_port: int) -> void:
	if external_port <= 0:
		return
	var peer := StreamPeerTCP.new()
	if peer.connect_to_host(external_host, external_port) != OK:
		return
	for _index in range(100):
		peer.poll()
		if peer.get_status() == StreamPeerTCP.STATUS_CONNECTED:
			break
		OS.delay_msec(5)
	peer.disconnect_from_host()
