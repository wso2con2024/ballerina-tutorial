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
    Box,
    Typography,
    Container,
    Divider,
    Card,
    CardContent,
    Chip,
    Stack
} from "@mui/material";
import {
    useNavigate,
    useParams
} from "react-router-dom";
import {
    gql,
    useQuery
} from "@apollo/client";
import Place from "@mui/icons-material/Place";
import LikeCount from "../components/LikeCount";
import PageContent from "../components/PageContent";
import QueryResult from "../components/QueryResult";
import LocationCity from "@mui/icons-material/LocationCity";

const GET_AUTHOR = gql`
    query getAuthor($authorId: ID!) {
        author(authorId: $authorId) {
            username
            reviews {
                place {
                    id # for subsequent calls
                    name
                    city
                    country
                }
                rating
                content
            }
        }
    }
`

export default function AuthorPage() {
    const { authorId } = useParams()
    const { error, loading, data } = useQuery(GET_AUTHOR, {
        variables: { authorId },
        fetchPolicy: "cache-and-network"
    })

    return (
        <PageContent>
            <QueryResult error={error} loading={loading} data={data}>
                {
                    data ? <AuthorDetails author={data.author} /> : ""
                }
            </QueryResult>
        </PageContent>
    )
}

const AuthorDetails = ({ author }) => {
    const {
        username,
        reviews
    } = author

    return (
        <Container
            sx={{
                display: "flex",
                flexDirection: "column",
                alignItems: "center",
                gap: "1rem",
                maxWidth: {
                    sm: "40rem",
                    md: "48rem",
                }
            }}>
            <Typography
                variant="h1"
                component="h1" color="secondary">
                {username}
            </Typography>

            <Box
                sx={{
                    display: "flex",
                    flexDirection: "column",
                    alignItems: "center",
                    gap: "0.5rem",
                    backgroundColor: "#ffffff",
                    padding: "1rem",
                    width: "100%",
                    borderRadius: "0.5rem"
                }}>
                <Typography
                    textAlign="center"
                    component="h2"
                    variant="h2">
                    Reviews
                </Typography>

                <Divider sx={{ bgcolor: "primary.main", width: "100%" }} />
                <Box
                    sx={{
                        display: "flex",
                        flexDirection: "column",
                        flexWrap: "wrap",
                        justifyContent: "center",
                        width: "100%",
                        gap: "1rem",
                    }}
                >
                    {reviews.map((reviewObject, index) => (
                        <PlaceCard key={index} place={reviewObject.place} review={reviewObject.content} rating={reviewObject.rating} />
                    ))}
                </Box>
            </Box>
        </Container>
    );
};

const LIKE_COUNT_LIMIT = 5;
const PlaceCard = ({ place, review, rating }) => {
    const navigage = useNavigate()

    const {
        id,
        name,
        country,
        city
    } = place

    return (
        <Card
            sx={{
                width: "100%",
                ":hover": {
                    cursor: "pointer",
                    background: "var(--primary-color-light1)",
                },
                minHeight: "100%"
            }}
            onClick={() => navigage(`/place/${id}`)}
        >
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
                            color: "primary.main"
                        }}
                    >
                        {name}
                    </Typography>
                    <LikeCount count={rating} limit={LIKE_COUNT_LIMIT} />
                </Stack>
                <Stack direction={"row"} gap={"0.5rem"}>
                    <Chip
                        variant="outlined"
                        color="secondary"
                        icon={<Place />}
                        label={country}
                    />
                    <Chip
                        variant="outlined"
                        color="secondary"
                        icon={<LocationCity />}
                        label={city}
                    />
                </Stack>
                <Typography
                    gutterBottom
                    variant="p"
                    component="p"
                >
                    {review}
                </Typography>
            </CardContent>
        </Card>
    )
}
