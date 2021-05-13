import React, { useEffect } from "react";
import useAPI from "../utils/useAPI"

export default () => {
  const [{ data, loading, error }, refetch] = useAPI(
    {
      url: '/status',
      method: 'GET'
    },
    { manual: false }
  )

  useEffect(() => {
    const refreshInterval = setInterval(() => refetch(), 10000)
    return () => clearInterval(refreshInterval)
  }, [])

  return ((
    <div className="vw-100 vh-100 primary-color d-flex align-items-center justify-content-center">
      <div className="jumbotron jumbotron-fluid bg-transparent">
        <div className="container secondary-color">
          <h1 className="display-4">Status</h1>
          {loading && <p className="text-info">Loading...</p>}
          {error && <p className="text-danger">Error!</p>}
          {data && <h3
            className={`text-center ${data.status === 'ok' ? 'text-success' : 'text-danger'}`}>
            {data.status}
          </h3>}
        </div>
      </div>
    </div>
  ))
};