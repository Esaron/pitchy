import React from "react"
import PropTypes from 'prop-types'
import { Button, TextField } from '@material-ui/core';
import LikeButton from "./LikeButton";

const projectBasePath = '/projects'

function readFile(files) {
  if (files && files[0]) {
    let fileUpload = new FormData();
    fileUpload.append('uploaded_image', files[0]);
    this.sendImageToController(formPayLoad)
  }
}

const ProjectForm = props => (
  <form id="project-form"
        className="project-form"
        autoComplete="off"
        method="post"
        action={`${projectBasePath}/${props.id ? props.name : ''}`}
        encType="multipart/form-data">
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
               disabled={props.id && !props.ownedByUser}
               defaultValue={props.description}
               multiline={true} />
    <TextField className="form-field"
               id="pitch-deck"
               name="pitch_deck"
               label="Pitch Deck"
               disabled={props.id && !props.ownedByUser}
               type="file" />
    <input type="hidden" name="authenticity_token" value={props.token} />
    <div className="project-actions">
      {(!props.id || props.ownedByUser) ? <Button className="form-field" type="submit">
        Save
      </Button> : null}
      {(props.id && props.loggedIn) ? <LikeButton name={props.name} liked={props.liked} /> : null}
    </div>
  </form>
)

ProjectForm.defaultProps = {
  id: '',
  name: null,
  description: null,
  ownedByUser: false,
  liked: false,
  loggedIn: false,
}

ProjectForm.propTypes = {
  id: PropTypes.number,
  name: PropTypes.string,
  description: PropTypes.string,
  ownedByUser: PropTypes.bool,
  liked: PropTypes.bool,
  loggedIn: PropTypes.bool,
  token: PropTypes.string,
}

export default ProjectForm
