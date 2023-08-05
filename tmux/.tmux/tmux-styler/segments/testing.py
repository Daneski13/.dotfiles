import socket
from tmux_styler.Statusbar.Segments import DefinedSegment


def testing() -> DefinedSegment:
    hostname = socket.gethostname()
    ip_address = socket.gethostbyname(hostname)
    return ip_address
