import React from "react"
import PropTypes from 'prop-types'
import axios from 'axios'
import { Button } from '@material-ui/core';
import FavoriteIcon from '@material-ui/icons/Favorite';
import FavoriteBorderIcon from '@material-ui/icons/FavoriteBorder';

const projectBasePath = '/projects'

class LikeButton extends React.Component {
  constructor(props) {
    super(props)
    this.state = { liked: props.liked }
  }

  async toggleLike() {
    await axios.post(`${projectBasePath}/${this.props.name}/likes/toggle`)
    this.setState({ liked: !this.state.liked })
  }

  render() {
    return (
      <Button className="form-field" onClick={this.toggleLike.bind(this)}>
        {this.state.liked ? <FavoriteIcon /> : <FavoriteBorderIcon /> }
      </Button>
    )
  }
}

LikeButton.defaultProps = {
  project_name: null,
  liked: false,
}

LikeButton.propTypes = {
  name: PropTypes.string,
  liked: PropTypes.bool,
}

export default LikeButton
