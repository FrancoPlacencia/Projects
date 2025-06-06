export enum DialogMessageTypes {
  CONFIRM = 'CONFIRM',

  SUCCESS = 'SUCCESS',
  ERROR = 'ERROR',
  WARNING = 'WARNING',
  INFO = 'INFO',
  QUESTION = 'QUESTION',
  LOADING = 'LOADING',
  LOCK = 'LOCK',
  KEY = 'KEY',
  UNKONW = 'UNKONW',

  SERVER_ERROR = 'Server Error',
  SERVER_ERROR_MESSAGE = 'Opps something went wrong. Please try again later.',

  BAD_REQUEST = 'Bad Request',
  BAD_REQUEST_MESSAGE = 'Please review the data',

  CONFLICT = 'CONFLICT',
  ALREADY_EXISTS = 'Already Exists',

  LOADING_TITLE = 'Loading...',
  LOADING_REQUEST_MESSAGE = 'Please wait your request its running.',
  LOADING_DATA_MESSAGE = 'Please wait your data its loading.',

  CONFIRM_TITLE = 'Are you sure you want to continue?',
  CONFIRM_MESSAGE = '',
  DELETE_MESSAGE = 'Esta acción es permanente.',
}
