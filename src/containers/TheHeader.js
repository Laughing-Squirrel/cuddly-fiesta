import React from 'react'
import {
  CHeader,
  CHeaderBrand,
  CHeaderNav
} from '@coreui/react'
import CIcon from '@coreui/icons-react'

import { 
  TheHeaderDropdown
}  from './index'

const TheHeader = () => {
  return (
    <CHeader withSubheader>
      <CHeaderBrand className="mx-auto d-lg-none" to="/">
        <CIcon name="logo" height="80" alt="Logo"/>
      </CHeaderBrand>
      <CHeaderNav className="px-3" align="right">
        <TheHeaderDropdown/>
      </CHeaderNav>
    </CHeader>
  )
}

export default TheHeader
