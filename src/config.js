import React from 'react';
import '@plone/volto/config';

export default function applyConfig(config) {
  config.views.contentTypesViews.knowledge = (props) => "I'm a component";
  return config;
}
