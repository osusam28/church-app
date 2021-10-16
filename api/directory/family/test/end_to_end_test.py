from directory import app

def test_app_execution():
    out = app.get_directory_entity()
    assert out is not None