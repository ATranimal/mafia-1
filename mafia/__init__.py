from pyramid.config import Configurator


def main(global_config, **settings):
    """ This function returns a Pyramid WSGI application.
    """

    config = Configurator(settings=settings)
    config.include('pyramid_beaker')
    config.include('pyramid_mako')

    # Routes
    config.add_static_view('static', 'static', cache_max_age=3600)
    config.add_route('start', '/')
    config.add_route('play', '/play')
    config.add_route('done', '/done')

    config.scan()
    return config.make_wsgi_app()
