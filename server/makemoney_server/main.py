import falcon
from wsgiref import simple_server


class Root:

    def on_get(self, req, resp):
        resp.body = '(ﾉ´ヮ´)ﾉ*:･ﾟ✧'

    def on_post(self, req, resp):
        resp.body = 'It works!'


app = falcon.API()


root_view = Root()
app.add_route('/', root_view)


if __name__ == '__main__':
    httpd = simple_server.make_server('127.0.0.1', 8069, app)
    print('running on http://{}:{}'.format(*httpd.server_address))
    httpd.serve_forever()
