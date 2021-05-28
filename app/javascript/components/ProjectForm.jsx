import React from "react"
import PropTypes from 'prop-types'
import { Button, TextField } from '@material-ui/core';

const projectBasePath = "/projects"
const createPath = `${projectBasePath}/create`
const updatePath = `${projectBasePath}/update`

const ProjectForm = props => (
    <form className="project-form" autoComplete="off" action={!!props.id ? updatePath : createPath}>
      <TextField id="project-name" label="Name" disabled={!!props.id} defaultValue={props.name} />
      <TextField id="project-description" label="Description" defaultValue={props.description} />
      <Button type="submit">
        Save
      </Button>
    </form>
)

ProjectForm.defaultProps = {
  id: null,
  name: null,
  description: null,
}

ProjectForm.propTypes = {
  name: PropTypes.string,
  description: PropTypes.string,
}

export default ProjectForm
