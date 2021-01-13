import React from 'react'
import CIcon from '@coreui/icons-react'

export default [
  {
    _tag: 'CSidebarNavItem',
    name: 'Dashboard',
    to: '/dashboard',
    icon: <CIcon name="cil-speedometer" customClasses="c-sidebar-nav-icon"/>,
    badge: {
      color: 'info',
      text: 'NEW!',
    }
  },
  {
    _tag: 'CSidebarNavTitle',
    _children: ['Request']
  },
  {
    _tag: 'CSidebarNavItem',
    name: 'Create New Request',
    to: '/base/navs',
    icon: 'cil-file',
  },
  {
    _tag: 'CSidebarNavItem',
    name: 'View Existing Request',
    to: '/base/paginations',
    icon: 'cil-pencil',
  },
  {
    _tag: 'CSidebarNavDivider',
    className: 'm-2'
  },

  {
    _tag: 'CSidebarNavTitle',
    _children: ['Manage']
  },
  {
    _tag: 'CSidebarNavItem',
    name: 'Inventory Processes',
    to: '/base/navs',
    icon: 'cil-puzzle',
  },
  {
    _tag: 'CSidebarNavItem',
    name: 'Configuration',
    to: '/base/paginations',
    icon: 'cil-cursor',
  },
{
    _tag: 'CSidebarNavDropdown',
    name: 'Reports',
    route: '/base/paginations',
    icon: 'cil-star',
    _children: [
      {
        _tag: 'CSidebarNavItem',
        name: 'Report 1',
        to: '/base/paginations',
        badge: {
          color: 'success',
          text: 'NEW',
        },
      },
      {
        _tag: 'CSidebarNavItem',
        name: 'Report 2',
        to: '/base/paginations',
      },
      {
        _tag: 'CSidebarNavItem',
        name: 'Report 3',
        to: '/base/paginations',
      },
    ],
  },
  {
    _tag: 'CSidebarNavDivider',
    className: 'm-2'
  }
]
