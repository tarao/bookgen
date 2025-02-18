import argparse
import http.server
from http.server import SimpleHTTPRequestHandler

class LocalHandler(SimpleHTTPRequestHandler):
    def guess_type(self, path):
        ctype = super().guess_type(path)
        if ctype.startswith('text/'):
            return ctype + '; charset=UTF-8'
        else:
            return ctype

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('port', default=8000, type=int, nargs='?',
                        help='bind to this port '
                        '(default: %(default)s)')
    args = parser.parse_args()
    http.server.test(
        HandlerClass=LocalHandler,
        port=args.port,
    )
