// exportações de apis
export * from './api/groups_api';
export * from './api/projects_api';
export * from './api/user_api';
export * from './api/markdown_api';
export * from './api/bulk_imports_api';
export * from './api/namespaces_api';
export * from './api/tags_api';
export * from './api/alert_management_alerts_api';
export * from './api/harbor_registry';
export * from './api/environments_api';
export * from './api/application_settings_api';

// nota: não é possível espionar os métodos importados para esse arquivo em testes jest
// em testes jest, importar os métodos para o arquivo em que estejam definidos
//
// import * as UserApi from '~/api/user_api';
// vs...
// import * as UserApi from '~/rest_api';
//
// // isso irá funcionar apenas na opção #2 acima
// jest.spyOn(UserApi, 'getUsers')
