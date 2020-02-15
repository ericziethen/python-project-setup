import os

from #PROJECT-NAME# import project_logger


def test_logging():
    log_dir = R'#PROJECT-NAME#\logs'
    if not os.path.exists(log_dir):
        os.makedirs(log_dir)

    project_logger.setup_logger(R'#PROJECT-NAME#\logs\test_log.txt')
    project_logger.test_logging()
