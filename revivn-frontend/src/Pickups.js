import * as React from "react";
import Table from "@mui/material/Table";
import TableBody from "@mui/material/TableBody";
import TableCell from "@mui/material/TableCell";
import TableContainer from "@mui/material/TableContainer";
import TableHead from "@mui/material/TableHead";
import TableRow from "@mui/material/TableRow";
import Paper from "@mui/material/Paper";
import axios from "axios";
import { Link } from "react-router-dom";

export default function Pickups() {
  const [data, setData] = React.useState([]);
  const [loading, setLoading] = React.useState(true);

  const [statusData, setStatusData] = React.useState([]);
  const [statusLoading, setStatusLoading] = React.useState(true);

  React.useEffect(() => {
    // Define the URL for your GET request
    const apiUrl = "http://localhost:3000/pickups"; // Replace with your API endpoint
    const apiUrl2 = "http://localhost:3000/pickup_statuses"; // Replace with your API endpoint

    // Make a GET request using Axios
    axios
      .get(apiUrl)
      .then((response) => {
        setData(response.data); // Update the state with the response data
        setLoading(false); // Set loading to false
      })
      .catch((error) => {
        console.error("Error fetching data:", error);
        setLoading(false); // Set loading to false in case of an error
      });
    axios
      .get(apiUrl2)
      .then((response) => {
        setStatusData(response.data); // Update the state with the response data
        setStatusLoading(false); // Set loading to false
      })
      .catch((error) => {
        console.error("Error fetching data:", error);
        setStatusLoading(false); // Set loading to false in case of an error
      });
  }, []);

  function getStatus(status_id) {
    let d = statusData.filter((x) => x.id === status_id);
    if (d && d.length > 0) {
      return d[0].name;
    } else {
      return "N/A";
    }
  }

  function getLocation(city, state) {
    if (city && state) {
      return `${city},${state}`;
    }
    return "N/A";
  }

  function getPickupTime(pickup_datetime) {
    if (pickup_datetime) {
      let dateWithoutSecond = new Date(pickup_datetime);
      return dateWithoutSecond.toLocaleTimeString([], {
        year: "numeric",
        month: "numeric",
        day: "numeric",
        hour: "2-digit",
        minute: "2-digit",
      });
    }
    return "N/A";
  }

  return (
    <React.Fragment>
      <Link to="/pickups/new">Add a new Pickup</Link>
      {loading && statusLoading ? (
        <div>"loading"</div>
      ) : (
        <TableContainer component={Paper}>
          <Table sx={{ minWidth: 650 }} aria-label="simple table">
            <TableHead>
              <TableRow>
                <TableCell>Pickup Date</TableCell>
                <TableCell align="right">Location</TableCell>
                <TableCell align="right">Status</TableCell>
              </TableRow>
            </TableHead>
            <TableBody>
              {data.map((row) => (
                <TableRow
                  key={row.id}
                  sx={{ "&:last-child td, &:last-child th": { border: 0 } }}
                >
                  <TableCell component="th" scope="row">
                    {getPickupTime(row.pickup_datetime)}
                  </TableCell>
                  <TableCell align="right">
                    {getLocation(row.city, row.state)}
                  </TableCell>
                  <TableCell align="right">
                    {getStatus(row.pickup_status_id)}
                  </TableCell>
                </TableRow>
              ))}
            </TableBody>
          </Table>
        </TableContainer>
      )}
    </React.Fragment>
  );
}
