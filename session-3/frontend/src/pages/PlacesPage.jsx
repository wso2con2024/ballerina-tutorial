/**
 * Copyright (c) 2024, WSO2 LLC. (https://www.wso2.com).
 *
 * WSO2 Inc. licenses this file to you under the Apache License,
 * Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

import {
    Card,
    CardMedia,
    CardContent,
    Typography,
    Stack,
    Chip,
    Container,
    Box,
    Button,
    Menu,
    MenuItem
} from "@mui/material"
import {
    gql,
    useQuery
} from "@apollo/client"
import {
    useEffect,
    useState
} from "react"
import Place from '@mui/icons-material/Place'
import { useNavigate } from "react-router-dom"
import LikeCount from "../components/LikeCount"
import StarRate from "@mui/icons-material/StarRate"
import PageContent from "../components/PageContent"
import QueryResult from "../components/QueryResult"
import PlaceHolderImage from "../resources/placeholder.jpg"
import LocationCity from '@mui/icons-material/LocationCity'
import Abc from "@mui/icons-material/Abc"
import KeyBoardArrowDown from "@mui/icons-material/KeyboardArrowDown"

const GET_PLACES = gql`
    fragment PlaceWithPrice on PlaceWithEntranceFee{
        id
        fee
    }

    query getPlaces($city: String, $country: String, $sortByRating: Boolean!) {
        places(city: $city, country: $country, sortByRating: $sortByRating) {
            id # for subsequent calls
            name
            city
            country
            rating
            ...PlaceWithPrice
        }
    }
`

export default function PlacesPage() {
    const { error, loading, data, refetch } = useQuery(GET_PLACES, {
        variables: {
            city: null,
            country: null,
            sortByRating: false
        }
    })

    return (
        <PageContent>
            <QueryResult error={error} loading={loading} data={data}>
                {data ? <RenderPlaces places={data.places} refetch={refetch} /> : ""}
            </QueryResult>
        </PageContent>
    )
}

const RenderPlaces = ({ places, refetch }) => {
    const [city, setCity] = useState(null)
    const [country, setCountry] = useState(null)
    const [sortByRating, setSortByRating] = useState(false)
    const [anchorEl, setAnchorEl] = useState(null)
    const open = Boolean(anchorEl)

    const handleClick = (event) => {
        setAnchorEl(event.currentTarget);
    };

    const handleClose = () => {
        setAnchorEl(null);
    };

    const filterByCity = (cityName) => {
        if (cityName === city) {
            setCity(null)
        } else {
            setCity(cityName)
        }
    }

    const filterByCountry = (countryName) => {
        if (countryName === country) {
            setCountry(null)
        } else {
            setCountry(countryName)
        }

    }

    useEffect(() => {
        refetch({ city: city, country: country, sortByRating: sortByRating })
    }, [city, country, sortByRating])

    return (
        <Container sx={{
            display: "flex",
            flexDirection: "column",
            gap: "1rem",
        }}>
            <Button
                id="sort-button"
                aria-controls={open ? 'sort-menu' : undefined}
                aria-haspopup="true"
                aria-expanded={open ? 'true' : undefined}
                size="large"
                variant="contained"
                color="primary"
                sx={{
                    color: "#ffffff",
                    marginRight: "auto",
                    marginLeft: {
                        xs: "auto",
                        md: "5rem"
                    },
                    alignSelf: {
                        sm: "center",
                        md: "flex-start"
                    }
                }}
                endIcon={<KeyBoardArrowDown />}
                onClick={handleClick}
            >
                Sort by: {sortByRating ? "Rating" : "Name"}
            </Button>
            <Menu
                id="sort-menu"
                aria-labelledby="sort-button"
                anchorEl={anchorEl}
                open={open}
                onClose={handleClose}
                anchorOrigin={{
                    vertical: 'top',
                    horizontal: 'right',
                }}
                transformOrigin={{
                    vertical: 'top',
                    horizontal: 'right',
                }}
            >
                <MenuItem onClick={() => {
                    setSortByRating(true)
                    handleClose()
                }}>
                    <StarRate color="primary" />
                    Rating
                </MenuItem>
                <MenuItem onClick={() => {
                    setSortByRating(false)
                    handleClose()
                }}>
                    <Abc color="primary" />
                    Name (Default)
                </MenuItem>
            </Menu>

            <Box
                sx={{
                    display: "flex",
                    flexWrap: "wrap",
                    justifyContent: "center",
                    gap: "1rem"
                }}
            >
                {places.map((place) => {
                    return (
                        <PlaceCard
                            key={place.id}
                            place={place}
                            selectedCity={city}
                            selectedCountry={country}
                            filterByCity={filterByCity}
                            filterByCountry={filterByCountry}
                        />
                    )
                })}
            </Box>
        </Container>
    )
}

const LIKE_COUNT_LIMIT = 5;
const PlaceCard = ({ place, selectedCity, selectedCountry, filterByCity, filterByCountry }) => {
    const navigage = useNavigate()

    const {
        id,
        name,
        city,
        country,
        rating,
        fee
    } = place

    return (
        <Card
            sx={{
                width: "20rem"
            }}
        >
            <CardMedia
                component="img"
                alt={name}
                sx={{
                    height: "14rem",
                    objectFit: "cover",
                    ":hover": {
                        cursor: "pointer"
                    }
                }}
                image={PlaceHolderImage}
                onClick={() => navigage(`/place/${id}`)}
            />
            <CardContent sx={{
                display: "flex",
                flexDirection: "column",
                gap: "0.5rem"
            }}>
                <Stack
                    direction={"row"}
                    gap={"0.5rem"}
                    alignItems="baseline"
                    justifyContent="space-between"
                >
                    <Typography
                        gutterBottom
                        variant="h4"
                        component="h4"
                        sx={{
                            color: "secondary.main"
                        }}
                    >
                        {name}
                    </Typography>
                    {
                        rating !== null ? <LikeCount count={Math.round(rating)} limit={LIKE_COUNT_LIMIT} /> : ""
                    }
                </Stack>
                <Stack
                    direction={"row"}
                    gap={"0.5rem"}
                >
                    <Chip
                        variant={selectedCity === city ? "contained" : "outlined"}
                        color="secondary"
                        icon={<LocationCity />}
                        label={city}
                        onClick={() => filterByCity(city)}
                    />
                    <Chip
                        variant={selectedCountry === country ? "filled" : "outlined"}
                        color="secondary"
                        icon={<Place />}
                        label={country}

                        onClick={() => filterByCountry(country)}
                    />
                </Stack>
                {fee ?
                    <Typography variant="p" color="secondary">
                        Fee: <Typography variant="span" fontWeight="bold">${fee}</Typography>
                    </Typography> : ""
                }
            </CardContent>
        </Card>
    )
}
