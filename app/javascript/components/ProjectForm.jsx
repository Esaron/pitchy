import React from "react"
import PropTypes from 'prop-types'
import { Button, TextField } from '@material-ui/core';
import LikeButton from "./LikeButton";

const projectBasePath = '/projects'

const ProjectForm = props => (
  <form id="project-form"
        className="project-form"
        autoComplete="off"
        method="post"
        action={`${projectBasePath}/${props.id ? props.name : ''}`}>
    <TextField className="form-field"
               id="project-name"
               name="name"
               label="Name"
               disabled={!!props.id}
               defaultValue={props.name} />
    <TextField className="form-field"
               id="project-description"
               name="description"
               label="Description"
               defaultValue={props.description}
               multiline={true} />
    <input type="hidden" name="authenticity_token" value={props.token} />
    <div className="project-actions">
      <Button className="form-field" type="submit">
        Save
      </Button>
      {!!props.id ? <LikeButton name={props.name} liked={props.liked} /> : null}
    </div>
  </form>
)

ProjectForm.defaultProps = {
  id: '',
  name: null,
  description: null,
  ownedByUser: false,
  liked: false,
}

ProjectForm.propTypes = {
  id: PropTypes.number,
  name: PropTypes.string,
  description: PropTypes.string,
  ownedByUser: PropTypes.bool,
  liked: PropTypes.bool,
  token: PropTypes.string,
}

export default ProjectForm
