import { React, useState, useEffect } from "react";
import { DateTimePicker } from "@mui/x-date-pickers";
import { AdapterDayjs } from "@mui/x-date-pickers/AdapterDayjs";
import { LocalizationProvider } from "@mui/x-date-pickers/LocalizationProvider";
import TextField from "@mui/material/TextField";
import Button from "@mui/material/Button";
import Select from "@mui/material/Select";
import MenuItem from "@mui/material/MenuItem";
import axios from "axios";
import { useNavigate } from "react-router-dom";

function AddPickup() {
  const [value, setValue] = useState("");
  const [pickupItems, setPickupItems] = useState([]);
  const [statusData, setStatusData] = useState([]);
  const [address, setAddress] = useState("");
  const [address2, setAddress2] = useState("");
  const [city, setCity] = useState("");
  const [state, setState] = useState("");
  const [zip, setZip] = useState("");
  const navigate = useNavigate("");

  function addPickupItem() {
    let itemsLength = pickupItems.length;
    setPickupItems([
      ...pickupItems,
      {
        internal_id: itemsLength + 1,
        hardware_type_id: 1,
        quantity: 0,
        description: "",
      },
    ]);
  }

  function savePickup() {
    let data = {
      pickup: {
        user_id: 1,
        org_id: 1,
        address: address,
        address2: address2,
        city: city,
        state: state,
        zip: zip,
        pickup_datetime: value.toISOString(),
      },
    };

    pickupItems.forEach((x) => delete x.internal_id);

    data.pickup.pickup_items_attributes = pickupItems;

    axios
      .post("http://localhost:3000/pickups", data, {
        headers: {
          "Content-Type": "application/json",
        },
      })
      .then((response) => {
        console.log("Data posted successfully:", response.data);
        navigate("/pickups");
      })
      .catch((error) => {
        console.error("Error posting data:", error);
      });
  }

  useEffect(() => {
    const apiUrl2 = "http://localhost:3000/hardware_types";
    axios
      .get(apiUrl2)
      .then((response) => {
        setStatusData(response.data);
      })
      .catch((error) => {
        console.error("Error fetching data:", error);
      });

    const apiUrl = "http://localhost:3000/orgs/1";
    axios
      .get(apiUrl)
      .then((response) => {
        setAddress(response.data.address);
        setAddress2(response.data.address2);
        setCity(response.data.city);
        setZip(response.data.zip);
        setState(response.data.state);
      })
      .catch((error) => {
        console.error("Error fetching data:", error);
      });
  }, []);

  return (
    <div style={{ margin: "10px" }}>
      <h2>Add New Pickup</h2>
      <p>Add a pickup:</p>
      <LocalizationProvider dateAdapter={AdapterDayjs}>
        <DateTimePicker
          label="Pickup Date and Time"
          value={value}
          onChange={(newValue) => setValue(newValue)}
        />
      </LocalizationProvider>
      <p>
        <TextField
          id="outlined-basic"
          onChange={(event) => {
            setAddress(event.target.value);
          }}
          value={address}
          variant="outlined"
        />
        <TextField
          style={{ marginLeft: "2px" }}
          id="outlined-basic"
          onChange={(event) => {
            setAddress2(event.target.value);
          }}
          value={address2}
          variant="outlined"
        />
      </p>
      <p>
        <TextField
          id="outlined-basic"
          onChange={(event) => {
            setCity(event.target.value);
          }}
          value={city}
          variant="outlined"
        />
        <TextField
          style={{ marginLeft: "2px" }}
          id="outlined-basic"
          onChange={(event) => {
            setZip(event.target.value);
          }}
          value={zip}
          variant="outlined"
        />
        <TextField
          style={{ marginLeft: "2px" }}
          id="outlined-basic"
          onChange={(event) => {
            setState(event.target.value);
          }}
          value={state}
          variant="outlined"
        />
      </p>
      <Button onClick={addPickupItem}>Add Item</Button>
      {pickupItems.map((row) => (
        <div key={row.internal_id} style={{ marginTop: "10px" }}>
          <Select
            onChange={(event) => {
              let items = [...pickupItems];
              let pickupItem = items.find(
                (x) => x.internal_id === row.internal_id
              );
              pickupItem.hardware_type_id = event.target.value;
              setPickupItems(items);
            }}
            value={row.hardware_type_id}
          >
            {statusData.map((status) => (
              <MenuItem key={status.id} value={status.id}>
                {status.name}
              </MenuItem>
            ))}
          </Select>
          <TextField
            style={{ marginLeft: "2px" }}
            id="outlined-basic"
            label="Description"
            variant="outlined"
            onChange={(event) => {
              let items = [...pickupItems];
              let pickupItem = items.find(
                (x) => x.internal_id === row.internal_id
              );
              pickupItem.description = event.target.value;
              setPickupItems(items);
            }}
            value={row.description}
          />
          <TextField
            style={{ marginLeft: "2px" }}
            id="outlined-basic"
            label="Quantity"
            variant="outlined"
            onChange={(event) => {
              let items = [...pickupItems];
              let pickupItem = items.find(
                (x) => x.internal_id === row.internal_id
              );
              pickupItem.quantity = event.target.value;
              setPickupItems(items);
            }}
            value={row.quantity}
          />
        </div>
      ))}
      <Button onClick={savePickup}>Save Pickup</Button>
    </div>
  );
}

export default AddPickup;
