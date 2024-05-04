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
    Grid,
    Typography,
    Container,
    Divider,
    Card,
    CardContent,
    Chip,
    Avatar,
    Stack,
    TextField,
    Button
} from "@mui/material";
import {
    useNavigate,
    useParams
} from "react-router-dom";
import {
    gql,
    useMutation,
    useQuery
} from "@apollo/client";
import {
    useEffect,
    useState
} from "react";
import LikeCount from "../components/LikeCount";
import StarRate from "@mui/icons-material/StarRate";
import QueryResult from "../components/QueryResult";
import PageContent from "../components/PageContent";
import PlaceHolderImage from "../resources/placeholder.jpg"

const GET_PLACE = gql`
    fragment PlaceWithPrice on PlaceWithEntranceFee{
        id
        fee
    }

    query getPlace($placeId: ID!) {
        place(placeId: $placeId) {
            id # for subsequent calls
            name
            city
            country
            population
            timezone
            rating
            ...PlaceWithPrice
            reviews {
                author {
                    id # for subsequent calls
                    username
                }
                rating
                content
            }
        }
    }
`

const REVIEW_SUBSCRIPTION = gql`
    subscription OnReviewAdded($placeId:Int!){
        reviews(placeId: $placeId) {
            place{
                rating
                reviews {
                    author {
                        id # for subsequent calls
                        username
                    }
                    rating
                    content
                }
            }
        }
    }
`;

export default function PlacePage() {
    const { placeId } = useParams()
    const { subscribeToMore, error, loading, data } = useQuery(GET_PLACE, {
        variables: { placeId }
    })

    return (
        <PageContent>
            <QueryResult error={error} loading={loading} data={data}>
                {
                    data ? <PlaceDetails
                        place={data.place}
                        subscribeToNewReviews={() => {
                            subscribeToMore({
                                document: REVIEW_SUBSCRIPTION,
                                variables: { placeId: data.place.id },
                                updateQuery: (prev, { subscriptionData }) => {
                                    if (!subscriptionData.data) return prev

                                    const newReview = subscriptionData.data.reviews;

                                    return Object.create({
                                        place: {
                                            ...prev.place,
                                            rating: newReview.place.rating,
                                            reviews: [...newReview.place.reviews]
                                        }
                                    })
                                }
                            })
                        }}
                    /> : ""
                }
            </QueryResult>
        </PageContent>
    )
}

const LIKE_COUNT_LIMIT = 5;
const PlaceDetails = ({ place, subscribeToNewReviews }) => {
    const {
        id,
        name,
        city,
        country,
        rating,
        reviews,
        fee,
        population,
        timezone
    } = place;

    useEffect(() => {
        subscribeToNewReviews()
    }, [])

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
            <Box
                component="img"
                sx={{
                    objectFit: "cover",
                    width: "calc(100% + 2rem)",
                    borderRadius: "0.5rem",
                }}
                alt={name}
                src={PlaceHolderImage}
            />
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
                    component="h1"
                    variant="h1">
                    {name}
                </Typography>

                <Divider sx={{ bgcolor: "primary.main", width: "100%" }} />

                <Grid container justifyContent="center">
                    <Grid item xs={6} display="flex" alignItems="center" gap="0.5rem" flexWrap="wrap">
                        <Typography variant="p">Location:</Typography>
                        <Typography variant="span" component="span" color="secondary" fontWeight="bold">{city}, {country}</Typography>
                    </Grid>

                    <Grid item xs={6} display="flex" alignItems="center" gap="0.5rem" flexWrap="wrap">
                        <Typography variant="p">
                            Rating:
                        </Typography>
                        {rating !== null ?
                            <LikeCount count={Math.round(rating)} limit={LIKE_COUNT_LIMIT} /> :
                            <Typography variant="span" component="span" color="secondary" fontWeight="bold">No ratings yet!</Typography>
                        }
                    </Grid>

                    {fee ?
                        <Grid item xs={12}>
                            <Typography variant="p">
                                Fee: <Typography variant="span" fontWeight="bold" color="secondary">${fee}</Typography>
                            </Typography>
                        </Grid> : ""}

                    <Grid item xs={12}>
                        <Typography variant="h5" textAlign="center" margin="1rem 0" fontWeight="bold">
                            More about {city}, {country}
                        </Typography>
                    </Grid>

                    <Grid item xs={6} display="flex" alignItems="center" gap="0.5rem" flexWrap="wrap">
                        <Typography variant="p">Population:</Typography>
                        <Typography variant="span" component="span" color="secondary" fontWeight="bold">{population}</Typography>
                    </Grid>

                    <Grid item xs={6} display="flex" alignItems="center" gap="0.5rem" flexWrap="wrap">
                        <Typography variant="p">Time zone:</Typography>
                        <Typography variant="span" component="span" color="secondary" fontWeight="bold">{timezone}</Typography>
                    </Grid>
                </Grid>

                <Typography
                    marginTop="2rem"
                    textAlign="center"
                    component="h4"
                    variant="h4"
                    fontWeight="bold">
                    Reviews
                </Typography>

                {
                    reviews.length === 0 ?
                        <Typography variant="p" component="p">No reviews yet!</Typography> :
                        reviews.map((review, index) => (
                            <Review key={index} review={review} />
                        ))
                }

                <UserReview placeId={id} />
            </Box>
        </Container>
    );
};

