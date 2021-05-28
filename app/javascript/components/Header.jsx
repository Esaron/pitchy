import React from "react"
import PropTypes from 'prop-types'
import { Button } from '@material-ui/core';

function logoutButton(token, userSignedIn) {
  if (userSignedIn) {
    return (
      <form className="buttonTo" method="post" action="/users/sign_out">
        <Button color="primary" type="submit">Log Out</Button>
        <input type="hidden" name="_method" value="delete" />
        <input type="hidden" name="authenticity_token" value={token} />
      </form>
    )
  }
}

const Header = props => (
  <div className='header'>
    <h1 style={{margin: 0}}>Pitchy</h1>
    {logoutButton(props.token, props.userSignedIn)}
  </div>
)

Header.defaultProps = {
  userSignedIn: false,
}

Header.propTypes = {
  token: PropTypes.string,
  userSignedIn: PropTypes.bool,
}

export default Header
