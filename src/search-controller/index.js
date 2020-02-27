import React from 'react';
import {requireNativeComponent} from 'react-native';

const RNSearchControllerView = requireNativeComponent('RNSearchControllerView');

export const SearchControllerView = ({style}) => {
  return <RNSearchControllerView style={style} />;
};
