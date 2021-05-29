import React from "react"
import PropTypes from 'prop-types'
import { Button, TextField } from '@material-ui/core';
import LikeButton from "./LikeButton";
import PitchDeck from "./PitchDeck";

const projectBasePath = '/projects'

const ProjectForm = props => (
  <div>
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
      {(!props.id || props.ownedByUser) ? <TextField className="form-field"
                 id="pitch-deck"
                 name="pitch_deck"
                 label="Pitch Deck"
                 disabled={props.id && !props.ownedByUser}
                 type="file" /> : null}
      <input type="hidden" name="authenticity_token" value={props.token} />
      <div className="project-actions">
        {(!props.id || props.ownedByUser) ?
            <Button className="form-field" type="submit">Save</Button> : null}
        {(props.id && props.loggedIn) ?
            <LikeButton projectName={props.name} liked={props.liked} /> : null}
      </div>
    </form>
    <PitchDeck projectName={props.name} />
  </div>
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
