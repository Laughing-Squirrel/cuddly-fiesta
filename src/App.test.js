import React from 'react'
import { shallow } from 'enzyme/build'
import App from './App'
import Dashboard from './views/dashboard/Dashboard.js'


it('mounts without crashing', () => {
  const wrapper = shallow(<App/>)
  wrapper.unmount()
})

it('mounts dashboard without crashing', () => {
  const wrapper = shallow(<Dashboard/>)
  wrapper.unmount()
})
