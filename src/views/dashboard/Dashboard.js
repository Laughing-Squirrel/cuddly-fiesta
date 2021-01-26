import React from 'react'

import {
  CCard,
  CCardBody,
  CCardFooter,
  CCol,
  CProgress,
  CRow
} from '@coreui/react'

import UserService from "~/src/services/UserService";
import RenderOnRole from "~/src/containers/RenderOnRole";
import RenderOnAuthenticated from "~/src/containers/RenderOnAuthenticated";


const Dashboard = () => {
  return (
     <RenderOnAuthenticated>
      <CCard>
        <CCardBody>
          <CRow>
            <h1>
            Welcome {UserService.getUsername()}&nbsp;
            <button className="btn btn-success" onClick={UserService.doLogout}>Logout</button>
            </h1>          
          </CRow>
          <CRow>
            <CCol sm="5">
              <h4 id="traffic" className="card-title mb-0">Traffic</h4>
              <div className="small text-muted">November 2017</div>
            </CCol>
          </CRow>
        </CCardBody>
     <RenderOnRole> 
        <CCardFooter>
          <CRow className="text-center">
            <CCol md sm="12" className="mb-sm-2 mb-0">
              <div className="text-muted">Visits</div>
              <strong>29.703 Users (40%)</strong>
              <CProgress
                className="progress-xs mt-2"
                precision={1}
                color="success"
                value={40}
              />
            </CCol>
          </CRow>
        </CCardFooter>
     </RenderOnRole>
   </CCard>
 </RenderOnAuthenticated>
  )
}

export default Dashboard
