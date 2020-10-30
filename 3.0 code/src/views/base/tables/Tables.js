import React from 'react'
import {
  CCard,
  CCardBody,
  CCardHeader,
  CCol,
  CDataTable,
  CRow
} from '@coreui/react'
import { DocsLink } from 'src/reusable'

import usersData from '../../users/UsersData'

const fields = ['name','registered', 'role', 'status']

const Tables = () => {
  return (
    <>
      <CRow>
        <CCol xs="12" lg="6">
          <CCard>
            <CCardHeader>
              Simple Table
              <DocsLink name="CModal"/>
            </CCardHeader>
            <CCardBody>
            <CDataTable
              items={usersData}
              fields={fields}
              itemsPerPage={5}
              pagination
            />
            </CCardBody>
          </CCard>
        </CCol>

        <CCol xs="12" lg="6">
          <CCard>
            <CCardHeader>
              Striped Table
            </CCardHeader>
            <CCardBody>
            <CDataTable
              items={usersData}
              fields={fields}
              striped
              itemsPerPage={5}
              pagination
            />
            </CCardBody>
          </CCard>
        </CCol>
      </CRow>

      <CRow>

        <CCol xs="12" lg="6">
          <CCard>
            <CCardHeader>
              Condensed Table
            </CCardHeader>
            <CCardBody>
            <CDataTable
              items={usersData}
              fields={fields}
              size="sm"
              itemsPerPage={5}
              pagination
            />
            </CCardBody>
          </CCard>
        </CCol>

        <CCol xs="12" lg="6">
          <CCard>
            <CCardHeader>
              Bordered Table
            </CCardHeader>
            <CCardBody>
            <CDataTable
              items={usersData}
              fields={fields}
              bordered
              itemsPerPage={5}
              pagination
            />
            </CCardBody>
          </CCard>
        </CCol>

      </CRow>

      <CRow>
        <CCol>
          <CCard>
            <CCardHeader>
              Combined All Table
            </CCardHeader>
            <CCardBody>
            <CDataTable
              items={usersData}
              fields={fields}
              hover
              striped
              bordered
              size="sm"
              itemsPerPage={10}
              pagination
            />
            </CCardBody>
          </CCard>
        </CCol>
      </CRow>
        <CRow>
        <CCol>
          <CCard>
            <CCardHeader>
              Combined All dark Table
            </CCardHeader>
            <CCardBody>
            <CDataTable
              items={usersData}
              fields={fields}
              dark
              hover
              striped
              bordered
              size="sm"
              itemsPerPage={10}
              pagination
            />
            </CCardBody>
          </CCard>
        </CCol>
      </CRow>
    </>
  )
}

export default Tables
