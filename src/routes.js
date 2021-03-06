/**
 * Routes.
 * @module routes
 */

import { App } from '@plone/volto/components';
import { defaultRoutes } from '@plone/volto/routes';
import config from '@plone/volto/registry';
import DesignSystem from '@plone/volto-quanta/components/DesignSystem/DesignSystem';

/**
 * Routes array.
 * @array
 * @returns {array} Routes.
 */

const routes = [
  {
    path: '/',
    component: App, // Change this if you want a different component
    routes: [
      // Add your routes here
      {
        path: '/',
        component: DesignSystem,
        exact: true,
      },
      ...(config.addonRoutes || []),
      ...defaultRoutes,
    ],
  },
];

export default routes;