const Review = ({ review }) => {
    const navigage = useNavigate()

    return (
        <Card
            sx={{
                width: "100%",
                ":hover": {
                    cursor: "pointer",
                    background: "var(--primary-color-light1)",
                }
            }}
            onClick={() => navigage(`/author/${review.author.id}`)}
        >
            <CardContent>
                <Stack
                    direction={"row"}
                    gap={"0.5rem"}
                    alignItems="baseline"
                    justifyContent="space-between"
                >
                    <Chip
                        avatar={<Avatar>{review.author.username[0]}</Avatar>}
                        variant="outlined"
                        color="secondary"
                        label={review.author.username}
                        sx={{ marginBottom: "1rem" }}
                    />
                    <LikeCount count={review.rating} limit={LIKE_COUNT_LIMIT} />
                </Stack>
                <Typography
                    gutterBottom
                    variant="p"
                    component="p"
                >
                    {review.content}
                </Typography>
            </CardContent>
        </Card>
    )
}

const SUBMIT_REVIEW = gql`
  mutation addReview($rating: Int!, $reviewContent: String!, $placeId: Int!) {
    addReview(
      reviewInput: {
        rating: $rating, 
        content: $reviewContent, 
        placeId: $placeId, 
        authorId: 5003
      }) {
      id
      rating
      content
      place{
        id
      }
      author{
        username
      }
    }
  }
  
`;

const UserReview = ({ placeId }) => {
    const [rating, setRating] = useState(0)
    const [content, setContent] = useState("")
    const [submitReview, { reset }] = useMutation(SUBMIT_REVIEW)

    const handleRatingChange = (newRating) => {
        setRating(newRating)
    }

    const handleContentChange = (event) => {
        setContent(event.target.value)
    }

    const handleSubmit = () => {
        // Submit the review to graphql endpoint
        submitReview({ variables: { rating: rating, reviewContent: content, placeId: placeId } })
        reset()
        resetReview()
    }

    const resetReview = () => {
        setRating(0)
        setContent("")
    }

    return (
        <Card
            sx={{
                width: "100%"
            }}
            elevation={5}
        >
            <CardContent>
                <Stack
                    direction={"row"}
                    gap={"0.5rem"}
                    alignItems="baseline"
                    justifyContent="space-between"
                >
                    <Chip
                        avatar={<Avatar>S</Avatar>}
                        variant="outlined"
                        color="primary"
                        label={"You"}
                        sx={{ marginBottom: "1rem" }}
                    />

                    <UserLikeCount rating={rating} handleRatingChange={handleRatingChange} />
                </Stack>

                <Stack
                    direction={"column"}
                    gap={"0.5rem"}
                    alignItems="end"
                >
                    <TextField
                        variant="standard"
                        label="Add a review..."
                        fullWidth
                        value={content}
                        onChange={handleContentChange} />

                    <Stack direction="row" gap="1rem">
                        <Button
                            sx={{ width: "fit-content" }}
                            variant="text"
                            color="secondary"
                            disabled={!(rating > 0 || content.length > 0)}
                            onClick={resetReview}
                        >
                            Cancel
                        </Button>
                        <Button
                            sx={{ width: "fit-content", color: "white" }}
                            variant="contained"
                            disabled={!(rating > 0 && content.length > 0)}
                            onClick={handleSubmit}>
                            Add Review
                        </Button>
                    </Stack>
                </Stack>
            </CardContent>
        </Card>
    )
}

const UserLikeCount = ({ rating, handleRatingChange }) => {
    let stars = [];

    for (let starCount = 0; starCount < LIKE_COUNT_LIMIT; starCount++) {
        if (starCount < rating) {
            stars.push(<StarRate color="primary" key={starCount} sx={{ fontSize: "1rem" }} onClick={() => handleRatingChange(starCount + 1)} />)
        } else {
            stars.push(<StarRate color="secondary" key={starCount} sx={{ fontSize: "1rem" }} onClick={() => handleRatingChange(starCount + 1)} />)
        }
    }

    return (
        <Stack direction="row" gap="0.1rem" sx={{
            ":hover": {
                cursor: "pointer"
            }
        }}>
            {stars}
        </Stack>
    )
}
